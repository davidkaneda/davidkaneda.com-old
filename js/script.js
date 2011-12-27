(function(){
    /* Author: David Kaneda

    */

    var Router = Backbone.Router.extend({

        routes: {
            "tumblogs/:tumblog": "tumblogs",
            "projects/:project": "projects",
            "speaking/": "speaking"
        },

        tumblogs: function(tumblog){
            console.log('tumblogs');
        },

        projects: function(project){
            console.log('projects');
        },

        speaking: function(){
            console.log('speaking');
        }
    });

    var Tumblog = Backbone.Model.extend({
    });

    var ProjectsList = Backbone.View.extend({

      tagName: "div",

      className: "projects-list",

      events: {
        "click .icon":          "open",
        "click .button.edit":   "openEditDialog",
        "click .button.delete": "destroy"
      },

      render: function() {

      }

    });


    var App = Backbone.View.extend({

    });

    var router = new Router();
    Backbone.history.start({pushState: true});

    $('#page-footer a').click(function(){
        
        router.navigate($(this).attr('href'), true);
        return false;
    });

})();