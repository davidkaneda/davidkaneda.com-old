Spine = require('spine')
Page = require('controllers/page')
ProjectDetail = require('controllers/project_detail')
Project = require('models/project')
$ = Spine.$
Tmpl = require('spine/lib/tmpl')

class Projects extends Page
  meta_title: 'Projects'

  constructor: ->
    # Set the element.
    @el = $('#work')
    super

    # Asynchronously load the projects and create thumbs
    # Create a deferred object other controllers can bind to
    Project.bind('refresh change', @render)
    @hasLoaded = new $.Deferred()
    Project.fetch()

  # Render the thumbnails
  render: (items) =>
    @projects = Project.all()
    @hasLoaded.resolve()
    @append require('views/project')(@)

  # Load a detail project
  loadRecord: (id) ->
    newdetail = new ProjectDetail( project: Project.findByAttribute('stub', id) )
    @detail = newdetail;

  removeDetail: ->
    @detail.remove() if @detail

module.exports = Projects