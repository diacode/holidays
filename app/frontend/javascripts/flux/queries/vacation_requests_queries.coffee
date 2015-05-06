Constants = require '../constants/constants'
VacationRequestsApi = require '../state_sources/vacation_requests_source'

module.exports = Marty.createQueries
  id: 'VacationRequestsQueries'

  findAll: ->
    VacationRequestsApi.findAll().then (res)=>
      switch res.status
        when 200
          @dispatch Constants.vacationRequests.ADD_VACATION_REQUESTS, res.body.vacation_requests
    .catch (err) ->
      console.log err

  find: (id) ->
    VacationRequestsApi.find(id).then (res)=>
      switch res.status
        when 200
          @dispatch Constants.vacationRequests.SET_VACATION_REQUEST, res.body
    .catch (err) ->
      console.log err
