Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'PublicHolidaysEditorStore'

  handlers:
    addNew: Constants.publicHolidays.ADD_NEW_PUBLIC_HOLIDAY
    setHoliday: Constants.publicHolidays.SET_PUBLIC_HOLIDAY_VALUES
    removeHoliday: Constants.publicHolidays.REMOVE_PUBLIC_HOLIDAY

  getInitialState: ->
    publicHolidays: []

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

  _getNewId: ->
    return 1 if @state.publicHolidays.length == 0
    _.last(@state.publicHolidays).id + 1

