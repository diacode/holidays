constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  setItem: (item) ->
    (dispatch) =>
      dispatch
        type: constants.SET_USER_FORM_ITEM
        item: item

  saveItem: (item) ->
    (dispatch) =>
      url = Routes.api_v1_users_path()
      body =
        authenticity_token: globals.authenticity_token
        user: item

      $.post(url, body)
      .done (data) =>
        dispatch
          type: constants.ADD_USER
          user: data.user

        dispatch
          type: constants.SET_SHOW_USER_FORM
          showForm: false

        dispatch
          type: constants.RESET_USER_FORM

      .fail (data) =>
        dispatch
          type: constants.ADD_USER_FORM_ERRORS
          errors: data.responseJSON


