Constants = require '../constants/constants'
VacationRequestsAPI = require '../state_sources/vacation_requests_source'

module.exports = Marty.createActionCreators
  id: 'EditVacationRequestActionCreators'

  setRequestedDays: (requestedDays) ->
    @dispatch Constants.editVacationRequest.SET_EDIT_SELECTED_DATES, requestedDays

