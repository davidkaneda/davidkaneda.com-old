var DK = {
    views: [],
    models: [],
    collections: []
};

// Use bracket template syntax
_.templateSettings = {
  interpolate : /\{\{(.+?)\}\}/g
};

// Start the app
$(function(){
    $('#page-header a').click(function(){
        AppController.navigate($(this).attr('href').replace(/^(\/)/,''), true);
        return false;
    });

    window.app = new DK.views.AppView();
    window.AppController = new DK.AppController();
    Backbone.history.start({pushState: true});

});