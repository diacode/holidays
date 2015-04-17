Calendar = require '../calendar/calendar'
CalendarStore = require '../../stores/calendar_store'
RequestFormStore = require '../../stores/request_form_store'
RequestFormActionCreators = require '../../action_creators/request_form_action_creators'
ModalActionCreators = require '../../action_creators/modal_action_creators'

RequestForm = React.createClass
  displayName: 'RequestForm'

  _renderSelectedDates: ->
    return unless @props.datesValidated

    dates = @props.selectedDates.map (date, i) ->
      <li key={i}>{date.format("dddd, MMMM Do YYYY")}</li>

    <ul className="selected-dates">
      {dates}
      <li>
        <a href="#" onClick={@_showCalendar}>Change dates</a>
      </li>
    </ul>

  _showCalendar: ->
    RequestFormActionCreators.setDatesValidated(false)

  _renderCalendar: ->
    return if @props.datesValidated
    <div>
      <Calendar />
      <div className="right">
        <a href="#" onClick={@_validateSelectedDates}>Add a comment <i className="fa fa-arrow-right"/></a>
      </div>
    </div>

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
      <textarea cols="30" name="" placeholder="Comments..." rows="10"></textarea>
    </div>

  _renderActions: ->
    <div className="actions">
      <a href="#" onClick={@_hideModal}>Cancel</a>
      <button className="btn" type="submit">
        Create request
      </button>
    </div>

  render: ->
    <div className="holidays-modal">
      <form action="">
        <header>
          <h3>Request holidays</h3>
        </header>
        <div className="data-wrapper">
          <div className="calendar-wrapper">
            <h5>Select desired dates:</h5>
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
    CalendarStore
    RequestFormStore
  ]

  fetch:
    selectedDates: ->
      CalendarStore.state.selectedDates
    datesValidated: ->
      RequestFormStore.state.datesValidated

  failed: (errors) ->
    console.log 'Failed rendering Calendar'
    console.log errors
