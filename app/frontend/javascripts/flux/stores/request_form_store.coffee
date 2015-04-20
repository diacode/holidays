Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'RequestFormStore'

  handlers:
    setDatesValidated: Constants.requestForm.SET_DATES_VALIDATED
    reset: Constants.modal.HIDE
    setError: Constants.requestForm.SET_ERROR

  getInitialState: ->
    datesValidated: false

  setDatesValidated: (areValid) ->
    @setState
      datesValidated: areValid

  reset: ->
    @setState
      datesValidated: false
      error: null

  setError: (error) ->
    @setState
      error: error



