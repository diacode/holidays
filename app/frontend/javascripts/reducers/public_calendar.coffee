constants = require '../constants'

initalState =
  publicHolidays: []
  approvedRequestedDays: []

module.exports = (state = initalState, action) ->
  switch action.type
    when constants.SET_MONTH_PUBLIC_HOLIDAYS
      _.assign {}, state, publicHolidays: action.publicHolidays

    when constants.SET_MONTH_REQUESTED_DAYS
      _.assign {}, state, approvedRequestedDays: action.requestedDays

    else
      state
