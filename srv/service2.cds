using { Dev as my } from '../db/schema.cds';

// using ProjectServiceV2 as ProjectServiceV2 from './external/ProjectServiceV2.csn';
using service.ProjectServiceV2 as ProjectServiceV2 from './external/ProjectServiceV2';
using ProjectDemand from './external/ProjectDemand';


@path: '/myService2'
service MyService {

    entity Projects as projection on my.Projects {
        *,
        projectDemand: Association to ProjectDemandLink on projectDemand.ProjectId = ID
    };
    entity Groups as projection on ProjectServiceV2.Groups;
    function getProjects() returns array of MyService.Projects;

    // Service Mashup
    entity ProjDemand as projection on ProjectDemand.A_ProjectDemand {
        key ProjectDemandUUID,
            ProjectDemand,
            ProjectDemandName as Name,
            ProjectDemandStatus as Status
    }

    entity ProjectDemandLink {
        key ProjectDemandUUID: UUID;
        key ProjectId: UUID;
        projectDemand: Association to ProjDemand on projectDemand.ProjectDemandUUID = ProjectDemandUUID;
    }

}