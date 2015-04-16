Constants = require '../constants/constants'

module.exports = Marty.createActionCreators
  id: 'CalendarActionCreators'

  nextMonth: ->
    @dispatch Constants.calendar.NEXT_MONTH

  previousMonth: ->
    @dispatch Constants.calendar.PREVIOUS_MONTH

  setMonth: (month) ->
    @dispatch Constants.calendar.SET_MONHT, month

  addDate: (date) ->
    @dispatch Constants.calendar.ADD_DATE, date

  removeDate: (date) ->
    @dispatch Constants.calendar.REMOVE_DATE, date
