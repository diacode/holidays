UserNav = require '../widgets/user_nav'

class MainView
  mount: ->
    UserNav.mount()
  unmount: ->
    UserNav.unmount()

module.exports = MainView





