PublicHoliday = require './holiday'
moment = require 'moment'

module.exports = React.createClass
  displayName: 'PublicHolidaysList'

  _renderPublicHolidays: ->
    publicHolidays = @props.publicHolidays.map (holiday, i) =>
      <PublicHoliday key={i} editMode={@props.editMode} {...holiday} />

    newPublicHolidays = @props.newPublicHolidays.map (holiday) =>
      <PublicHoliday key={"new-#{holiday.id}"} editMode={true} {...holiday} />

    publicHolidays.concat newPublicHolidays

  render: ->
    <table className="table form">
      <thead>
        <tr>
          <th className="day">Day</th>
          <th>Name</th>
          <th className="actions"></th>
        </tr>
      </thead>
      <tbody>
        {@_renderPublicHolidays()}
      </tbody>
    </table>

