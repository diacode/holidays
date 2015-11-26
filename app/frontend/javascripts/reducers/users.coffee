constants = require '../constants'

initialState =
  users: []

module.exports = (state = initialState, action) ->
  switch action.type
    when constants.USERS_RECEIVED
      _.assign {}, state, users: action.users

    when constants.ADD_USER
      users = _.cloneDeep state.users
      users.push action.user

      _.assign {}, state, users: users

    else
      state
