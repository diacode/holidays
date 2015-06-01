MainView = require './main_view'
UsersSection = require '../flux/components/users/section'

class View extends MainView
  mount: ->
    super()

    React.render React.createElement(UsersSection, {}), document.getElementById('users_section')

module.exports = View
