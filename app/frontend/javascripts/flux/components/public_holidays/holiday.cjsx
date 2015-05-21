PublicHolidayActionCreators = require '../../action_creators/public_holiday_action_creators'

module.exports = React.createClass
  displayName: 'PublicHoliday'

  _handleOnChange: (e) ->
    values =
      id: @props.id
      date: @refs.date.getDOMNode().value
      name: @refs.name.getDOMNode().value

    PublicHolidayActionCreators.setHoliday values

  _handleOnRemoveClick: (e) ->
    e.preventDefault()
    PublicHolidayActionCreators.removeHoliday @props.id

  render: ->
    <tr>
      <td>
        <input ref="date" type="date" onChange={@_handleOnChange} value={@props.date} />
      </td>
      <td>
        <input ref="name" type="text" onChange={@_handleOnChange} value={@props.name} />
      </td>
      <td>
        <a href="#" onClick={@_handleOnRemoveClick}>
          <i className="fa fa-trash"></i>
        </a>
      </td>
    </tr>
