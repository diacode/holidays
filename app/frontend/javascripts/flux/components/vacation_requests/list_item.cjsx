moment = require 'moment'
SelectedDay = require './selected_day'
VacationRequestsActionCreators = require '../../action_creators/vacation_requests_action_creators'
classnames = require 'classnames'

module.exports = React.createClass
  displayName: 'VacationRequestListItem'

  _renderDays: ->
    @props.requested_days.map (day) ->
      <SelectedDay key={day.id} {...day}/>

  _onApproveClick: (e) ->
    e.preventDefault()

    if confirm('Are you sure you want to approve this vacation request?')
      VacationRequestsActionCreators.approve @props.id

  _onRejectClick: (e) ->
    e.preventDefault()

    if confirm('Are you sure you want to reject this vacation request?')
      VacationRequestsActionCreators.reject @props.id

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
        <a href={Routes.edit_vacation_request_path(@props.id)}>
          <i className="fa fa-edit"></i> Edit
        </a>
      </li>
    </ul>

  render: ->
    className = classnames
      editable: @props.editable

    <li className={className}>
      <div className="avatar-wrapper">
        <img className="avatar" src={@props.user_avatar} />
      </div>
      <div className="user-data-wrapper">
        <strong>{@props.user_name}</strong>
        <br/>
        <small>{moment(@props.created_at).fromNow()}</small>
        <p>{@props.message}</p>
      </div>
      <div className="requested-days-wrapper">
        <ul className="selected-dates">
          {@_renderDays()}
        </ul>
      </div>
      <div className="actions">
        {@_renderActions()}
      </div>
    </li>
