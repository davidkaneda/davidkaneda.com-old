Spine = require('spine')
Page = require('controllers/page')
$ = Spine.$
Tmpl = require('spine/lib/tmpl')

class ProjectDetail extends Page

  constructor: (config) ->
    @project = config.project
    @el = require('views/detail')(@).appendTo '#content'
    @meta_title = @project.name
    $('body').addClass 'p-' + @project.stub
    super
    
    _gaq.push ['_trackPageview']
    # Load iframe in a callback for better animation
    setTimeout @loadiframe, 200 if @project.iframe


  remove: ->
    @el.remove()
    delete @el
    if @iframe then @iframe.remove()
    delete @iframe
    $('body').removeClass 'loading-frame p-' + @project.stub

  loadiframe: =>
    @iframe = $("<iframe frameborder=\"0\" border=\"0\" cellspacing=\"0\" class=\"bigiframe\" />").attr('src', @project.iframe).load(@onFrameLoad).appendTo('body').load(@onFrameLoad)
    $('body').addClass 'loading-frame'
  
  onFrameLoad: =>
    @iframe.addClass 'loaded'
    $('body').removeClass 'loading-frame'

module.exports = ProjectDetail