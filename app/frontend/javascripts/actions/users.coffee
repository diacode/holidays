constants = require '../constants'

module.exports =
  fetchUsers: ->
    (dispatch) =>
      $.get(Routes.api_v1_users_path())
      .done (data) ->
        dispatch
          type: constants.USERS_RECEIVED
          users: data.users

  showForm: (show = true) ->
    (dispatch) =>
      dispatch
        type: constants.SET_SHOW_USER_FORM
        showForm: show

      if show is false then dispatch
        type: constants.RESET_USER_FORM

