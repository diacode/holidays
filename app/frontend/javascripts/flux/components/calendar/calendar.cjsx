DayNames = require './day_names'
Week = require './week'
CalendarStore = require '../../stores/calendar_store'
CalendarActionCreators = require '../../action_creators/calendar_action_creators'

Calendar = React.createClass
  displayName: 'Calendar'

  _previous: () ->
    CalendarActionCreators.previousMonth()

  _next: () ->
    CalendarActionCreators.nextMonth()

  _renderWeeks: () ->
    weeks = []
    done = false
    date = @props.month.clone().startOf("month").add("w" -1).day("Monday")
    monthIndex = date.month()
    count = 0

    while not done
      weeks.push <Week key={date.toString()} date={date.clone()} month={@props.month} />

      date.add(1, "w")
      done = count++ > 2 && monthIndex != date.month()
      monthIndex = date.month()

    weeks

  _renderMonthLabel: () ->
    <span>{@props.month.format("MMMM, YYYY")}</span>

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

module.exports = Marty.createContainer Calendar,
  listenTo: CalendarStore

  fetch:
    month: ->
      CalendarStore.state.month
    selectedDates: ->
      CalendarStore.state.selectedDates

  failed: (errors) ->
    console.log 'Failed rendering Calendar'
    console.log errors

