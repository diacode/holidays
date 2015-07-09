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
    meta:
      current_page: 1

  fetchVacationRequests: ->
    @fetch
      id: 'vacation-requests'
      locally: =>
        @state.vacationRequests
      remotely: =>
        @app.queries.vacationRequests.findAll()

  addVacationRequests: (vacationRequests, meta) ->
    currentVacationRequests = @state.vacationRequests || []

    @setState
      vacationRequests: currentVacationRequests.concat vacationRequests
      meta: meta

  replaceVacationRequest: (vacationRequest) ->
    return unless @state.vacationRequests

    vacationRequests = @state.vacationRequests

    index = _.findIndex vacationRequests, (request) ->
      request.id == vacationRequest.id

    @state.vacationRequests[index] = vacationRequest
    @hasChanged()

  addVacationRequest: (vacationRequest) ->
    vacationRequests = @state.vacationRequests

    @setState
      vacationRequests: [vacationRequest].concat vacationRequests






