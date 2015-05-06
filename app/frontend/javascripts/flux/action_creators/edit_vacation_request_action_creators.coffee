Constants = require '../constants/constants'
RequestedDaysAPI = require '../state_sources/requested_days_source'

module.exports = Marty.createActionCreators
  id: 'EditVacationRequestActionCreators'

  setRequestedDays: (requestedDays) ->
    @dispatch Constants.editVacationRequest.SET_EDIT_SELECTED_DATES, requestedDays

  createDay: (vacationRequestId, requestedDay) ->
    RequestedDaysAPI.create(vacationRequestId, requestedDay)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.editVacationRequest.ADD_REQUESTED_DAY, res.body
    .catch (err) =>
      console.log 'Error creating requested day'
      console.log err

  destroyDay: (vacationRequestId, requestedDay) ->
    RequestedDaysAPI.destroy(vacationRequestId, requestedDay)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.editVacationRequest.REMOVE_REQUESTED_DAY, res.body
    .catch (err) =>
      console.log 'Error creating requested day'
      console.log err

