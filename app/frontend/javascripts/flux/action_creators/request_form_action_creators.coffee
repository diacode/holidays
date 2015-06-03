Constants = require '../constants/constants'

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
    @app.stateSources.vacationRequests.create(vacationRequest)
    .then (res) =>
      switch res.status
        when 200
          res.json().then (body) =>
            @dispatch Constants.requestForm.VACATION_REQUEST_CREATED, body
        when 422
          res.json().then (body) =>
            @dispatch Constants.requestForm.SET_ERROR, body
    .catch (err) =>
      @dispatch Constants.requestForm.SET_ERROR, 'An error ocurred while creating vacation request'
      console.log 'Error creating Vacation request'
      console.log err
