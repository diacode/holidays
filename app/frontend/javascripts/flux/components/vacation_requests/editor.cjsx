Calendar = require '../calendar/calendar'
EditVacationRequestStore = require '../../stores/edit_vacation_request_store'
SelectedDay = require './selected_day'
moment = require 'moment'
EditVacationRequestActionCreators = require '../../action_creators/edit_vacation_request_action_creators'
VacationRequestsActionCreators = require '../../action_creators/vacation_requests_action_creators'

VacationRequestEditor = React.createClass
  displayName: 'VacationRequestEditor'

  _handleDatesChanged: (dates) ->
    EditVacationRequestActionCreators.setRequestedDays dates

  _renderRequestedDays: ->
    days = @props.vacationRequest.requested_days.map (day) =>
      <li key={day.id}>
        <ul className="selected-dates">
          <SelectedDay {...day} />
        </ul>
        <div className="actions">
          {@_renderDayActions(day)}
        </div>
      </li>

    <ul className="selected-days-list">
      {days}
    </ul>

  _renderDayActions: (day) ->
    actions = []

    if day.status != 'approved'
      actions.push <a className="approve" href="#x" onClick={@_onApproveClick}>
        <i className="fa fa-check-circle"></i> Approve
      </a>

    if day.status != 'rejected'
      actions.push <a className="reject" href="#" onClick={@_onRejectClick}>
        <i className="fa fa-times-circle"></i> Reject
      </a>

    actions

  _renderCalendar: ->
    dates = @props.vacationRequest.requested_days.map (day) ->
      moment(day.day)

    <Calendar selectedDates={dates} datesChanged={@_handleDatesChanged}/>

  _onApproveAllClick: (e) ->
    e.preventDefault()

    if confirm('Are you sure you want to approve this vacation request?')
      VacationRequestsActionCreators.approve @props.vacationRequest.id

  _onRejectAllClick: (e) ->
    e.preventDefault()

    if confirm('Are you sure you want to reject this vacation request?')
      VacationRequestsActionCreators.reject @props.vacationRequest.id

  render: ->
    <div className="wrapper">
      {@_renderCalendar()}
      <div className="quested-dates-wrapper">
        <div className="batch-actions">
          <a className="approve" href="#" onClick={@_onApproveAllClick}>
            <i className="fa fa-check-circle"></i> Approve all
          </a>
          <a className="reject" href="#" onClick={@_onRejectAllClick}>
            <i className="fa fa-times-circle"></i> Reject all
          </a>
        </div>
        {@_renderRequestedDays()}
      </div>
    </div>

module.exports = Marty.createContainer VacationRequestEditor,
  listenTo: EditVacationRequestStore

  fetch:
    vacationRequest: ->
      EditVacationRequestStore.fetchVacationRequest @props.vacationRequestId

  failed: (errors) ->
    console.log 'Failed rendering VacationRequestsList'
    console.log errors
