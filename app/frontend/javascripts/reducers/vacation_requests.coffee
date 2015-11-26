constants = require '../constants'

initalState =
  vacationRequests: []
  meta:
    current_page: 1

module.exports = (state = initalState, action) ->
  switch action.type
    when constants.VACATION_REQUESTS_RECEIVED
      vacationRequests = _.cloneDeep state.vacationRequests
      newVacationRequests = vacationRequests.concat action.vacationRequests

      _.assign {}, state, vacationRequests: newVacationRequests, meta: action.meta

    when constants.VACATION_REQUEST_APPROVED
      state
    when constants.VACATION_REQUEST_REJECTED
      state
    when constants.VACATION_REQUEST_CREATED
      state
    else
      state
