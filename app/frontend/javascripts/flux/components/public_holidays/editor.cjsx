PublicHoliday = require './holiday'
PublicHolidaysEditorStore = require '../../stores/public_holidays_editor_store'
PublicHolidayActionCreators = require '../../action_creators/public_holiday_action_creators'
PublicHolidaysQueries = require '../../queries/public_holidays_queries'

moment = require 'moment'

PublicHolidaysEditor = React.createClass
  displayName: 'PublicHolidaysEditor'

  _renderPublicHolidays: ->
    @props.publicHolidays.map (holiday) ->
      <PublicHoliday key={holiday.id} {...holiday} />

  _onAddClick: (e) ->
    e.preventDefault()
    PublicHolidayActionCreators.addNew()

  _onDuplicateClick: (e) ->
    e.preventDefault()
    if @props.publicHolidays.length is 0 or confirm('Duplicating last year will clear current items. Do you want to continue?')
      PublicHolidaysQueries.duplicateForYear(moment().subtract(1, 'year').format())

  _renderSaveButton: ->
    return if @props.publicHolidays.length is 0

    <a href="#" className="btn" onClick={@_handleOnSaveClick}>Save holidays</a>

  _handleOnSaveClick: (e) ->
    e.preventDefault()

    if @_validHolidays() then @_saveHolidays() else @_setValidationError()

  _saveHolidays: ->
    PublicHolidayActionCreators.save @props.publicHolidays

  _setValidationError: ->
    PublicHolidayActionCreators.invalidateHolidays()

  _validHolidays: ->
    valid = true

    for holiday in @props.publicHolidays
      if holiday.date == '' or holiday.name == ''
        valid = false
        break

    valid

  _renderValidationError: ->
    return if @props.validationSucceed is true

    <div className="error">Please fill correctly all days</div>

  _renderSuccessMessage: ->
    return if @props.successMessage is undefined

    <div className="success">{@props.successMessage}</div>


  render: ->
    <div>
      <div className="actions">
        <a className="btn" href="#" onClick={@_onDuplicateClick}>
          <i className="fa fa-copy"></i>
          Duplicate last year
        </a>
        <a className="btn" href="#" onClick={@_onAddClick}>
          <i className="fa fa-plus"></i>
          Add new public holiday
        </a>
      </div>
      {@_renderValidationError()}
      {@_renderSuccessMessage()}
      <table className="table">
        <thead>
          <tr>
            <th>Day</th>
            <th>Name</th>
            <th></th>
          </tr>
        </thead>
        <tbody className="form">
          {@_renderPublicHolidays()}
        </tbody>
      </table>
      {@_renderSaveButton()}
    </div>


module.exports = Marty.createContainer PublicHolidaysEditor,
  listenTo: [
    PublicHolidaysEditorStore
  ]

  fetch:
    publicHolidays: ->
      PublicHolidaysEditorStore.getState().publicHolidays
    validationSucceed: ->
      PublicHolidaysEditorStore.getState().validationSucceed
    successMessage: ->
      PublicHolidaysEditorStore.getState().successMessage

  failed: (errors) ->
    console.log 'Failed rendering Public Holidays'
    console.log errors
