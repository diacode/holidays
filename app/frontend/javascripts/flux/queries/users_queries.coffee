Constants = require '../constants/constants'

module.exports = Marty.createQueries
  id: 'UsersQueries'

  findAll: ->
    @app.stateSources.users.findAll().then (res)=>
      @dispatch Constants.users.SET_USERS, res.users
    .catch (err) ->
      console.log err
