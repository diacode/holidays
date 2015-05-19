Constants = require '../constants/constants'

module.exports = Marty.createActionCreators
  id: 'PublicHolidayActionCreators'

  addNew: ->
    @dispatch Constants.publicHolidays.ADD_NEW_PUBLIC_HOLIDAY

  setHoliday: (values) ->
    @dispatch Constants.publicHolidays.SET_PUBLIC_HOLIDAY_VALUES, values

  removeHoliday: (id) ->
    @dispatch Constants.publicHolidays.REMOVE_PUBLIC_HOLIDAY, id

