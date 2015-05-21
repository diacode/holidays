Calendar = require '../calendar/calendar'
PublicHolidaysQueries = require '../../queries/public_holidays_queries'
RequestedDaysQueries = require '../../queries/requested_days_queries'
moment = require 'moment'
PublicCalendarStore = require '../../stores/public_calendar_store'

PublicCalendarSection = React.createClass
  displayName: 'PublicCalendarSection'

  componentDidMount: ->
    date = moment().startOf("day").format 'YYYY-MM-DD'
    PublicHolidaysQueries.findForMonth date
    RequestedDaysQueries.findForMonth date

  _handleMonthChanged: (month) ->
    PublicHolidaysQueries.findForMonth month.format 'YYYY-MM-DD'
    RequestedDaysQueries.findForMonth month.format 'YYYY-MM-DD'

  render: ->
    <div>
      <Calendar selectedDates={[]} datesChanged={false} monthChanged={@_handleMonthChanged} publicHolidays={@props.publicHolidays} approvedDays={@props.approvedRequestedDays}/>
    </div>

module.exports = Marty.createContainer PublicCalendarSection,
  listenTo: [
    PublicCalendarStore
  ]

  fetch:
    publicHolidays: ->
      PublicCalendarStore.getState().publicHolidays
    approvedRequestedDays: ->
      PublicCalendarStore.getState().approvedRequestedDays

  failed: (errors) ->
    console.log 'Failed rendering Public Holidays Section'
    console.log errors

