Globals = require '../../utils/globals'

module.exports = Marty.createStateSource
  type: 'http'
  id: 'VacationRequestsAPI'

  create: (vacationRequest) ->
    body =
      authenticity_token: Globals.authenticityToken
      vacation_request: vacationRequest

    @post
      url: Routes.api_v1_vacation_requests_path()
      body: body

  update: (id, vacationRequest) ->
    body =
      authenticity_token: Globals.authenticityToken
      vacation_request: vacationRequest

    @put
      url: Routes.api_v1_vacation_request_path(id)
      body: body

  approve: (id) ->
    body =
      authenticity_token: Globals.authenticityToken

    @put
      url: Routes.approve_api_v1_vacation_request_path(id)
      body: body

  reject: (id) ->
    body =
      authenticity_token: Globals.authenticityToken

    @put
      url: Routes.reject_api_v1_vacation_request_path(id)
      body: body


  findAll: ->
    @get  Routes.api_v1_vacation_requests_path()

  find: (id) ->
    @get Routes.api_v1_vacation_request_path(id)
