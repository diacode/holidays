classnames = require 'classnames'
Day = require './day'

module.exports = React.createClass
  displayName: 'Week'

  _onDateSelected: (date) ->

  render: () ->
    days = []
    date = @props.date
    month = @props.month

    for i in [0...7] by 1
      day =
        name: date.format("dd").substring(0, 1)
        number: date.date()
        isCurrentMonth: date.month() is month.month()
        isToday: date.isSame new Date(), "day"
        date: date

      days.push <Day day={day} dateSelected={@_onDateSelected}/>
      date = date.clone()
      date.add(1, "d")

    <div className="week" key={days[0].toString()}>
      {days}
    </div>
