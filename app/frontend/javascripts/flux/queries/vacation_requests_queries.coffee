Constants = require '../constants/constants'

module.exports = Marty.createQueries
  id: 'VacationRequestsQueries'

  findAll: ->
    @app.sources.vacationRequests.findAll().then (res)=>
      @dispatch Constants.vacationRequests.ADD_VACATION_REQUESTS, res.vacation_requests
    .catch (err) ->
      console.log err

  find: (id) ->
    @app.sources.vacationRequests.find(id).then (res)=>
      @dispatch Constants.vacationRequests.SET_VACATION_REQUEST, res
    .catch (err) ->
      console.log err
