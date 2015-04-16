UserNav = require '../widgets/user_nav'
RequestHolidaysButton = require '../flux/components/holidays/request_button'

class MainView
  mount: ->
    UserNav.mount()
    @_initRequestVacations()
  unmount: ->
    UserNav.unmount()

  _initRequestVacations: ->
    React.render React.createElement(RequestHolidaysButton, {}), document.getElementById('request_holidays_button_wrapper')

module.exports = MainView





