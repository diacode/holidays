Constants = require '../constants/constants'

module.exports = Marty.createQueries
  id: 'PublicHolidaysQueries'

  findForMonth: (date) ->
    @app.stateSources.publicHolidays.findForMonth(date)
    .then (res) =>
      @dispatch Constants.publicHolidays.SET_MONTH_PUBLIC_HOLIDAYS, res.public_holidays
    .catch (err) ->
      console.log err

  findForYear: (year) ->
    @app.stateSources.publicHolidays.findForYear(year)
    .then (res) =>
      @dispatch Constants.publicHolidays.RETRIEVED_YEAR_PUBLIC_HOLIDAYS, res.public_holidays

  duplicateForYear: (year) ->
    @app.stateSources.publicHolidays.findForYear(year)
    .then (res) =>
      @dispatch Constants.publicHolidays.DUPLICATE_YEAR_PUBLIC_HOLIDAYS, res.public_holidays
