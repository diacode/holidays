Constants = require '../constants/constants'
PublicHolidaysAPI = require '../state_sources/public_holidays_source'

module.exports = Marty.createActionCreators
  id: 'PublicHolidayActionCreators'

  addNew: ->
    @dispatch Constants.publicHolidays.ADD_NEW_PUBLIC_HOLIDAY

  setHoliday: (values) ->
    @dispatch Constants.publicHolidays.SET_PUBLIC_HOLIDAY_VALUES, values

  removeHoliday: (id) ->
    @dispatch Constants.publicHolidays.REMOVE_PUBLIC_HOLIDAY, id

  invalidateHolidays: ->
    @dispatch Constants.publicHolidays.INVALIDATE_PUBLIC_HOLIDAYS

  save: (publicHolidays) ->
    PublicHolidaysAPI.batchCreate(publicHolidays)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.publicHolidays.PUBLIC_HOLIDAYS_CREATION_SUCCESS, res.body.public_holidays
        when 422
          console.log 'Error creating public holidays'
    .catch (err) =>
      console.log 'Error creating public holidays'
      console.log err


