Spine = require('spine')
Page = require('controllers/page')
$ = Spine.$
Tmpl = require('spine/lib/tmpl')

class ProjectDetail extends Page

  constructor: (model) ->
    @el = $('#projects')
    @meta_title = model.attributes().name
    super

  render: (project) =>
    @append require('views/project')(@)

  loadRecord: (id) ->
    @log Project.findByAttribute('stub', id)

module.exports = ProjectDetail