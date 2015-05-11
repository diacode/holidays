Constants = require '../constants/constants'
PublicHolidaysAPI = require '../state_sources/public_holidays_state_source'

module.exports = Marty.createQueries
  id: 'PublicHolidaysQueries'

  findForMonth: (date) ->
    PublicHolidaysAPI.findForMonth(date)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.publicHolidays.SET_MONTH_PUBLIC_HOLIDAYS, res.body.public_holidays


    .catch (err) ->
      console.log err

