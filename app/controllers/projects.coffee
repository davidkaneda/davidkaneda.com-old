Spine = require('spine')
Page = require('controllers/page')
Project = require('models/project')
$ = Spine.$
Tmpl = require('spine/lib/tmpl')

class Projects extends Page
  meta_title: 'Projects'

  constructor: ->
    @el = $('#projects')
    super
    Project.bind('refresh', @render)
    @defer = Project.fetch()

  render: (items) =>
    @projects = Project.all()
    @html require('views/project')(@)

  loadRecord: (id) ->
    @log Project.findByAttribute('stub', id)

module.exports = Projects