module.exports = (srv => {

    srv.on('READ', ['Groups', 'GroupMemberships2'], async (req) => {
        const projectExtSrv = await cds.connect.to("ProjectServiceV2");
        const results = await projectExtSrv.run(req.query);
        // const results = await projectExtSrv.send({
        //     query: req.query, headers: { APIKey: process.env.API_KEY } 
        // });
        req.reply(results);
    });

    srv.on('READ', ['GroupMemberships'], async (req) => {
        const projectExtSrv = await cds.connect.to("ProjectServiceV2");
        const sQuery = SELECT.from("service.ProjectServiceV2.GroupMemberships", bp => {
            bp('*'),
            bp.toUser(user => {
              user('*')
            }),
            bp.toGroup(grp => {
                grp('*')
            })
        });
        const results = await projectExtSrv.send({
            query: sQuery,
            headers: { APIKey: process.env.API_KEY } 
        });
        req.reply(results);
    });
    
    srv.on('getProjects', async (req) => {
        const myService2 = await cds.connect.to("myService2");
        const results = await myService2.send({
            "method:": "GET",
            "path": "/getProjects()",
            "data": req.data
        });
        req.reply(results);
    });

    /**
     * Get the list of projects with some high priority tasks
     */
    srv.on('getProjectsWithHighPriorityTasks', async (req) => {
        const projSrv = await cds.connect.to("Projects");
        const results = await projSrv.getProjects();
        const highpriorityTasks = results.filter(proj => 
            proj.tasks.some(task =>
                task.priority === 'High'
            )
        );
        highpriorityTasks.$count = highpriorityTasks.length;
        req.reply(highpriorityTasks);

    });
})