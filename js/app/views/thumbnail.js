DK.views.ThumbnailView = Backbone.View.extend({
    render: function(){
        $(this.el).html(this.model.name);
        return this;
    }
});