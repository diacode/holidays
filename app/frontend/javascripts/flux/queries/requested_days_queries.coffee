Constants = require '../constants/constants'
RequestedDaysAPI = require '../state_sources/requested_days_source'

module.exports = Marty.createQueries
  id: 'RequestedDaysQueries'

  findForMonth: (date) ->
    RequestedDaysAPI.findForMonth(date)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.publicHolidays.SET_MONTH_REQUESTED_DAYS, res.body.requested_days

    .catch (err) ->
      console.log err

