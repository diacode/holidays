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
    .then (res) ->
      if res.ok then return res.json()

      throw new Error('Error', res)

  destroy: (vacationRequestId, requestedDay) ->
    body =
      authenticity_token: Globals.authenticityToken

    @delete
      url: Routes.api_v1_vacation_request_requested_day_path(vacationRequestId, requestedDay.id)
      body: body
    .then (res) ->
      if res.ok then return res.json()

      throw new Error('Error', res)

  approve: (vacationRequestId, requestedDayId) ->
    body =
      authenticity_token: Globals.authenticityToken

    @put
      url: Routes.approve_api_v1_vacation_request_requested_day_path(vacationRequestId, requestedDayId)
      body: body
    .then (res) ->
      if res.ok then return res.json()

      throw new Error('Error', res)

  reject: (vacationRequestId, requestedDayId) ->
    body =
      authenticity_token: Globals.authenticityToken

    @put
      url: Routes.reject_api_v1_vacation_request_requested_day_path(vacationRequestId, requestedDayId)
      body: body
    .then (res) ->
      if res.ok then return res.json()

      throw new Error('Error', res)

  findForMonth: (date) ->
    @get(Routes.api_v1_requested_days_path(date: date)).then (res) ->
      if res.ok then return res.json()

      throw new Error('Error', res)
