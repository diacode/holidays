Constants = require '../constants/constants'
VacationRequestsQueries = require '../queries/vacation_requests_queries'

module.exports = Marty.createStore
  id: 'VacationRequestsStore'

  handlers:
    addVacationRequests: Constants.vacationRequests.ADD_VACATION_REQUESTS

  getInitialState: ->

  fetchVacationRequests: ->
    @fetch
      id: 'vacation-requests'
      locally: ->
        @state.vacationRequests
      remotely: ->
        VacationRequestsQueries.findAll()

  addVacationRequests: (vacationRequests) ->
    @setState
      vacationRequests: vacationRequests






