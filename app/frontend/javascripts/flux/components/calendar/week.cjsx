classnames = require 'classnames'

module.exports = React.createClass
  displayName: 'Week'

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

      dayClasses = classnames
        day: true
        today: day.isToday
        'different-month': not day.isCurrentMonth

      days.push(<span key={day.date.toString()} className={dayClasses} onClick={@props.select.bind(null, day)}>{day.number}</span>)
      date = date.clone()
      date.add(1, "d")


    <div className="week" key={days[0].toString()}>
      {days}
    </div>
