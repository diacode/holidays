constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  fetchVacationRequests: (page = 1) ->
    (dispatch) =>
      $.get(Routes.api_v1_vacation_requests_path(page: page))
      .done (data) ->
        dispatch
          type: constants.VACATION_REQUESTS_RECEIVED
          vacationRequests: data.vacation_requests
          meta: data.meta

  find: (id) ->
    (dispatch) =>
      $.get(Routes.api_v1_vacation_request_path(id))
      .done (data) ->
        dispatch
          type: constants.EDIT_VACATION_REQUEST_SET
          vacationRequest: data.vacation_request

  approve: (id) ->
    (dispatch) =>
      $.ajax
        url: Routes.approve_api_v1_vacation_request_path(id)
        type: 'PATCH'
        data:
          authenticity_token: globals.authenticity_token
      .done (data) =>
        dispatch
          type: constants.VACATION_REQUEST_REPLACE
          vacationRequest: data.vacation_request

  reject: (id) ->
    (dispatch) =>
      $.ajax
        url: Routes.reject_api_v1_vacation_request_path(id)
        type: 'PATCH'
        data:
          authenticity_token: globals.authenticity_token
      .done (data) =>
        dispatch
          type: constants.VACATION_REQUEST_REPLACE
          vacationRequest: data.vacation_request
