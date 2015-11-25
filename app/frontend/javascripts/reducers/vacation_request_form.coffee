constants = require '../constants'

initialState =
  showForm: false
  datesValidated: false
  selectedDates: []
  error: null
  publicHolidays: []

module.exports = (state = initialState, action) ->
  switch action.type
    when constants.REQUEST_FORM_SET_SHOW_FORM
      _.merge {}, state, showForm: action.showForm

    when constants.REQUEST_FORM_SET_DATES_ARE_VALID
      _.merge {}, state, datesValidated: action.areValid

    when constants.REQUEST_FORM_SET_ERROR
      _.merge {}, state, error: action.error

    when constants.REQUEST_FORM_SET_SELECTED_DATES
      _.merge {}, state, selectedDates: action.dates

    when constants.PUBLIC_HOLIDAYS_SET_MONTH_HOLIDAYS
      _.merge {}, state, publicHolidays: action.publicHolidays

    else
      state
