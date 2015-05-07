Calendar = require '../calendar/calendar'

PublicCalendarSection = React.createClass
  displayName: 'PublicCalendarSection'

  render: ->
    <div>
      <Calendar selectedDates={[]}/>
    </div>

module.exports = PublicCalendarSection
