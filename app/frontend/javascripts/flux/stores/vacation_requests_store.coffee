Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'VacationRequestsStore'

  handlers:
    addVacationRequests: Constants.vacationRequests.ADD_VACATION_REQUESTS
    replaceVacationRequest: [
      Constants.vacationRequests.VACATION_REQUEST_APPROVED
      Constants.vacationRequests.VACATION_REQUEST_REJECTED
    ]
    addVacationRequest: Constants.requestForm.VACATION_REQUEST_CREATED

  getInitialState: ->

  fetchVacationRequests: ->
    @fetch
      id: 'vacation-requests'
      locally: =>
        @state.vacationRequests
      remotely: =>
        @app.queries.vacationRequests.findAll()

  addVacationRequests: (vacationRequests) ->
    @setState
      vacationRequests: vacationRequests

  replaceVacationRequest: (vacationRequest) ->
    vacationRequests = @state.vacationRequests

    index = _.findIndex vacationRequests, (request) ->
      request.id == vacationRequest.id

    @state.vacationRequests[index] = vacationRequest
    @hasChanged()

  addVacationRequest: (vacationRequest) ->
    vacationRequests = @state.vacationRequests
    @setState
      vacationRequests: [vacationRequest].concat(vacationRequests)






