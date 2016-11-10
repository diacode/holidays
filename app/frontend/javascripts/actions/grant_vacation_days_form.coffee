constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  showForm: (show = true) ->
    (dispatch) =>
      dispatch
        type: constants.GRANT_FORM_SET_SHOW_FORM
        showForm: show

  # setDatesAreValid: (valid = true) ->
  #   (dispatch) =>
  #     dispatch
  #       type: constants.REQUEST_FORM_SET_DATES_ARE_VALID
  #       areValid: valid
  #
  # setSelectedDates: (dates) ->
  #   (dispatch) =>
  #     dispatch
  #       type: constants.REQUEST_FORM_SET_SELECTED_DATES
  #       dates: dates
  #
  # create: (vacationRequest) ->
  #   (dispatch) =>
  #     url = Routes.api_v1_vacation_requests_path()
  #     body =
  #       authenticity_token: globals.authenticityToken
  #       vacation_request: vacationRequest
  #
  #     $.post(url, body)
  #     .done (data) =>
  #       dispatch
  #         type: constants.REQUEST_FORM_RESET_FORM
  #
  #       dispatch
  #         type: constants.REQUEST_FORM_SET_SHOW_FORM
  #         showForm: false
  #
  #     .fail (data) =>
  #       dispatch
  #         type: constants.person.REQUEST_FORM_SET_ERROR
  #         errors: data.responseJSON
