PublicHoliday = require './holiday'
PublicHolidaysEditorStore = require '../../stores/public_holidays_editor_store'
PublicHolidayActionCreators = require '../../action_creators/public_holiday_action_creators'

PublicHolidaysEditor = React.createClass
  displayName: 'PublicHolidaysEditor'

  _renderPublicHolidays: ->
    @props.publicHolidays.map (holiday) ->
      <PublicHoliday key={holiday.id} {...holiday} />

  _onAddClick: (e) ->
    e.preventDefault()
    PublicHolidayActionCreators.addNew()

  render: ->
    <div>
      <div className="actions">
        <a className="btn" href="#">
          <i className="fa fa-copy"></i>
          Duplicate last year
        </a>
        <a className="btn" href="#" onClick={@_onAddClick}>
          <i className="fa fa-plus"></i>
          Add new public holiday
        </a>
        <a className="btn" href="#">
          <i className="fa fa-upload"></i>
          Import from CSV
        </a>
      </div>

      <table>
        <thead>
          <tr>
            <th>Day</th>
            <th>Name</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {@_renderPublicHolidays()}
        </tbody>
      </table>
    </div>


module.exports = Marty.createContainer PublicHolidaysEditor,
  listenTo: [
    PublicHolidaysEditorStore
  ]

  fetch:
    publicHolidays: ->
      PublicHolidaysEditorStore.getState().publicHolidays

  failed: (errors) ->
    console.log 'Failed rendering Public Holidays'
    console.log errors
