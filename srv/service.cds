using { ProjectDemand } from './external/ProjectDemand.cds'; 
using { Dev as my } from '../db/schema.cds';

using service.ProjectServiceV2 as ProjectServiceV2 from './external/ProjectServiceV2';

@path: '/service/Projects'
@requires: 'authenticated-user'
service Projects {
  @odata.draft.enabled
  entity Projects as projection on my.Projects;
  function getProjects() returns array of Projects;
  function getProjectsWithHighPriorityTasks() returns array of Projects;

  // External service
  entity Groups as projection on ProjectServiceV2.Groups;
  entity GroupMemberships as projection on ProjectServiceV2.GroupMemberships;

}