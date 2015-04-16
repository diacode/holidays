Constants = require '../constants/constants'
moment = require 'moment'

module.exports = Marty.createStore
  id: 'CalendarStore'

  handlers:
    setMonth: Constants.calendar.SET_MONHT
    nextMonth: Constants.calendar.NEXT_MONTH
    previousMonth: Constants.calendar.PREVIOUS_MONTH

  getInitialState: ->
    month: moment().startOf("day")


  setMonth: (month) ->
    @setState
      month: month

  nextMonth: ->
    @setState
      month: @state.month.add(1,'M')

  previousMonth: ->
    @setState
      month: @state.month.add(-1,'M')


