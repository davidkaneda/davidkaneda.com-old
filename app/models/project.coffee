Spine = require('spine')
$ = Spine.$

class Project extends Spine.Model
  @configure "Project", "name"
  @extend Spine.Model.Ajax
  @url: "/data/projects.json"

module.exports = Project