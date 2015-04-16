Calendar = require '../calendar/calendar'

RequestForm = React.createClass
  displayName: 'RequestForm'

  mixins: [
    React.addons.PureRenderMixin
  ]

  render: ->
    <div className="holidays-modal">
      <form action="">
        <header>
          <h3>Request holidays</h3>
        </header>
        <div className="data-wrapper">
          <div className="calendar-wrapper">
            <h5>Select desired dates:</h5>
            <Calendar />
          </div>
          <div className="holidays-data-wrapper">
            <h5>Want to sat something?</h5>
            <textarea cols="30" name="" placeholder="Comments..." rows="10"></textarea>
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
