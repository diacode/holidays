Globals = require '../../utils/globals'

module.exports = Marty.createStateSource
  type: 'http'
  id: 'VacationRequestsAPI'

  create: (vacationRequest) ->
    body =
      authenticity_token: Globals.authenticityToken
      vacation_request: vacationRequest

    @post
      url: Routes.api_v1_vacation_requests_path(),
      body: body

  update: (id, vacationRequest) ->
    body =
      authenticity_token: Globals.authenticityToken
      vacation_request: vacationRequest

    @put
      url: Routes.api_v1_vacation_request_path(id),
      body: body

  approve: (id) ->
    vacationRequest =
      vacation_request:
        status: Globals.vacationRequestStatuses.processed

    @update id, vacationRequest


  findAll: ->
    @get  Routes.api_v1_vacation_requests_path()
