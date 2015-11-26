{ connect } = require 'react-redux'
actions = require '../../actions'
moment = require 'moment'

Calendar = require '../calendar/calendar'
SelectedDayListItem = require '../selected_days/list_item'

VacationRequestEdit = React.createClass
  displayName: 'VacationRequestEdit'

  componentDidMount: ->
    date = moment().startOf("day").format 'YYYY-MM-DD'
    @props.dispatch actions.publicHolidays.findForMonth(date)
    @props.dispatch actions.vacationRequests.find(@props.params.id)


  _handleMonthChanged: (month) ->
    @props.dispatch actions.publicHolidays.findForMonth(month.format 'YYYY-MM-DD')

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

        @props.dispatch actions.editVacationRequest.createDay(@props.vacationRequest.id, day)

  _removeDay: (dates) ->
    for requestedDay in @props.vacationRequest.requested_days
      index = _.findIndex dates, (date) ->
        formatedDate = date.format('YYYY-MM-DD')
        formatedDate == requestedDay.day

      if index == -1 then @props.dispatch actions.editVacationRequest.destroyDay(@props.vacationRequest.id, requestedDay.id)

  _renderRequestedDays: ->
    days = @props.vacationRequest.requested_days.map (day) =>
      <SelectedDayListItem key={day.id} vacationRequestId={@props.vacationRequest.id} dispatch={@props.dispatch} {...day} />

    <ul className="selected-days-list">
      {days}
    </ul>

  _renderCalendar: ->
    return unless @props.vacationRequest.id

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
      @props.dispatch actions.vacationRequests.approve(@props.vacationRequest.id)

  _onRejectAllClick: (e) ->
    e.preventDefault()

    if confirm('Are you sure you want to reject this vacation request?')
      @props.dispatch actions.vacationRequests.reject(@props.vacationRequest.id)

  render: ->
    <section id="vacation_request_editor">
      <div className="container">
        <header>
          <h2>Vacation request</h2>
          <div className="actions">
            <a className="approve btn" href="#" onClick={@_onApproveAllClick}>
              <i className="fa fa-check-circle"></i> Approve vacation request
            </a>
            <a className="reject" href="#" onClick={@_onRejectAllClick}>
              <i className="fa fa-times-circle"></i> Reject all days
            </a>
          </div>
        </header>
        <div className="wrapper box">
          <header className="header">
            <img src={@props.vacationRequest.user_avatar} className="avatar" />
            <h4>{@props.vacationRequest.user_name}</h4>
            <p>{@props.vacationRequest.message}</p>
          </header>
          <div className="calendar-wrapper">
            {@_renderCalendar()}
          </div>
          <div className="quested-dates-wrapper">
            <h4>Resquested days</h4>
            {@_renderRequestedDays()}
          </div>
        </div>
      </div>
    </section>

mapStateToProps = (state) ->
  state.editVacationRequest

module.exports = connect(mapStateToProps)(VacationRequestEdit)
