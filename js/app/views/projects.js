DK.views.ProjectsView = Backbone.View.extend({
    el: $('#list'),
    initialize: function(){
        window.AppController.projects.loading.done($.proxy(this.renderThumbs, this));
    },

    // Generate the thumbnails
    renderThumbs: function(models){
        _.each(models, function(model, i){
            var tnail = new DK.views.ThumbnailView({
                model: model,
                id: 'thumbnail-' + i
            });
            this.el.append(tnail.render().el);
        }, this);
        this.isotope();
    },
    isotope: function(){
        this.el.isotope({
          itemSelector : '.project'
        });
    }
});