constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  fetchVacationRequests: (page = 1) ->
    (dispatch) =>
      $.get(Routes.api_v1_vacation_requests_path(page: page))
      .done (data) ->
        dispatch
          type: constants.VACATION_REQUESTS_RECEIVED
          vacationRequests: data.vacation_requests
          meta: data.meta
