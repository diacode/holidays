Calendar = require '../calendar/calendar'
PublicHolidaysQueries = require '../../queries/public_holidays_queries'
moment = require 'moment'
PublicCalendarStore = require '../../stores/public_calendar_store'

PublicCalendarSection = React.createClass
  displayName: 'PublicCalendarSection'

  componentDidUpdate: (prevProps, prevState) ->
    for holiday in @props.publicHolidays
      id = holiday.day
      dayNode = $(this.getDOMNode()).find "##{id}"
      dayNode.append "<div class=\"public-holiday\">#{holiday.name}</div>"

  componentDidMount: ->
    date = moment().startOf("day").format 'YYYY-MM-DD'
    PublicHolidaysQueries.findForMonth date

  _handleMonthChanged: (month) ->
    PublicHolidaysQueries.findForMonth month.format 'YYYY-MM-DD'

  render: ->
    <div>
      <Calendar selectedDates={[]} datesChanged={false} monthChanged={@_handleMonthChanged}/>
    </div>

module.exports = Marty.createContainer PublicCalendarSection,
  listenTo: [
    PublicCalendarStore
  ]

  fetch:
    publicHolidays: ->
      PublicCalendarStore.getState().publicHolidays

  failed: (errors) ->
    console.log 'Failed rendering Public Holidays Section'
    console.log errors

