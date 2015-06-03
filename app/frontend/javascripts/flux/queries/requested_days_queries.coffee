Constants = require '../constants/constants'

module.exports = Marty.createQueries
  id: 'RequestedDaysQueries'

  findForMonth: (date) ->
    @app.stateSources.requestedDays.findForMonth(date)
    .then (res) =>
      @dispatch Constants.publicHolidays.SET_MONTH_REQUESTED_DAYS, res.requested_days

    .catch (err) ->
      console.log err

