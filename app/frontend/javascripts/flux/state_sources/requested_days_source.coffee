Globals = require '../../utils/globals'

module.exports = Marty.createStateSource
  type: 'http'
  id: 'RequestedDaysAPI'

  create: (vacationRequestId, requestedDay) ->
    body =
      authenticity_token: Globals.authenticityToken
      requested_day: requestedDay

    @post
      url: Routes.api_v1_vacation_request_requested_days_path(vacationRequestId)
      body: body

  destroy: (vacationRequestId, requestedDay) ->
    body =
      authenticity_token: Globals.authenticityToken

    @delete
      url: Routes.api_v1_vacation_request_requested_day_path(vacationRequestId, requestedDay.id)
      body: body

  approve: (vacationRequestId, requestedDayId) ->
    body =
      authenticity_token: Globals.authenticityToken

    @put
      url: Routes.approve_api_v1_vacation_request_requested_day_path(vacationRequestId, requestedDayId)
      body: body

  reject: (vacationRequestId, requestedDayId) ->
    body =
      authenticity_token: Globals.authenticityToken

    @put
      url: Routes.reject_api_v1_vacation_request_requested_day_path(vacationRequestId, requestedDayId)
      body: body
