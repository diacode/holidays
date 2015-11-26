constants = require '../constants'
moment = require 'moment'

initialState =
  publicHolidays: []
  editMode: false
  newPublicHolidays: []
  validationSucceed: true
  previousYearHolidaysEmpty: false

getNewId = (state) ->
  return 1 if state.newPublicHolidays.length == 0
  _.last(state.newPublicHolidays).id + 1

module.exports = (state = initialState, action) ->
  switch action.type
    when constants.RETRIEVED_YEAR_PUBLIC_HOLIDAYS
      _.assign {}, state, publicHolidays: action.publicHolidays

    when constants.SET_PUBLIC_HOLIDAY_EDIT_MODE
      _.assign {}, state, editMode: action.mode, newPublicHolidays: [], successMessage: null

    when constants.INVALIDATE_PUBLIC_HOLIDAYS
      _.assign {}, state, validationSucceed: false

    when constants.SET_PUBLIC_HOLIDAY_VALUES
      holidays = if state.editMode is true
        _.cloneDeep state.publicHolidays
      else
        _.cloneDeep state.newPublicHolidays

      holiday = _.findWhere holidays, id: action.publicHoliday.id
      _.assign(holiday, action.publicHoliday)

      if state.editMode is true
        _.assign {}, state, publicHolidays: holidays
      else
        _.assign {}, state, newPublicHolidays: holidays

    when constants.REMOVE_PUBLIC_HOLIDAY
      newPublicHolidays = _.cloneDeep state.newPublicHolidays
      index =  _.indexOf newPublicHolidays, _.findWhere(newPublicHolidays, id: action.id)
      newPublicHolidays.splice(index, 1)

      _.assign {}, state, newPublicHolidays: newPublicHolidays

    when constants.ADD_NEW_PUBLIC_HOLIDAY
      newDay =
        id: getNewId(state)
        name: ''
        day: ''

      newPublicHolidays = _.cloneDeep state.newPublicHolidays
      newPublicHolidays.push newDay

      _.assign {}, state, newPublicHolidays: newPublicHolidays

    when constants.PUBLIC_HOLIDAYS_CREATION_SUCCESS
      publicHolidays = _.cloneDeep(state.publicHolidays).concat action.publicHolidays
      publicHolidays = _.sortBy publicHolidays, (holiday) ->
        holiday.day

      newState =
        publicHolidays: publicHolidays
        newPublicHolidays: []
        validationSucceed: true
        successMessage: 'Public holidays created with success'

      _.assign {}, state, newState

    when constants.PUBLIC_HOLIDAYS_UPDATE_SUCCESS
      publicHolidays = _.cloneDeep state.publicHolidays
      publicHolidays = _.sortBy publicHolidays, (holiday) ->
        holiday.day

      newState =
        publicHolidays: publicHolidays
        validationSucceed: true
        successMessage: 'Public holidays updated with success'
        editMode: false

      _.assign {}, state, newState

    when constants.PUBLIC_HOLIDAY_DESTROYED
      publicHolidays = _.cloneDeep state.publicHolidays
      index =  _.indexOf publicHolidays, _.findWhere(publicHolidays, id: action.publicHoliday.id)
      publicHolidays.splice(index, 1)

      _.assign {}, state, publicHolidays: publicHolidays, successMessage: 'Holiday destroyed successfully'

    when constants.DUPLICATE_YEAR_PUBLIC_HOLIDAYS
      newPublicHolidays = []
      previousYearHolidaysEmpty = action.publicHolidays.length == 0

      for holiday in action.publicHolidays
        newDay =
          id: getNewId(state)
          name: holiday.name
          day: moment(holiday.day).add(1, 'year').format('YYYY-MM-DD')

        newPublicHolidays.push newDay

      _.assign {}, state, newPublicHolidays: newPublicHolidays, previousYearHolidaysEmpty: previousYearHolidaysEmpty

    else
      state
