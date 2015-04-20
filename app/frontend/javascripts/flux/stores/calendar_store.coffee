Constants = require '../constants/constants'
moment = require 'moment'

module.exports = Marty.createStore
  id: 'CalendarStore'

  handlers:
    setMonth: Constants.calendar.SET_MONTH
    nextMonth: Constants.calendar.NEXT_MONTH
    previousMonth: Constants.calendar.PREVIOUS_MONTH
    addDate: Constants.calendar.ADD_DATE
    removeDate: Constants.calendar.REMOVE_DATE
    reset: Constants.modal.HIDE

  getInitialState: ->
    month: moment().startOf("day")
    selectedDates: []

  setMonth: (month) ->
    @setState
      month: month

  nextMonth: ->
    @setState
      month: @state.month.add(1,'M')

  previousMonth: ->
    @setState
      month: @state.month.add(-1,'M')


  addDate: (date) ->
    @state.selectedDates.push date
    @hasChanged()

  removeDate: (date) ->
    _.remove @state.selectedDates, (n) ->
      date.isSame n

    @hasChanged()

  reset: ->
    @setState
      selectedDates: []



