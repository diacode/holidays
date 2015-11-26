constants = require '../constants'
globals = require '../utils/globals'

module.exports =
  findForMonth: (date) ->
    (dispatch) =>
      $.get(Routes.api_v1_public_holidays_path(date: date))
      .done (data) ->
        dispatch
          type: constants.PUBLIC_HOLIDAYS_SET_MONTH_HOLIDAYS
          publicHolidays: data.public_holidays

  findForYear: (year) ->
    (dispatch) =>
      $.get(Routes.api_v1_public_holidays_path(year: year))
      .done (data) ->
        dispatch
          type: constants.RETRIEVED_YEAR_PUBLIC_HOLIDAYS
          publicHolidays: data.public_holidays

  setEditMode: (mode) ->
    (dispatch) =>
      dispatch
        type: constants.SET_PUBLIC_HOLIDAY_EDIT_MODE
        mode: mode

  addNew: ->
    (dispatch) =>
      dispatch
        type: constants.ADD_NEW_PUBLIC_HOLIDAY

  invalidateHolidays: ->
    (dispatch) =>
      dispatch
        type: constants.INVALIDATE_PUBLIC_HOLIDAYS

  setHoliday: (values) ->
    (dispatch) =>
      dispatch
        type: constants.SET_PUBLIC_HOLIDAY_VALUES
        publicHoliday: values

  removeHoliday: (id) ->
    (dispatch) =>
      dispatch
        type: constants.REMOVE_PUBLIC_HOLIDAY
        id: id

  save: (publicHolidays) ->
    (dispatch) =>
      publicHolidaysParams = publicHolidays.map (holiday) ->
        name: holiday.name
        day: holiday.day

      url = Routes.batch_create_api_v1_public_holidays_path()
      body =
        authenticity_token: globals.authenticity_token
        public_holidays_params:
          public_holidays: publicHolidaysParams

      $.ajax
        url: url
        type: "POST"
        datatype: 'json'
        contentType: "application/json"
        data: JSON.stringify(body)
      .done (data) =>
        dispatch
          type: constants.PUBLIC_HOLIDAYS_CREATION_SUCCESS
          publicHolidays: data.public_holidays

  update: (publicHolidays) ->
    (dispatch) =>
      url = Routes.batch_update_api_v1_public_holidays_path()
      body =
        authenticity_token: globals.authenticity_token
        public_holidays_params:
          public_holidays: publicHolidays

      $.ajax
        url: url
        type: "PATCH"
        datatype: 'json'
        contentType: "application/json"
        data: JSON.stringify(body)
      .done (data) =>
        dispatch
          type: constants.PUBLIC_HOLIDAYS_UPDATE_SUCCESS
          publicHolidays: data.public_holidays

  destroy: (id) ->
    (dispatch) =>
      url = Routes.api_v1_public_holiday_path(id)
      body =
        authenticity_token: globals.authenticity_token

      $.ajax
        url: url
        type: "DELETE"
        data: body
      .done (data) =>
        dispatch
          type: constants.PUBLIC_HOLIDAY_DESTROYED
          publicHoliday: data.public_holiday

  duplicateForYear: (year) ->
    (dispatch) =>
      $.get(Routes.api_v1_public_holidays_path(year: year))
      .done (data) ->
        dispatch
          type: constants.DUPLICATE_YEAR_PUBLIC_HOLIDAYS
          publicHolidays: data.public_holidays
