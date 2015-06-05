Constants = require '../constants/constants'
moment = require 'moment'

module.exports = Marty.createStore
  id: 'PublicHolidaysStore'

  handlers:
    setPublicHolidays: Constants.publicHolidays.RETRIEVED_YEAR_PUBLIC_HOLIDAYS
    setEditMode: Constants.publicHolidays.SET_PUBLIC_HOLIDAY_EDIT_MODE

    addNew: Constants.publicHolidays.ADD_NEW_PUBLIC_HOLIDAY
    setHoliday: Constants.publicHolidays.SET_PUBLIC_HOLIDAY_VALUES
    removeNewPublicHoliday: Constants.publicHolidays.REMOVE_PUBLIC_HOLIDAY
    invalidateHolidays: Constants.publicHolidays.INVALIDATE_PUBLIC_HOLIDAYS
    creationSuccess: Constants.publicHolidays.PUBLIC_HOLIDAYS_CREATION_SUCCESS
    updateSuccess: Constants.publicHolidays.PUBLIC_HOLIDAYS_UPDATE_SUCCESS
    setRetrievedYearPublicHolidays: Constants.publicHolidays.DUPLICATE_YEAR_PUBLIC_HOLIDAYS
    removePublicHoliday: Constants.publicHolidays.PUBLIC_HOLIDAY_DESTROYED

  getInitialState: ->
    editMode: false
    newPublicHolidays: []
    validationSucceed: true

  getPublicHolidays: ->
    @fetch
      id: 'current-year-public-holidays'
      locally: ->
        @state.publicHolidays
      remotely: ->
        @app.queries.publicHolidays.findForYear moment().format()


  setPublicHolidays: (publicHolidays) ->
    @setState
      publicHolidays: publicHolidays
      newPublicHolidays: []

  setEditMode: (mode) ->
    @setState
      editMode: mode
      newPublicHolidays: []
      successMessage: null

  addNew: ->
    @_add
      name: ''
      day: ''

    @state.successMessage = null

    @hasChanged()

  setHoliday: (values) ->
    holidays = if @state.editMode is true then @state.publicHolidays else @state.newPublicHolidays

    holiday = _.findWhere holidays, id: values.id
    _.assign(holiday, values)
    @hasChanged()

  removeNewPublicHoliday: (id) ->
    idx =  _.indexOf @state.newPublicHolidays, _.findWhere(@state.newPublicHolidays, id: id)
    @state.newPublicHolidays.splice(idx, 1)
    @hasChanged()

  invalidateHolidays: ->
    @setState
      validationSucceed: false

  creationSuccess: (newPublicHolidays)->
    holidays = @state.publicHolidays

    @setState
      publicHolidays: holidays.concat newPublicHolidays
      newPublicHolidays: []
      validationSucceed: true
      successMessage: 'Public holidays created with success'

  updateSuccess: (publicHolidays)->
    @setState
      publicHolidays: publicHolidays
      validationSucceed: true
      successMessage: 'Public holidays updated with success'
      editMode: false


  setRetrievedYearPublicHolidays: (holidays) ->
    @state.newPublicHolidays = []

    for holiday in holidays
      @_add
        name: holiday.name
        day: moment(holiday.day).add(1, 'year').format('YYYY-MM-DD')

    @hasChanged()

  removePublicHoliday: (holiday) ->
    idx =  _.indexOf @state.publicHolidays, _.findWhere(@state.publicHolidays, id: holiday.id)
    @state.publicHolidays.splice(idx, 1)
    @hasChanged()

  _add: (attributes) ->
    attributes.id =  @_getNewId()
    @state.newPublicHolidays.push attributes

  _getNewId: ->
    return 1 if @state.newPublicHolidays.length == 0
    _.last(@state.newPublicHolidays).id + 1
