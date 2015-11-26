constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  createDay: (vacationRequestId, requestedDay) ->
    (dispatch) =>
      url = Routes.api_v1_vacation_request_requested_days_path(vacationRequestId)
      body =
        authenticity_token: globals.authenticityToken
        requested_day: requestedDay

      $.post(url, body)
      .done (data) =>
        dispatch
          type: constants.EDIT_VACATION_REQUEST_ADD_REQUESTED_DAY
          requestedDay: data.requested_day
      .fail (data) =>
        throw new Error('Error', data)

  destroyDay: (vacationRequestId, requestedDayId) ->
    (dispatch) =>
      $.ajax
        url: Routes.api_v1_vacation_request_requested_day_path(vacationRequestId, requestedDayId)
        type: 'DELETE'
        data:
          authenticity_token: globals.authenticity_token
      .done (data) =>
        dispatch
          type: constants.EDIT_VACATION_REQUEST_REMOVE_REQUESTED_DAY
          requestedDay: data.requested_day
      .fail (data) =>
        throw new Error('Error', data)
