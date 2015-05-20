Globals = require '../../utils/globals'

module.exports = Marty.createStateSource
  type: 'http'
  id: 'PublicHolidaysAPI'

  findForMonth: (date) ->
    @get Routes.api_v1_public_holidays_path(date: date)

  batchCreate: (publicHolidays) ->
    publicHolidaysParams = publicHolidays.map (holiday) ->
      name: holiday.name
      day: holiday.date

    body =
      authenticity_token: Globals.authenticityToken
      public_holidays_params:
        public_holidays: publicHolidaysParams

    @post
      url: Routes.batch_create_api_v1_public_holidays_path()
      body: body

