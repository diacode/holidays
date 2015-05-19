Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'PublicCalendarStore'

  handlers:
    setPublicHolidays: Constants.publicHolidays.SET_MONTH_PUBLIC_HOLIDAYS
    setApprovedRequestedDays: Constants.publicHolidays.SET_MONTH_REQUESTED_DAYS

  getInitialState: ->
    publicHolidays: []
    approvedRequestedDays: []

  setPublicHolidays: (publicHolidays) ->
    @setState
      publicHolidays: publicHolidays

  setApprovedRequestedDays: (requestedDays) ->
    @setState
      approvedRequestedDays: requestedDays
