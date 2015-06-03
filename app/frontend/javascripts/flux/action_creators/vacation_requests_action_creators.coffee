Constants = require '../constants/constants'

module.exports = Marty.createActionCreators
  id: 'VacationRequestsActionCreators'

  approve: (id) ->
    @app.stateSources.vacationRequests.approve(id)
    .then (res) =>
      @dispatch Constants.vacationRequests.VACATION_REQUEST_APPROVED, res
    .catch (err) =>
      console.log 'Error creating Vacation request'
      console.log err

  reject: (id) ->
    @app.stateSources.vacationRequests.reject(id)
    .then (res) =>
      @dispatch Constants.vacationRequests.VACATION_REQUEST_REJECTED, res
    .catch (err) =>
      console.log 'Error rejecting Vacation request'
      console.log err

