Spine = require('spine')

class Page extends Spine.Controller
  meta_description: 'All about Dave.'
  meta_title: 'David Kaneda'
  constructor: ->
    window.document.title = @meta_title
    $('meta[name=description').html(@meta_description);
    super

module.exports = Page