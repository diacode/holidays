Constants = require '../constants/constants'

module.exports = Marty.createActionCreators
  id: 'EditVacationRequestActionCreators'

  setRequestedDays: (requestedDays) ->
    @dispatch Constants.editVacationRequest.SET_EDIT_SELECTED_DATES, requestedDays

  createDay: (vacationRequestId, requestedDay) ->
    @app.stateSources.requestedDays.create(vacationRequestId, requestedDay)
    .then (res) =>
      @dispatch Constants.editVacationRequest.ADD_REQUESTED_DAY, res
    .catch (err) =>
      console.log 'Error creating requested day'
      console.log err

  destroyDay: (vacationRequestId, requestedDay) ->
    @app.stateSources.requestedDays.destroy(vacationRequestId, requestedDay)
    .then (res) =>
      @dispatch Constants.editVacationRequest.REMOVE_REQUESTED_DAY, res
    .catch (err) =>
      console.log 'Error creating requested day'
      console.log err

  approveDay: (vacationRequestId, requestedDayId) ->
    @app.stateSources.requestedDays.approve(vacationRequestId, requestedDayId)
    .then (res) =>
      @dispatch Constants.editVacationRequest.REPLACE_REQUESTED_DAY, res
    .catch (err) =>
      console.log 'Error approving requested day'
      console.log err

  rejectDay: (vacationRequestId, requestedDayId) ->
    @app.stateSources.requestedDays.reject(vacationRequestId, requestedDayId)
    .then (res) =>
      @dispatch Constants.editVacationRequest.REPLACE_REQUESTED_DAY, res
    .catch (err) =>
      console.log 'Error approving requested day'
      console.log err

