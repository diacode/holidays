Calendar = require '../calendar/calendar'
RequestFormStore = require '../../stores/request_form_store'
RequestFormActionCreators = require '../../action_creators/request_form_action_creators'
ModalActionCreators = require '../../action_creators/modal_action_creators'
PublicCalendarStore = require '../../stores/public_calendar_store'
PublicHolidaysQueries = require '../../queries/public_holidays_queries'
moment = require 'moment'

RequestForm = React.createClass
  displayName: 'RequestForm'

  componentDidMount: ->
    date = moment().startOf("day").format 'YYYY-MM-DD'
    PublicHolidaysQueries.findForMonth date

  _handleMonthChanged: (month) ->
    PublicHolidaysQueries.findForMonth month.format 'YYYY-MM-DD'

  _renderSelectedDates: ->
    return unless @props.datesValidated

    sortedDates = _.sortBy @props.selectedDates, (n) ->
      n

    dates = sortedDates.map (date, i) ->
      <li key={i}>
        <header>{date.format("MMM")}</header>
        <div className="day">
          <strong>{date.format("DD")}</strong>
        </div>
      </li>

    <div>
      <h5>Selected dates:</h5>
      <ul className="selected-dates">
        {dates}
      </ul>
    </div>

  _showCalendar: ->
    RequestFormActionCreators.setDatesValidated(false)

  _renderCalendar: ->
    return if @props.datesValidated

    calendarProps =
      selectedDates: @props.selectedDates
      datesChanged: @_handleDatesChanged
      publicHolidays: @props.publicHolidays
      monthChanged: @_handleMonthChanged

    <div key="calendar">
      <h5>Select desired dates:</h5>
      <Calendar {...calendarProps}/>
      <div className="right">
        <a href="#" onClick={@_validateSelectedDates} disabled={@props.selectedDates.length == 0}>Add a comment <i className="fa fa-arrow-right"/></a>
      </div>
    </div>

  _handleDatesChanged: (dates) ->
    RequestFormActionCreators.setSelectedDates dates

  _validateSelectedDates: (e) ->
    e.preventDefault()
    RequestFormActionCreators.setDatesValidated @props.selectedDates.length > 0

  _hideModal: (e) ->
    e.preventDefault()
    ModalActionCreators.hide()

  _renderFormInputs: ->
    return unless @props.datesValidated

    <div className="holidays-data-wrapper">
      <h5>Want to add a comment?</h5>
      <textarea ref="message" cols="30" name="" placeholder="Comments..." rows="10"></textarea>
      <br/>
      <a href="#" onClick={@_showCalendar}><i className="fa fa-arrow-left"/> Change dates</a>
    </div>

  _renderActions: ->
    <div className="actions">
      <a href="#" onClick={@_hideModal}>Cancel</a>
      <button className="btn" type="submit" disabled={@props.selectedDates.length == 0}>
        Create request
      </button>
    </div>

  _onSubmit: (e)->
    e.preventDefault()

    return unless @props.selectedDates.length > 0

    message = if @refs.message != undefined then @refs.message.getDOMNode().value.trim() else ''

    requestedDaysAttributes = @props.selectedDates.map (date) ->
      day: date.format 'YYYY-MM-DD'


    vacationRequest =
      message: message
      requested_days_attributes: requestedDaysAttributes

    RequestFormActionCreators.create vacationRequest

  _renderError: ->
    return unless @props.error

    errors = @props.error.base.map (error, i) ->
      <li key={i}>{error}</li>

    <div className="message error-message">
      <ul>
        {errors}
      </ul>
    </div>

  render: ->
    <div className="holidays-modal">
      <form onSubmit={@_onSubmit}>
        <header>
          <h3>Request holidays</h3>
        </header>
        {@_renderError()}
        <div className="data-wrapper">
          <div className="calendar-wrapper">
            {@_renderCalendar()}
            {@_renderSelectedDates()}
          </div>
          {@_renderFormInputs()}
        </div>
        {@_renderActions()}
      </form>
    </div>

module.exports = Marty.createContainer RequestForm,
  listenTo: [
    RequestFormStore
    PublicCalendarStore
  ]

  fetch:
    selectedDates: ->
      RequestFormStore.state.selectedDates
    datesValidated: ->
      RequestFormStore.state.datesValidated
    error: ->
      RequestFormStore.state.error
    publicHolidays: ->
      PublicCalendarStore.getState().publicHolidays

  failed: (errors) ->
    console.log 'Failed rendering RequestForm'
    console.log errors
