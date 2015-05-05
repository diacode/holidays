Constants = require '../constants/constants'
VacationRequestsQueries = require '../queries/vacation_requests_queries'

module.exports = Marty.createStore
  id: 'EditVacationRequestStore'

  handlers:
    setVacationRequest: [
      Constants.vacationRequests.SET_VACATION_REQUEST
      Constants.vacationRequests.VACATION_REQUEST_APPROVED
      Constants.vacationRequests.VACATION_REQUEST_REJECTED
    ]
    setRequestedDays: Constants.editVacationRequest.SET_EDIT_SELECTED_DATES

  getInitialState: ->

  fetchVacationRequest: (id) ->
    @fetch
      id: "vacation-request-#{id}"
      locally: ->
        @state.vacationRequest
      remotely: ->
        VacationRequestsQueries.find id

  setVacationRequest: (vacationRequest) ->
    @setState
      vacationRequest: vacationRequest

  setRequestedDays: (dates) ->
    requestedDays = []

    for date in dates
      formatedDate = date.format('YYYY-MM-DD')

      index = _.findIndex @state.vacationRequest.requested_days, (requestedDay) ->
        formatedDate == requestedDay.day

      if index == -1
        requestedDays.push
          id: null
          day: formatedDate
          status: 'approved'
      else
        requestedDays.push @state.vacationRequest.requested_days[index]

    @state.vacationRequest.requested_days = requestedDays
    @hasChanged()











