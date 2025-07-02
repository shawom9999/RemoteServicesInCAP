const {Projects} = cds.entities("Dev");

module.exports = (srv => {

    srv.on('getProjects', async (req) => {
        return await SELECT.from(Projects)
        .columns(proj => {
            proj.name,
            proj.description,
            proj.status,
            proj.startDate,
            proj.endDate,
            proj.tasks(task => {
                task.name,
                task.description,
                task.priority,
                task.dueDate,
                task.category(cat => {
                    cat.name,
                    cat.description
                })
            })
        })
    });

    srv.on('READ', ['Groups', 'ProjectDemand.A_ProjectDemand'], async (req) => {
        const projectExtSrv = await cds.connect.to("ProjectServiceV2");
        // const results = await projectExtSrv.run(req.query);
        const results = await projectExtSrv.send({
            query: req.query, headers: { APIKey: process.env.API_KEY } 
        });
        req.reply(results);
    });

    srv.on('READ', ['ProjectDemand'], async (req,next) => {
        if (!req.query.SELECT.columns) return next();
        const expandIndex = req.query.SELECT.columns.findIndex(
            ({ expand, ref }) => expand && ref[0] === "projectDemand"
        );
        if (expandIndex < 0) return next();

        // Remove expand from query
        req.query.SELECT.columns.splice(expandIndex, 1);

        // Make sure ProjectDemandUUID will be returned
        if (!req.query.SELECT.columns.indexOf('*') >= 0 &&
            !req.query.SELECT.columns.find(
                column => column.ref && column.ref.find((ref) => ref == "ProjectDemandUUID"))
        ) {
            req.query.SELECT.columns.push({ ref: ["ProjectDemandUUID"] });
        }

        const projects = await next();

        const asArray = x => Array.isArray(x) ? x : [ x ];

        // Request all associated project demand
        const projectDemandUUIDs = asArray(projects).map(ProjectDemand => ProjectDemand.ProjectDemandUUID);
        const projectExtSrv = await cds.connect.to("ProjectDemand");
        const demands = await projectExtSrv.run(SELECT.from('ProjectDemand.A_ProjectDemand').where({ ProjectDemandUUID: projectDemandUUIDs }));

        // Convert in a map for easier lookup
        const demandsMap = {};
        for (const demand of demands)
            demandsMap[demand.ProjectDemandUUID] = demand;

        // Add demands to result
        for (const note of asArray(projects)) {
            note.projectDemand = demandsMap[note.ProjectDemandUUID];
        }

        return projects;
    });
})