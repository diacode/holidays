Constants = require '../constants/constants'
VacationRequestsAPI = require '../state_sources/vacation_requests_source'

module.exports = Marty.createActionCreators
  id: 'RequestFormActionCreators'

  showForm: ->
    @dispatch Constants.requestForm.SET_SHOW_REQUEST_FORM, true

  hideForm: ->
    @dispatch Constants.requestForm.SET_SHOW_REQUEST_FORM, false

  setDatesValidated: (areValid) ->
    @dispatch Constants.requestForm.SET_DATES_VALIDATED, areValid

  setSelectedDates: (dates) ->
    @dispatch Constants.requestForm.SET_SELECTED_DATES, dates

  create: (vacationRequest) ->
    VacationRequestsAPI.create(vacationRequest)
    .then (res) =>
      switch res.status
        when 200
          @dispatch Constants.requestForm.VACATION_REQUEST_CREATED, res.body
        when 422
          @dispatch Constants.requestForm.SET_ERROR, res.body
    .catch (err) =>
      @dispatch Constants.requestForm.SET_ERROR, 'An error ocurred while creating vacation request'
      console.log 'Error creating Vacation request'
      console.log err
