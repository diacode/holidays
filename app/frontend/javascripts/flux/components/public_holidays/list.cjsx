PublicHolidaysStore = require '../../stores/public_holidays_store'
moment = require 'moment'

module.exports = React.createClass
  displayName: 'PublicHolidaysList'

  _renderPublicHolidays: ->
    @props.publicHolidays.map (holiday) ->
      <tr key={holiday.id}>
        <td>{moment(holiday.day).format('dddd, MMMM Do YYYY')}</td>
        <td>{holiday.name}</td>
        <td className="actions">
          <a href="#" onClick={@_handleOnRemoveClick}>
            <i className="fa fa-trash"></i>
          </a>
        </td>
      </tr>

  render: ->
    <table className="table">
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

