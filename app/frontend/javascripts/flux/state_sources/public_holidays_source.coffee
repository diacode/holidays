Globals = require '../../utils/globals'

module.exports = Marty.createStateSource
  type: 'http'
  id: 'PublicHolidaysAPI'

  findForMonth: (date) ->
    @get(Routes.api_v1_public_holidays_path(date: date)).then (res) ->
      if res.ok then return res.json()
      throw new Error('Error', res)

  findForYear: (year) ->
    @get(Routes.api_v1_public_holidays_path(year: year)).then (res) ->
      if res.ok then return res.json()
      throw new Error('Error', res)

  batchCreate: (publicHolidays) ->
    publicHolidaysParams = publicHolidays.map (holiday) ->
      name: holiday.name
      day: holiday.day

    body =
      authenticity_token: Globals.authenticityToken
      public_holidays_params:
        public_holidays: publicHolidaysParams

    @post
      url: Routes.batch_create_api_v1_public_holidays_path()
      body: body

  batchUpdate: (publicHolidays) ->
    publicHolidaysParams = publicHolidays.map (holiday) ->
      id: holiday.id
      name: holiday.name
      day: holiday.day

    body =
      authenticity_token: Globals.authenticityToken
      public_holidays_params:
        public_holidays: publicHolidaysParams

    @patch
      url: Routes.batch_update_api_v1_public_holidays_path()
      body: body

  destroy: (id) ->
    body =
      authenticity_token: Globals.authenticityToken

    @delete
      url: Routes.api_v1_public_holiday_path(id)
      body: body
    .then (res) ->
      if res.ok then return res.json()
      throw new Error('Error', res)


