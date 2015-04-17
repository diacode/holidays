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

  _onClick: (e)->
    e.preventDefault()
    selected = !@state.selected

    @setState
      selected: selected

  _belongsToSelectedDates: ->
    return unless @props.selectedDates.length > 0

    index = _.findIndex @props.selectedDates, (date) =>
      @props.day.date.isSame date

    index >= 0

  render: ->
    dayClasses = classnames
      day: true
      today: @props.day.isToday
      'different-month': not @props.day.isCurrentMonth
      selected: @state.selected || @_belongsToSelectedDates()

    <span key={@props.day.date.toString()} className={dayClasses} onClick={@_onClick}>{@props.day.number}</span>
