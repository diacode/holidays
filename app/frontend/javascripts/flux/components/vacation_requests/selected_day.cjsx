moment = require 'moment'
classnames = require 'classnames'

module.exports = React.createClass
  displayName: 'SelectedDay'

  render: ->
    <li className={@props.status}>
      <header>
        {moment(@props.day).format('MMM')}
      </header>
      <div className="day">
        <strong>{moment(@props.day).format('DD')}</strong>
      </div>
    </li>
