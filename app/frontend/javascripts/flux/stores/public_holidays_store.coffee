Constants = require '../constants/constants'
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
        @app.queries.publicHolidays.findForYear moment().format()


  setPublicHolidays: (publicHolidays) ->
    @setState
      publicHolidays: publicHolidays
