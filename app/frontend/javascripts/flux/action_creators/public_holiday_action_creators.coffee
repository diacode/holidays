Constants = require '../constants/constants'

module.exports = Marty.createActionCreators
  id: 'PublicHolidayActionCreators'

  addNew: ->
    @dispatch Constants.publicHolidays.ADD_NEW_PUBLIC_HOLIDAY

  setHoliday: (values) ->
    @dispatch Constants.publicHolidays.SET_PUBLIC_HOLIDAY_VALUES, values

  removeHoliday: (id) ->
    @dispatch Constants.publicHolidays.REMOVE_PUBLIC_HOLIDAY, id

  invalidateHolidays: ->
    @dispatch Constants.publicHolidays.INVALIDATE_PUBLIC_HOLIDAYS

  save: (publicHolidays) ->
    @app.stateSources.publicHolidays.batchCreate(publicHolidays)
    .then (res) =>
      res.json().then (body)=>
        switch res.status
          when 200
            @dispatch Constants.publicHolidays.PUBLIC_HOLIDAYS_CREATION_SUCCESS, body.public_holidays
          when 422
            console.log 'Error creating public holidays'
    .catch (err) =>
      console.log 'Error creating public holidays'
      console.log err

  update: (publicHolidays) ->
    @app.stateSources.publicHolidays.batchUpdate(publicHolidays)
    .then (res) =>
      res.json().then (body)=>
        switch res.status
          when 200
            @dispatch Constants.publicHolidays.PUBLIC_HOLIDAYS_UPDATE_SUCCESS, body.public_holidays
          when 422
            console.log 'Error updating public holidays'
    .catch (err) =>
      console.log 'Error creating public holidays'
      console.log err

  setEditMode: (mode) ->
    @dispatch Constants.publicHolidays.SET_PUBLIC_HOLIDAY_EDIT_MODE, mode


