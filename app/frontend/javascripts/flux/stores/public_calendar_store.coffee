Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'PublicCalendarStore'

  handlers:
    setPublicHolidays: Constants.publicHolidays.SET_MONTH_PUBLIC_HOLIDAYS

  getInitialState: ->
    publicHolidays: []

  setPublicHolidays: (publicHolidays) ->
    @setState
      publicHolidays: publicHolidays
