DayNames = require './day_names'
Week = require './week'

module.exports = React.createClass
  getInitialState: () ->
      month: @props.selected.clone()

  previous: () ->
    month = @state.month
    month.add(-1, "M")
    @setState
      month: month

  next: () ->
    month = @state.month
    month.add(1, "M")
    @setState
      month: month

  select: (day) ->
    @props.selected = day.date
    @forceUpdate()

  render: () ->
    <div className="calendar">
      <div className="header">
        <i className="fa fa-angle-left" onClick={@previous}></i>
        {@renderMonthLabel()}
        <i className="fa fa-angle-right" onClick={@next}></i>
      </div>
      <DayNames />
      {@renderWeeks()}
    </div>

  renderWeeks: () ->
    weeks = []
    done = false
    date = @state.month.clone().startOf("month").add("w" -1).day("Sunday")
    monthIndex = date.month()
    count = 0

    while not done
      weeks.push <Week key={date.toString()} date={date.clone()} month={@state.month} select={@select} selected={@props.selected} />

      date.add(1, "w")
      done = count++ > 2 && monthIndex != date.month()
      monthIndex = date.month()

    weeks

  renderMonthLabel: () ->
    <span>{@state.month.format("MMMM, YYYY")}</span>
