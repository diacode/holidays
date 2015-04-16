Constants = require '../constants/constants'

module.exports = Marty.createActionCreators
  id: 'RequestFormActionCreators'

  setDatesValidated: (areValid) ->
    @dispatch Constants.requestForm.SET_DATES_VALIDATED, areValid
