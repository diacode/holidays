Constants = require '../constants/constants'
VacationRequestsQueries = require '../queries/vacation_requests_queries'

module.exports = Marty.createStore
  id: 'VacationRequestsStore'

  handlers:
    addVacationRequests: Constants.vacationRequests.ADD_VACATION_REQUESTS
    removeVacationRequest: Constants.vacationRequests.VACATION_REQUEST_APPROVED
    removeVacationRequest: Constants.vacationRequests.VACATION_REQUEST_REJECTED

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

  removeVacationRequest: (vacationRequest) ->
    vacationRequests = @state.vacationRequests

    _.remove @state.vacationRequests, (n) ->
      n.id == vacationRequest.id

    @setState
      vacationRequests: vacationRequests







