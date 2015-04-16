classnames = require 'classnames'

module.exports = React.createClass
  displayName: 'Day'

  getInitialState: ->
    selected: false

  _onClick: (e)->
    e.preventDefault()
    @setState
      selected: !@state.selected
    @props.dateSelected @props.day.date

  render: ->
    dayClasses = classnames
      day: true
      today: @props.day.isToday
      'different-month': not @props.day.isCurrentMonth
      selected: @state.selected

    <span key={@props.day.date.toString()} className={dayClasses} onClick={@_onClick}>{@props.day.number}</span>
