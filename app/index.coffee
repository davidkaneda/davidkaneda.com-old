require('lib/setup')

Spine = require('spine')
Page = require('controllers/page');

Projects = require('controllers/projects');
Project = require('models/project')

class App extends Page
  events:
      "click #page-header a, a[rel=internal]": "navClick"

  constructor: ->
    super
    @routes
      "/projects/:id": @projects
      "/presentations/": @presentations
      "/": @home
      "*unknown": -> @navigate '/', true

    @$('.social a').attr('target', '_blank');


    Spine.Route.setup(history: true)

    # Added after current function scope
    # to avoid transition on first screen.
    # (Combined with body.routed #content { @include transition... })
    setTimeout =>
      @el.addClass 'routed', 0
  
  presentations: ->
    @switchClass 'presentations'

  projects: (params) ->
    @pc = new Projects() unless @pc
    @switchClass if params.id then 'project-detail' else 'projects'

    if params.id then @pc.hasLoaded.done => @pc.loadRecord params.id
  
  home: ->
    @setTitle('David Kaneda');
    @switchClass 'home'

  switchClass: (name) ->
    if @el.hasClass('project-detail') then @pc.removeDetail()

    # Switch the body class
    @el.removeClass @currentClass if @currentClass
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