Constants = require '../constants/constants'
PublicHolidaysQueries = require '../queries/public_holidays_queries'
moment = require 'moment'

module.exports = Marty.createStore
  id: 'PublicHolidaysStore'

  handlers:
    setPublicHolidays: Constants.publicHolidays.RETRIEVED_YEAR_PUBLIC_HOLIDAYS

  getInitialState: ->
    editMode: false

  getPublicHolidays: ->
    @fetch
      id: 'current-year-public-holidays'
      locally: ->
        @state.publicHolidays
      remotely: ->
        PublicHolidaysQueries.findForYear moment().format()


  setPublicHolidays: (publicHolidays) ->
    @setState
      publicHolidays: publicHolidays
