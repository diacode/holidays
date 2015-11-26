{ connect } = require 'react-redux'

Calendar = require '../calendar/calendar'
moment = require 'moment'
actions = require '../../actions'

PublicCalendarIndex = React.createClass
  displayName: 'PublicCalendarIndex'

  componentDidMount: ->
    date = moment().startOf("day").format 'YYYY-MM-DD'
    @props.dispatch actions.publicCalendar.fetchDataForMonth(date)

  _handleMonthChanged: (month) ->
    date = month.format 'YYYY-MM-DD'
    @props.dispatch actions.publicCalendar.fetchDataForMonth(date)

  render: ->
    <div id="public_calendar_wrapper">
      <Calendar selectedDates={[]} datesChanged={false} monthChanged={@_handleMonthChanged} publicHolidays={@props.publicHolidays} approvedDays={@props.approvedRequestedDays} clickable={false}/>
    </div>


mapStateToProps = (state) ->
  state.publicCalendar

module.exports = connect(mapStateToProps)(PublicCalendarIndex)
