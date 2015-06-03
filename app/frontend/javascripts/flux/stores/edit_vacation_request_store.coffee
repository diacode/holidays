Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'EditVacationRequestStore'

  handlers:
    setVacationRequest: [
      Constants.vacationRequests.SET_VACATION_REQUEST
      Constants.vacationRequests.VACATION_REQUEST_APPROVED
      Constants.vacationRequests.VACATION_REQUEST_REJECTED
    ]
    addRequestedDay: Constants.editVacationRequest.ADD_REQUESTED_DAY
    removeRequestedDay: Constants.editVacationRequest.REMOVE_REQUESTED_DAY
    replaceRequestedDay: Constants.editVacationRequest.REPLACE_REQUESTED_DAY

  getInitialState: ->

  fetchVacationRequest: (id) ->
    @fetch
      id: "vacation-request-#{id}"
      locally: ->
        @state.vacationRequest
      remotely: ->
        @app.queries.vacationRequests.find id

  setVacationRequest: (vacationRequest) ->
    @setState
      vacationRequest: vacationRequest

  addRequestedDay: (requestedDay) ->
    @state.vacationRequest.requested_days.push requestedDay
    requestedDays = _.sortBy @state.vacationRequest.requested_days, (n) ->
      n.day

    @state.vacationRequest.requested_days = requestedDays
    @hasChanged()

  removeRequestedDay: (requestedDay) ->
    _.remove @state.vacationRequest.requested_days, (day) ->
      day.id == requestedDay.id

    @hasChanged()

  replaceRequestedDay: (requestedDay) ->
    requestedDays = @state.vacationRequest.requested_days

    index = _.findIndex requestedDays, (day) ->
      day.id == requestedDay.id

    @state.vacationRequest.requested_days[index] = requestedDay
    @hasChanged()









