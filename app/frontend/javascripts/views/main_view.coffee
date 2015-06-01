UserNav = require '../widgets/user_nav'
RequestHolidaysForm = require '../flux/components/holidays/request_form'

class MainView
  mount: ->
    UserNav.mount()
    @_initRequestVacations()
  unmount: ->
    UserNav.unmount()

  _initRequestVacations: ->
    React.render React.createElement(RequestHolidaysForm, {}), document.getElementById('request_holidays_button_wrapper')

module.exports = MainView





