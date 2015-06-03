PublicHolidaysStore = require '../../stores/public_holidays_store'
PublicHolidaysList = require './list'
PublicHolidaysEditor = require './editor'
moment = require 'moment'

PublicHolidaysSection = React.createClass
  displayName: 'PublicHolidaysSection'

  _renderList: ->
    return if @props.editMode is true

    <PublicHolidaysList publicHolidays={@props.publicHolidays} />

  _renderEditor: ->
    return unless @props.editMode is true

    <PublicHolidaysEditor publicHolidays={@props.publicHolidays} />


  render: ->
    <section>
      <div className="container">
        <header>
          <h2>Public holidays</h2>
        </header>
        <div className="box">
          <header>
            <h4>Current public holidays</h4>
            <div className="actions">
              <a href="#"><i className="fa fa-pencil"/> edit</a>
            </div>
          </header>
          {@_renderList()}
          {@_renderEditor()}
        </div>
      </div>
    </section>

module.exports = Marty.createContainer PublicHolidaysSection,
  listenTo: PublicHolidaysStore

  fetch:
    publicHolidays: ->
      PublicHolidaysStore.getPublicHolidays()

    editMode: ->
      PublicHolidaysStore.getState().editMode
