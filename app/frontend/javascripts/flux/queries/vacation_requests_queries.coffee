Constants = require '../constants/constants'

module.exports = Marty.createQueries
  id: 'VacationRequestsQueries'

  findAll: (page = 1)->
    @app.stateSources.vacationRequests.findAll(page).then (res)=>
      @dispatch Constants.vacationRequests.ADD_VACATION_REQUESTS, res.vacation_requests, res.meta
    .catch (err) ->
      console.log err

  find: (id) ->
    @app.stateSources.vacationRequests.find(id).then (res)=>
      @dispatch Constants.vacationRequests.SET_VACATION_REQUEST, res.vacation_request
    .catch (err) ->
      console.log err
