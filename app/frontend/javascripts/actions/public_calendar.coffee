constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  fetchDataForMonth: (date) ->
    (dispatch) =>
      $.get(Routes.api_v1_public_holidays_path(date: date))
      .done (data) ->
        dispatch
          type: constants.SET_MONTH_PUBLIC_HOLIDAYS
          publicHolidays: data.public_holidays

      $.get(Routes.api_v1_requested_days_path(date: date))
      .done (data) ->
        dispatch
          type: constants.SET_MONTH_REQUESTED_DAYS
          requestedDays: data.requested_days
