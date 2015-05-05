Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'RequestFormStore'

  handlers:
    setDatesValidated: Constants.requestForm.SET_DATES_VALIDATED
    reset: Constants.modal.HIDE
    setError: Constants.requestForm.SET_ERROR
    setSelectedDates: Constants.requestForm.SET_SELECTED_DATES

  getInitialState: ->
    datesValidated: false
    selectedDates: []

  setSelectedDates: (dates) ->
    @setState
      selectedDates: dates

  setDatesValidated: (areValid) ->
    @setState
      datesValidated: areValid

  reset: ->
    @setState
      datesValidated: false
      error: null
      selectedDates: []

  setError: (error) ->
    @setState
      error: error



