DK.collections.Projects = Backbone.Collection.extend({
    url: '/data/projects.json',
    initialize: function(){
        this.deferred = this.fetch();
    }
});