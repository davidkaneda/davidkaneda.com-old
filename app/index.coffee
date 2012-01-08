require('lib/setup')

Spine = require('spine')
Projects = require('controllers/projects');
Project = require('models/project')

class App extends Spine.Controller
  events:
      "click #page-header a, .project": "navClick"

  constructor: ->
    super
    @routes
      "/projects/:id": @projects
      "/presentations/": @presentations
      "/": @home
      "*unknown": -> @navigate '/', true

    Spine.Route.setup(history: true)

    setTimeout =>
      @el.removeClass 'firstrun', 30
  
  presentations: ->
    @switchClass 'presentations'

  projects: (params) ->
    @pc = new Projects() unless @pc
    @switchClass if params.id then 'project-detail' else 'projects'

    Project.bind 'refresh', =>
      @pc.loadRecord(params.id) if params.id
  
  home: ->
    @switchClass 'home'

  switchClass: (name) ->
    # Switch the body class
    @el.removeClass @currentClass
    @el.addClass name

    # Switch the current div
    @$('#' + @currentClass).removeClass 'current'
    @$('#' + name).addClass 'current'

    # Switch the active nav
    @$('#nav-' + @currentClass).removeClass 'active'
    @$('#nav-' + name).addClass 'active'

    @currentClass = name

  navClick: (e) =>
    href = $(e.currentTarget).addClass('active').attr('href')
    @log href
    @navigate href, true
    false

module.exports = App