DK.views.AppView = Backbone.View.extend({
    el: $(document.body),
    hasRestored: false,
    currentView: null,

    setLayout: function(layout){
        if (this.layout) {
            this.el.removeClass(this.layout);
        }
        this.layout = layout;
        this.el.addClass(layout);

        if (layout === list) {
            
        }
        this.el.one('webkitTransitionEnd', function(){
            console.log('transition ending for ' + layout);
        });

        // this.$('> div > div').hide();

        if (this.$('#' + layout)) {
            this.$('#' + layout).show();
        }

        if (layout != 'home') {
            this.hideDescription();
        } else {
            this.showDescription();
        }

        if (this.hasRestored === false) {
            this.el.removeClass('firstrun');
            this.hasRestored = true;
        }
    },

    setView: function(view) {
        this.currentView.remove();
    },

    hideDescription: function(instant){
        this.$('#home').fadeOut({
            duration: instant ? 0 : 250
        });
    },
    showDescription: function(instant){
        this.$('#home').fadeIn({
            duration: instant ? 0 : 250
        });
    }
});