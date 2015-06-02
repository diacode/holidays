Constants = require '../constants/constants'
moment = require 'moment'

module.exports = Marty.createStore
  id: 'PublicHolidaysEditorStore'

  handlers:
    addNew: Constants.publicHolidays.ADD_NEW_PUBLIC_HOLIDAY
    setHoliday: Constants.publicHolidays.SET_PUBLIC_HOLIDAY_VALUES
    removeHoliday: Constants.publicHolidays.REMOVE_PUBLIC_HOLIDAY
    invalidateHolidays: Constants.publicHolidays.INVALIDATE_PUBLIC_HOLIDAYS
    setSuccessMessage: Constants.publicHolidays.PUBLIC_HOLIDAYS_CREATION_SUCCESS
    setRetrievedYearPublicHolidays: Constants.publicHolidays.DUPLICATE_YEAR_PUBLIC_HOLIDAYS

  getInitialState: ->
    publicHolidays: []
    validationSucceed: true

  addNew: ->
    @_add
      name: ''
      date: ''

    @hasChanged()

  setHoliday: (values) ->
    holiday = _.findWhere @state.publicHolidays, id: values.id
    _.assign(holiday, values)
    @hasChanged()

  removeHoliday: (id) ->
    idx =  _.indexOf @state.publicHolidays, _.findWhere(@state.publicHolidays, id: id)
    @state.publicHolidays.splice(idx, 1)
    @hasChanged()

  invalidateHolidays: ->
    @setState
      validationSucceed: false

  setSuccessMessage: ->
    @setState
      publicHolidays: []
      validationSucceed: true
      successMessage: 'Public holidays created with success'

  setRetrievedYearPublicHolidays: (holidays) ->
    @state.publicHolidays = []

    for holiday in holidays
      @_add
        name: holiday.name
        date: moment(holiday.day).add(1, 'year').format('YYYY-MM-DD')

    @hasChanged()

  _add: (attributes) ->
    attributes.id =  @_getNewId()
    @state.publicHolidays.push attributes

  _getNewId: ->
    return 1 if @state.publicHolidays.length == 0
    _.last(@state.publicHolidays).id + 1

