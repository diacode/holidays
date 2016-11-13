constants = require '../constants'

initialState =
  showForm: false
  userList: []
  # datesAreValid: false
  # selectedDates: []
  # error: null
  # publicHolidays: []

module.exports = (state = initialState, action) ->
  switch action.type
    when constants.GRANT_FORM_SET_SHOW_FORM
      _.assign {}, state, showForm: action.showForm

    when constants.GRANT_FORM_USERS_LOADED
      _.assign {}, state, userList: action.users
    # when constants.REQUEST_FORM_SET_DATES_ARE_VALID
    #   _.assign {}, state, datesAreValid: action.areValid
    #
    # when constants.REQUEST_FORM_SET_ERROR
    #   _.assign {}, state, error: action.error
    #
    # when constants.REQUEST_FORM_SET_SELECTED_DATES
    #   _.merge {}, state, selectedDates: action.dates
    #
    # when constants.PUBLIC_HOLIDAYS_SET_MONTH_HOLIDAYS
    #   _.assign {}, state, publicHolidays: action.publicHolidays
    #
    # when constants.REQUEST_FORM_RESET_FORM
    #   newState =
    #     showForm: false
    #     datesAreValid: false
    #     selectedDates: []
    #     error: null
    #
    #   _.assign {}, state, newState

    else
      state
