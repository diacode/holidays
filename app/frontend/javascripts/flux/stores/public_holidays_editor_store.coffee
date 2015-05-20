Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'PublicHolidaysEditorStore'

  handlers:
    addNew: Constants.publicHolidays.ADD_NEW_PUBLIC_HOLIDAY
    setHoliday: Constants.publicHolidays.SET_PUBLIC_HOLIDAY_VALUES
    removeHoliday: Constants.publicHolidays.REMOVE_PUBLIC_HOLIDAY
    invalidateHolidays: Constants.publicHolidays.INVALIDATE_PUBLIC_HOLIDAYS
    setSuccessMessage: Constants.publicHolidays.PUBLIC_HOLIDAYS_CREATION_SUCCESS

  getInitialState: ->
    publicHolidays: []
    validationSucceed: true

  addNew: ->
    @state.publicHolidays.push
      id: @_getNewId()
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

  _getNewId: ->
    return 1 if @state.publicHolidays.length == 0
    _.last(@state.publicHolidays).id + 1

