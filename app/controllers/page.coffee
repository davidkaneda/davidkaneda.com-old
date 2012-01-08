Spine = require('spine')

class Page extends Spine.Controller
  meta_description: 'All about Dave.'
  meta_title: 'David Kaneda'
  constructor: ->
    @setTitle 'David Kaneda' + (' - ' + @meta_title) if @meta_title

    $('meta[name=description').html(@meta_description);
    super

  setTitle: (title) ->
    window.document.title = title

module.exports = Page