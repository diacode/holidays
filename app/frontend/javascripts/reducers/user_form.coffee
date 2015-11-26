constants = require '../constants'

initialState =
  showForm: false
  item:
    email: ''
    first_name: ''
    last_name: ''
  errors: []

module.exports = (state = initialState, action) ->
  switch action.type
    when constants.SET_SHOW_USER_FORM
      _.assign {}, state, showForm: action.showForm

    when constants.SET_USER_FORM_ITEM
      _.assign {}, state, item: action.item

    when constants.ADD_USER_FORM_ERRORS
      _.assign {}, state, errors: action.errors

    when constants.RESET_USER_FORM
      _.assign {}, state, initialState

    else
      state
