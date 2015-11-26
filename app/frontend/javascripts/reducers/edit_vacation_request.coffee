constants = require '../constants'

initalState =
  vacationRequest:
    requested_days: []

module.exports = (state = initalState, action) ->
  switch action.type
    when constants.EDIT_VACATION_REQUEST_SET
      _.assign {}, state, vacationRequest: action.vacationRequest

    when constants.VACATION_REQUEST_REPLACE
      _.assign {}, state, vacationRequest: action.vacationRequest

    when constants.EDIT_VACATION_REQUEST_ADD_REQUESTED_DAY
      vacationRequest = _.cloneDeep state.vacationRequest
      vacationRequest.requested_days.push action.requestedDay

      requestedDays = _.sortBy vacationRequest.requested_days, (n) ->
        n.day

      vacationRequest.requested_days = requestedDays

      _.assign {}, state, vacationRequest: vacationRequest

    when constants.EDIT_VACATION_REQUEST_REMOVE_REQUESTED_DAY
      vacationRequest = _.cloneDeep state.vacationRequest

      _.remove vacationRequest.requested_days, (day) ->
        day.id == action.requestedDay.id

      _.assign {}, state, vacationRequest: vacationRequest

    else
      state
