moment = require 'moment'

module.exports = React.createClass
  displayName: 'SelectedDay'

  render: ->
    <li>
      <header>
        {moment(@props.day).format('MMM')}
      </header>
      <div className="day">
        <strong>{moment(@props.day).format('DD')}</strong>
      </div>
    </li>
