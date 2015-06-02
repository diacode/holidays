PublicHolidaysStore = require '../../stores/public_holidays_store'
moment = require 'moment'

PublicHolidaysSection = React.createClass
  displayName: 'PublicHolidaysSection'

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
    <div>
      <header>
        <h4>Current public holidays</h4>
      </header>
      <table className="table">
        <thead>
          <tr>
            <th>Day</th>
            <th>Name</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {@_renderPublicHolidays()}
        </tbody>
      </table>
    </div>

module.exports = Marty.createContainer PublicHolidaysSection,
  listenTo: PublicHolidaysStore

  fetch:
    publicHolidays: ->
      PublicHolidaysStore.getPublicHolidays()
