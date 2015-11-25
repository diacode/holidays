moment = require 'moment'

module.exports = React.createClass
  displayName: 'PublicHoliday'

  _handleOnChange: (e) ->
    values =
      id: @props.id
      day: @refs.date.getDOMNode().value
      name: @refs.name.getDOMNode().value

    @app.actionCreators.publicHolidays.setHoliday values

  _handleOnRemoveClick: (e) ->
    e.preventDefault()
    @app.actionCreators.publicHolidays.removeHoliday @props.id

  _handleOnDestroyClick: (e) ->
    e.preventDefault()
    if confirm('Are you sure?')
      @app.actionCreators.publicHolidays.destroyHoliday @props.id

  _renderReadOnly: ->
    <tr key={@props.id}>
      <td>{moment(@props.day).format('dddd, MMMM Do YYYY')}</td>
      <td>{@props.name}</td>
      <td className="actions">
        <a href="#" onClick={@_handleOnDestroyClick}>
          <i className="fa fa-trash"></i>
        </a>
      </td>
    </tr>

  _renderEditable: ->
    <tr>
      <td>
        <input ref="date" type="date" onChange={@_handleOnChange} value={@props.day} />
      </td>
      <td>
        <input ref="name" type="text" onChange={@_handleOnChange} value={@props.name} placeholder="Holiday name" />
      </td>
      <td className="actions">
        <a href="#" onClick={@_handleOnRemoveClick}>
          <i className="fa fa-trash"></i>
        </a>
      </td>
    </tr>

  render: ->
    if @props.editMode is true then @_renderEditable() else @_renderReadOnly()
