module.exports = Marty.createStateSource
  type: 'http'
  id: 'PublicHolidaysAPI'

  findForMonth: (date) ->
    @get Routes.api_v1_public_holidays_path(date: date)
