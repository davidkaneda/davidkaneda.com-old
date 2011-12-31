(function(){
    
    Router = Backbone.Router.extend({
        routes: {
            "tumblogs/:tumblog": "tumblogs",
            "projects/:project": "projects",
            "speaking/": "speaking",
            "*404": "notFound"
        },

        tumblogs: function(tumblog){
            console.log(Backbone.history);

            console.log(this);
            $('body').css('backgroundColor', '#398D3E');
        },

        projects: function(project){
            console.log('Loading projects');
        },

        speaking: function(){
            console.log('speaking');
            $('body').css('backgroundColor', '#236CD4');
        },

        notFound: function(unknown){
            if (unknown !== '') {
                console.log('Page not found...');
            } else {
                console.log('Home');
            }
        }
    });

    var AppView = Backbone.View.extend({
        el: $(document.body),
        initialize: function(){
            this.main = this.$('div[role=main]');
        },
        exit: function(){
            this.main.fadeOut();
        },
        enter: function(){
            this.main.fadeIn();
        }
    });

    $('#page-footer a').click(function(){
        router.navigate($(this).attr('href'), true);
        return false;
    });


    // Define projects and get data

    var ProjectsCollection = Backbone.Collection.extend({
        url: '/data/projects.json',
        initialize: function(){
            this.deferred = this.fetch();
        }
    });

    var projects = new ProjectsCollection();

    // Thumbnails

    var ThumbnailView = Backbone.View.extend({
        render: function(){
            $(this.el).html(this.model.name);
            return this;
        }
    });

    // Project List View

    var ProjectsView = Backbone.View.extend({
        el: $('#projects'),
        initialize: function(){
            this.collection.deferred.done($.proxy(this.renderThumbs, this));
        },

        // Generate the thumbnails
        renderThumbs: function(models){
            _.each(models, function(model, i){
                var tnail = new ThumbnailView({
                    model: model,
                    id: 'thumbnail-' + i
                });
                tnail.render();
                this.el.append(tnail.el);
            }, this);
        }
    });

    var pview = new ProjectsView({
        collection: projects
    });



    // Use bracket template syntax

    _.templateSettings = {
      interpolate : /\{\{(.+?)\}\}/g
    };

    // Start the app

    var app = new AppView();
    var router = new Router();
    Backbone.history.start({pushState: true});

})();