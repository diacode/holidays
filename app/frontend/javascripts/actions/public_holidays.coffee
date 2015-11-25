constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  findForMonth: (date) ->
    (dispatch) =>
      $.get(Routes.api_v1_public_holidays_path(date: date))
      .done (data) ->
        dispatch
          type: constants.PUBLIC_HOLIDAYS_SET_MONTH_HOLIDAYS
          publicHolidays: data.public_holidays

  findForYear: (year) ->

  duplicateForYear: (year) ->
