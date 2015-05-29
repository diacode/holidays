Constants = require '../constants/constants'
UsersQueries = require '../queries/users_queries'

module.exports = Marty.createStore
  id: 'UsersStore'

  handlers:
    setUsers: Constants.users.SET_USERS

  findAll: ->
    @fetch
      id: 'all-users'
      locally: ->
        @state.users
      remotely: ->
        UsersQueries.findAll()

  setUsers: (users) ->
    @setState
      users: users
