DK.AppController = Backbone.Router.extend({
    routes: {
        "tumblogs/:tumblog": "tumblogsController",
        "projects/:project": "projectsController",
        "presentations/": "presentationsController",
        "contact/": "contact",
        "*404": "notFound"
    },

    initialize: function(){
        this.projects = new DK.collections.Projects();
        this.stage = new DK.views.AppView();
        // console.log(this.stage);

    },

    tumblogsController: function(tumblog){
        this.stage.setLayout('list');
    },

    projectsController: function(project){
        if (project) {

            this.stage.setLayout('project-detail');
            
            this.projects.deferred.done(function(){
                // Get model
                var project_model = this.projects.find(function(p){
                    return p.get("stub") === project;
                });

                // Render view with model
                var detail = new DK.views.DetailView({
                    model: project_model
                });
                detail.render();
            });

        } else {
            // Make sure they're loaded
            this.stage.setLayout('list');
            this.projects.deferred.done(function(){
                $('#list').show();
            });
        }
    },

    presentationsController: function(){
        this.stage.setLayout('presentations');
    },

    notFound: function(unknown){
        if (unknown !== '') {
            // var fourohfour = new fourohfour();
            console.log('404');
        }
        this.stage.setLayout('home');
    }
});