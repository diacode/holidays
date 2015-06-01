Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'RequestFormStore'

  handlers:
    setShowForm: Constants.requestForm.SET_SHOW_REQUEST_FORM
    setDatesValidated: Constants.requestForm.SET_DATES_VALIDATED
    setError: Constants.requestForm.SET_ERROR
    setSelectedDates: Constants.requestForm.SET_SELECTED_DATES
    hideForm: Constants.requestForm.VACATION_REQUEST_CREATED

  getInitialState: ->
    showForm: false
    datesValidated: false
    selectedDates: []

  setSelectedDates: (dates) ->
    @setState
      selectedDates: dates

  setDatesValidated: (areValid) ->
    @setState
      datesValidated: areValid

  setShowForm: (show) ->
    @state.showForm = show

    if show is false
      @state.datesValidated = false
      @state.error = null
      @state.selectedDates = []

    @hasChanged()

  hideForm: ->
    @setShowForm false

  setError: (error) ->
    @setState
      error: error



