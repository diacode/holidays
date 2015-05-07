classnames = require 'classnames'

module.exports = React.createClass
  displayName: 'Day'

  getInitialState: ->
    selected: @_belongsToSelectedDates()

  componentWillUpdate: (nextProps, nextState) ->
    return unless nextState.selected != @state.selected

    if nextState.selected
      @props.addDate @props.day.date
    else
      @props.removeDate @props.day.date

  componentWillReceiveProps: (nextProps) ->
    @state.selected = @_belongsToSelectedDates nextProps.selectedDates

  _onClick: (e)->
    e.preventDefault()
    return if @props.day.inThePast

    selected = !@state.selected

    @setState
      selected: selected

  _belongsToSelectedDates: (selectedDates = @props.selectedDates) ->
    return unless selectedDates.length > 0

    index = _.findIndex selectedDates, (date) =>
      @props.day.date.isSame date

    index >= 0

  render: ->
    dayClasses = classnames
      day: true
      today: @props.day.isToday
      'different-month': not @props.day.isCurrentMonth
      'past': @props.day.inThePast
      selected: @state.selected || @_belongsToSelectedDates()

    <div key={@props.day.date.toString()} className={dayClasses} onClick={@_onClick}>
      <span className="day-number">{@props.day.number}</span>
    </div>
