Calendar = require '../calendar/calendar'
moment = require 'moment'

PublicCalendarSection = React.createClass
  displayName: 'PublicCalendarSection'

  componentDidMount: ->
    date = moment().startOf("day").format 'YYYY-MM-DD'
    @app.queries.publicHolidays.findForMonth date
    @app.queries.requestedDays.findForMonth date

  _handleMonthChanged: (month) ->
    @app.queries.publicHolidays.findForMonth month.format 'YYYY-MM-DD'
    @app.queries.requestedDays.findForMonth month.format 'YYYY-MM-DD'

  render: ->
    <div id="public_calendar_wrapper">
      <Calendar selectedDates={[]} datesChanged={false} monthChanged={@_handleMonthChanged} publicHolidays={@props.publicHolidays} approvedDays={@props.approvedRequestedDays} clickable={false}/>
    </div>

module.exports = Marty.createContainer PublicCalendarSection,
  listenTo: [
    'stores.publicCalendar'
  ]

  fetch:
    publicHolidays: ->
      @app.stores.publicCalendar.getState().publicHolidays
    approvedRequestedDays: ->
      @app.stores.publicCalendar.getState().approvedRequestedDays

  failed: (errors) ->
    console.log 'Failed rendering Public Holidays Section'
    console.log errors

