Calendar = require '../calendar/calendar'
moment = require 'moment'

RequestForm = React.createClass
  displayName: 'RequestForm'

  mixins: [
    React.addons.PureRenderMixin
  ]

  render: ->
    selected = moment().startOf("day")

    <div className="holidays-modal">
      <form action="">
        <header>
          <h3>Request holidays</h3>
        </header>
        <div className="data-wrapper">
          <div className="holidays-data-wrapper">
            <h4>Holidays data</h4>
            <div className="input">
              <textarea cols="30" name="" placeholder="Comments..." rows="10"></textarea>
            </div>
          </div>
          <div className="calendar-wrapper">
            <h4>Calendar</h4>
            <Calendar selected={selected} />
          </div>
        </div>
        <div className="actions">
          <button className="btn" type="submit">
            Create request
          </button>
        </div>
      </form>
    </div>

module.exports = RequestForm
