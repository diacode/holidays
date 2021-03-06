editVacationRequestActions = require '../../actions/edit_vacation_request'
SelectedDay = require '../vacation_requests/selected_day'

module.exports = React.createClass
  displayName: 'SelectedDayListItem'

  _renderActions: ->
    actions = []

    if @props.status != 'approved'
      actions.push <a key="approve" className="approve" href="#x" onClick={@_onApproveClick}>
        <i className="fa fa-check-circle"></i> Approve
      </a>

    if @props.status != 'rejected'
      actions.push <a key="reject" className="reject" href="#" onClick={@_onRejectClick}>
        <i className="fa fa-times-circle"></i> Reject
      </a>

    actions

  _onApproveClick: (e) ->
    e.preventDefault()
    if confirm('Are you sure you want to approve this day?')
      @props.dispatch editVacationRequestActions.approveDay(@props.vacationRequestId, @props.id)


  _onRejectClick: (e) ->
    e.preventDefault()
    if confirm('Are you sure you want to reject this day?')
      @props.dispatch editVacationRequestActions.rejectDay(@props.vacationRequestId, @props.id)

  render: ->
    <li>
      <ul className="selected-dates">
        <SelectedDay {...@props} />
      </ul>
      <div className="actions">
        {@_renderActions()}
      </div>
    </li>
