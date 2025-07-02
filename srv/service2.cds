using { Dev as my } from '../db/schema.cds';

// using ProjectServiceV2 as ProjectServiceV2 from './external/ProjectServiceV2.csn';
using service.ProjectServiceV2 as ProjectServiceV2 from './external/ProjectServiceV2';
using { ProjectDemand } from './external/ProjectDemand';


@path: '/myService2'
// @requires: 'authenticated-user'
service MyService {

    entity Projects as projection on my.Projects {
        *,
        projectDemand: Association to ProjectDemand on projectDemand.ProjectId = ID
    };
    entity Groups as projection on ProjectServiceV2.Groups;
    function getProjects() returns array of MyService.Projects;

    // Service Mashup
    entity ProjectDemand.A_ProjectDemand {
        key ProjectDemandUUID: UUID;
            ProjectDemand: String(24);
            ProjectDemandName: String(40);
            ProjectDemandStatus: String(5);
    }

    entity ProjectDemand {
        key ProjectDemandUUID: UUID;
        key ProjectId: UUID;
        projectDemand: Association to ProjectDemand.A_ProjectDemand on projectDemand.ProjectDemandUUID = ProjectDemandUUID;
    }

}