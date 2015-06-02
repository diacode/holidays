Constants = require '../constants/constants'
PublicHolidaysAPI = require '../state_sources/public_holidays_source'

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

  findForYear: (year) ->
    PublicHolidaysAPI.findForYear(year)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.publicHolidays.RETRIEVED_YEAR_PUBLIC_HOLIDAYS, res.body.public_holidays

  duplicateForYear: (year) ->
    PublicHolidaysAPI.findForYear(year)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.publicHolidays.DUPLICATE_YEAR_PUBLIC_HOLIDAYS, res.body.public_holidays
