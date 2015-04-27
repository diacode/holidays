classnames = require 'classnames'
CalendarActionCreators = require '../../action_creators/calendar_action_creators'

module.exports = React.createClass
  displayName: 'Day'

  getInitialState: ->
    selected: @_belongsToSelectedDates()

  componentWillUpdate: (nextProps, nextState) ->
    return unless nextState.selected != @state.selected

    if nextState.selected
      CalendarActionCreators.addDate @props.day.date
    else
      CalendarActionCreators.removeDate @props.day.date

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

    <span key={@props.day.date.toString()} className={dayClasses} onClick={@_onClick}>{@props.day.number}</span>
