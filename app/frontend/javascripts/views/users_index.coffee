MainView = require './main_view'
UsersSection = require '../flux/components/users/section'

class View extends MainView
  mount: ->
    super()

    props =
      currentUser: gon.current_user

    React.render React.createElement(UsersSection, props), document.getElementById('users_section')

module.exports = View
