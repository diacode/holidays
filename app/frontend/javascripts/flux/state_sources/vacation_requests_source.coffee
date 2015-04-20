module.exports = Marty.createStateSource
  type: 'http'
  id: 'VacationRequestsAPI'

  create: (vacationRequest) ->
    body =
      authenticity_token: gon.authenticity_token
      vacation_request: vacationRequest

    @post
      url: Routes.api_v1_vacation_requests_path(),
      body: body
