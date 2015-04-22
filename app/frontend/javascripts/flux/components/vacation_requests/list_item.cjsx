moment = require 'moment'
SelectedDay = require './selected_day'

module.exports = React.createClass
  displayName: 'VacationRequestListItem'

  _renderDays: ->
    @props.requested_days.map (day) ->
      <SelectedDay {...day}/>

  render: ->
    <li>
      <div className="avatar-wrapper">
        <img className="avatar" src="http://gravatar.com/avatar/09310ea22b648a029b9803cfecea1eca.png?s=80" alt="09310ea22b648a029b9803cfecea1eca"/>
      </div>
      <div className="user-data-wrapper">
        <strong>{@props.user_name}</strong>
        <br/>
        <small>{moment(@props.created_at).fromNow()}</small>
      </div>
      <div className="requested-days-wrapper">
        <ul className="selected-dates">
          {@_renderDays()}
        </ul>
      </div>
      <div className="actions">
        <ul>
          <li>
            <a className="approve" href="#">
              <i className="fa fa-check-circle"></i>
              Approve
            </a>
          </li>
          <li>
            <a href="#">
              <i className="fa fa-edit"></i>
              Edit
            </a>
          </li>
        </ul>
      </div>
    </li>
