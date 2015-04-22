Constants = require '../constants/constants'
VacationRequestsAPI = require '../state_sources/vacation_requests_source'

module.exports = Marty.createActionCreators
  id: 'VacationRequestsActionCreators'

  approve: (id) ->
    VacationRequestsAPI.approve(id)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.vacationRequests.VACATION_REQUEST_APPROVED, res.body
    .catch (err) =>
      console.log 'Error creating Vacation request'
      console.log err
