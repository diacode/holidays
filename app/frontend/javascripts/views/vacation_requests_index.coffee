MainView = require './main_view'
VacationRequestsList = require '../flux/components/vacation_requests/list'

class View extends MainView
  mount: ->
    super()
    React.render React.createElement(VacationRequestsList, {}), document.getElementById('vacation_requests_wrapper')

module.exports = View
