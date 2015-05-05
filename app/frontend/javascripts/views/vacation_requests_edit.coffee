MainView = require './main_view'
VacationRequestEditor = require '../flux/components/vacation_requests/editor'

class View extends MainView
  mount: ->
    super()
    React.render React.createElement(VacationRequestEditor, vacationRequestId: gon.vacation_request_id), document.getElementById('vacation_request_editor')

module.exports = View
