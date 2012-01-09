Spine = require('spine')
Page = require('controllers/page')
$ = Spine.$
Tmpl = require('spine/lib/tmpl')

class ProjectDetail extends Page

  constructor: (config) ->
    @project = config.project
    @el = require('views/detail')(@)
    $('#content').append(@el)
    @meta_title = @project.name
    $('body').addClass 'p-' + @project.stub
    
    super
    setTimeout @loadiframe, 100 if @project.iframe

  remove: ->
    @el.remove()
    if @iframe then @iframe.remove()
    $('body').removeClass 'loading-frame p-' + @project.stub

  loadiframe: =>
    @iframe = $("<iframe frameborder=\"0\" border=\"0\" cellspacing=\"0\" class=\"bigiframe\" />").attr('src', @project.iframe).load(@onFrameLoad).appendTo('body').load(@onFrameLoad) if @project.iframe
    $('body').addClass 'loading-frame'
  
  onFrameLoad: =>
    @iframe.addClass 'loaded'
    $('body').removeClass 'loading-frame'

module.exports = ProjectDetail