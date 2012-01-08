Spine = require('spine')
Page = require('controllers/page')
Detail = require('controllers/project_detail')
Project = require('models/project')
$ = Spine.$
Tmpl = require('spine/lib/tmpl')

class Projects extends Page
  meta_title: 'Projects'

  constructor: ->
    # Set the element.
    @el = $('#projects')
    super

    # Asynchronously load the projects and create thumbs
    # Create a deferred object other controllers can bind to
    Project.bind('refresh change', @render)
    @hasLoaded = new $.Deferred()
    Project.fetch()

  render: (items) =>
    @projects = Project.all()
    @hasLoaded.resolve()
    @append require('views/project')(@)

  loadRecord: (id) ->
    record = Project.findByAttribute('stub', id)
    
    newdetail = new Detail(record);
    
    @detail.destroy if @detail



module.exports = Projects