DayNames = require './day_names'
Week = require './week'
moment = require 'moment'

module.exports = React.createClass
  displayName: 'Calendar'

  getInitialState: ->
    month: @_getInitialMonth()
    selectedDates: []

  getDefaultProps: ->
    publicHolidays: []
    approvedDays: []
    monthChanged: () -> {}


  _getInitialMonth: ->
    if @props.initialMonth != undefined
      @props.initialMonth
    else
      moment().startOf("day")

  componentDidMount: ->
    @setState
      selectedDates: @props.selectedDates

  componentWillReceiveProps: (nextProps) ->
    @setState
      selectedDates: nextProps.selectedDates

  _previous: () ->
    month = @state.month.add(-1,'M')
    @setState
      month: month

    @props.monthChanged month

  _next: () ->
    month = @state.month.add(1,'M')
    @setState
      month: month

    @props.monthChanged month

  _handleAddDate: (date) ->
    dates = @state.selectedDates
    dates.push date

    @setState (previousState, currentProps) ->
      selectedDates: dates

    @props.datesChanged @state.selectedDates

  _handleRemoveDate: (date) ->
    dates = @state.selectedDates
    _.remove dates, (n) ->
      date.isSame n

    @setState (previousState, currentProps) ->
      selectedDates: dates

    @props.datesChanged @state.selectedDates

  _renderWeeks: () ->
    weeks = []
    done = false
    date = @state.month.clone().startOf("month").add("w" -1).day("Monday")
    monthIndex = date.month()
    count = 0

    while not done
      weeks.push <Week key={date.toString()} date={date.clone()} month={@state.month} selectedDates={@state.selectedDates} addDate={@_handleAddDate} removeDate={@_handleRemoveDate} publicHolidays={@props.publicHolidays} approvedDays={@props.approvedDays}/>

      date.add(1, "w")
      done = count++ > 2 && monthIndex != date.month()
      monthIndex = date.month()

    weeks

  _renderMonthLabel: () ->
    <span>{@state.month.format("MMMM, YYYY")}</span>

  render: () ->
    <div className="calendar">
      <div className="header">
        <i className="fa fa-angle-left" onClick={@_previous}></i>
        {@_renderMonthLabel()}
        <i className="fa fa-angle-right" onClick={@_next}></i>
      </div>
      <DayNames />
      {@_renderWeeks()}
    </div>

