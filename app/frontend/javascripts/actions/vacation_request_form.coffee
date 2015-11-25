constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  showForm: (show = true) ->
    (dispatch) =>
      dispatch
        type: constants.REQUEST_FORM_SET_SHOW_FORM
        showForm: show



