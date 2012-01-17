require('lib/setup')

Spine = require('spine')
Page = require('controllers/page');
Project = require('models/project')
Projects = require('controllers/projects');

class App extends Page
  events:
      "click #page-header a, a[rel=internal]": "navClick"

  constructor: ->
    super
    @routes
      "/work/:id": @work
      "/presentations/": @presentations
      "/hi": @home
      "*any": -> @navigate '/hi', true

    @$('.social a').attr('target', '_blank')
    Spine.Route.setup(history: true)

    # Added after current function scope
    # to avoid transition on first screen.
    # (Combined with body.routed #content { @include transition... })
    setTimeout =>
      @el.addClass 'routed', 0
  
  presentations: ->
    @switchClass 'presentations'

  work: (params) ->
    @projects = new Projects() unless @projects
    @switchClass if params.id then 'project-detail' else 'work'

    if params.id then @projects.hasLoaded.done => @projects.loadRecord params.id
  
  home: ->
    @setTitle 'David Kaneda'
    @switchClass 'home'

  switchClass: (name) ->
    _gaq.push ['_trackPageview']
    if @el.hasClass('project-detail') then @projects.removeDetail()
    
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
    @navigate href, true
    false

module.exports = App