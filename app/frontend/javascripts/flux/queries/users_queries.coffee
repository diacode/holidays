Constants = require '../constants/constants'
UsersApi = require '../state_sources/users_source'

module.exports = Marty.createQueries
  id: 'UsersQueries'

  findAll: ->
    UsersApi.findAll().then (res)=>
      switch res.status
        when 200
          @dispatch Constants.users.SET_USERS, res.body.users
    .catch (err) ->
      console.log err
