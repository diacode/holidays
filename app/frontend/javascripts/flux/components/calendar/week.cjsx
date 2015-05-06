classnames = require 'classnames'
Day = require './day'
moment = require 'moment'

module.exports = React.createClass
  displayName: 'Week'

  _handleAddDate: (date) ->
    @props.addDate date

  _handleRemoveDate: (date) ->
    @props.removeDate date

  render: () ->
    days = []
    date = @props.date
    month = @props.month

    now = moment()

    for i in [0...7] by 1
      day =
        name: date.format("dd").substring(0, 1)
        number: date.date()
        isCurrentMonth: date.month() is month.month()
        isToday: date.isSame new Date(), "day"
        date: date
        inThePast: date.isBefore now

      days.push <Day key={i} day={day} selectedDates={@props.selectedDates} addDate={@_handleAddDate} removeDate={@_handleRemoveDate}/>
      date = date.clone()
      date.add(1, "d")

    <div className="week" key={days[0].toString()}>
      {days}
    </div>
