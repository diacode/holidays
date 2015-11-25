moment = require 'moment'
SelectedDay = require './selected_day'
classnames = require 'classnames'
Link = require('react-router').Link

module.exports = React.createClass
  displayName: 'VacationRequestListItem'

  _renderDays: ->
    @props.requested_days.map (day) ->
      <SelectedDay key={day.id} {...day}/>

  _onApproveClick: (e) ->
    e.preventDefault()

    if confirm('Are you sure you want to approve this vacation request?')
      @app.actionCreators.vacationRequests.approve @props.id

  _onRejectClick: (e) ->
    e.preventDefault()

    if confirm('Are you sure you want to reject this vacation request?')
      @app.actionCreators.vacationRequests.reject @props.id

  _renderActions: ->
    return unless @props.editable

    <ul>
      <li>
        <a className="approve" href="#" onClick={@_onApproveClick}>
          <i className="fa fa-check-circle"></i> Approve
        </a>
      </li>
      <li>
        <a className="reject" href="#" onClick={@_onRejectClick}>
          <i className="fa fa-times-circle"></i> Reject
        </a>
      </li>
      <li>
        <Link to="edit_vacation_request" params={id: @props.id}>
          <i className="fa fa-edit"></i> Edit
        </Link>
      </li>
    </ul>

  render: ->
    className = classnames
      editable: @props.editable

    <li className={className}>
      <div className="requested-date-wrapper">
        {moment(@props.created_at).fromNow()}
      </div>
      <div className="avatar-wrapper">
        <img className="avatar" src={@props.user_avatar} />
      </div>
      <div className="user-data-wrapper">
        <strong>{@props.user_name}</strong> requested {@props.requested_days.length} days
        <br/>
        <p><em>{@props.message}</em></p>
        <ul className="selected-dates">
          {@_renderDays()}
        </ul>
      </div>
      <div className="actions">
        {@_renderActions()}
      </div>
    </li>
