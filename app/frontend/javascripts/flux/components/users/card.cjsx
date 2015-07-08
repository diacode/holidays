classnames = require 'classnames'
Link = require('react-router').Link


module.exports = React.createClass
  displayName: 'UserCard'

  mixins: [
    React.addons.PureRenderMixin
  ]

  _renderStatus: ->
    text = if @props.on_holidays then 'On holidays' else 'Working'
    <span className="status">{text}</span>

  render: ->
    userClassnames = classnames
      card: true
      'on-holidays': @props.on_holidays == true
      working: @props.on_holidays == false


    <div className={userClassnames}>
      <header>
        <Link to="home">
          <img className="avatar" src={@props.avatar_url}/>
        </Link>
        <h3>{@props.full_name}</h3>
        {@_renderStatus()}
      </header>
      <div className="body">
        <div className="days-counter available">
          <h4>{@props.available_days}</h4>
          <h5>days available</h5>
        </div>
        <div className="days-counter spent">
          <h4>{@props.current_year_days_spent}</h4>
          <h5>days spent</h5>
        </div>
      </div>
    </div>
