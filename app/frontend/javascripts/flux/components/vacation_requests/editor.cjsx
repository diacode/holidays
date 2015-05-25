Calendar = require '../calendar/calendar'
EditVacationRequestStore = require '../../stores/edit_vacation_request_store'
moment = require 'moment'
EditVacationRequestActionCreators = require '../../action_creators/edit_vacation_request_action_creators'
VacationRequestsActionCreators = require '../../action_creators/vacation_requests_action_creators'
SelectedDayListItem = sys = require '../selected_days/list_item'
PublicCalendarStore = require '../../stores/public_calendar_store'
PublicHolidaysQueries = require '../../queries/public_holidays_queries'

VacationRequestEditor = React.createClass
  displayName: 'VacationRequestEditor'

  componentDidMount: ->
    date = moment().startOf("day").format 'YYYY-MM-DD'
    PublicHolidaysQueries.findForMonth date

  _handleMonthChanged: (month) ->
    PublicHolidaysQueries.findForMonth month.format 'YYYY-MM-DD'

  _handleDatesChanged: (dates) ->
    if dates.length > @props.vacationRequest.requested_days.length then @_createDay(dates) else @_removeDay(dates)

  _createDay: (dates) ->
    for date in dates
      formatedDate = date.format('YYYY-MM-DD')

      index = _.findIndex @props.vacationRequest.requested_days, (requestedDay) ->
        formatedDate == requestedDay.day

      if index == -1
        day =
          id: null
          day: formatedDate
          status: 'approved'

        EditVacationRequestActionCreators.createDay @props.vacationRequest.id, day

  _removeDay: (dates) ->
    for requestedDay in @props.vacationRequest.requested_days
      index = _.findIndex dates, (date) ->
        formatedDate = date.format('YYYY-MM-DD')
        formatedDate == requestedDay.day

      if index == -1 then EditVacationRequestActionCreators.destroyDay @props.vacationRequest.id, requestedDay

  _renderRequestedDays: ->
    days = @props.vacationRequest.requested_days.map (day) =>
      <SelectedDayListItem key={day.id} vacationRequestId={@props.vacationRequest.id} {...day} />

    <ul className="selected-days-list">
      {days}
    </ul>

  _renderCalendar: ->
    dates = @props.vacationRequest.requested_days.map (day) ->
      moment(day.day)

    initialMonth = moment(@props.vacationRequest.requested_days[0].day).startOf("day")

    calendarProps =
      initialMonth: initialMonth
      selectedDates: dates
      datesChanged: @_handleDatesChanged
      publicHolidays: @props.publicHolidays
      monthChanged: @_handleMonthChanged

    <Calendar {...calendarProps}/>

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
      <header className="header">
        <img src={@props.vacationRequest.user_avatar} className="avatar" />
        <h4>{@props.vacationRequest.user_name}</h4>
        <p>{@props.vacationRequest.message}</p>
        <div className="batch-actions">
          <a className="approve" href="#" onClick={@_onApproveAllClick}>
            <i className="fa fa-check-circle"></i> Approve all
          </a>
          <a className="reject" href="#" onClick={@_onRejectAllClick}>
            <i className="fa fa-times-circle"></i> Reject all
          </a>
        </div>
      </header>
      <div className="calendar-wrapper">
        {@_renderCalendar()}
      </div>
      <div className="quested-dates-wrapper">
        {@_renderRequestedDays()}
      </div>
    </div>

module.exports = Marty.createContainer VacationRequestEditor,
  listenTo: [
    EditVacationRequestStore
    PublicCalendarStore
  ]

  fetch:
    vacationRequest: ->
      EditVacationRequestStore.fetchVacationRequest @props.vacationRequestId
    publicHolidays: ->
      PublicCalendarStore.getState().publicHolidays

  failed: (errors) ->
    console.log 'Failed rendering VacationRequestsList'
    console.log errors
