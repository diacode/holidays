{ Link } = require 'react-router'
Globals = require '../utils/globals'
RequestHolidaysForm = require '../components/holidays/request_form'
UserNavWidget = require '../widgets/user_nav'

module.exports = React.createClass
  displayName: 'MainHeader'

  componentDidMount: ->
    UserNavWidget.mount()

  render: ->
    <nav id="main_nav">
      <Link to="/" className="logo-link" href="#"></Link>
      <ul className="nav">
        <li>
          <RequestHolidaysForm />
        </li>
        <li className="days-left-wrapper">
          <div className="days-left">
            <strong>{Globals.currentUser.available_days}</strong>
            <small>days <br/> left</small>
          </div>
        </li>
        <li>
          <a href="#">
            <img className="avatar" id="user_nav_toggle" src={Globals.currentUser.avatar_url.small}/>
          </a>
          <ul className="dropdown">
            <li>
              <a rel="nofollow" data-method="delete" href={Routes.destroy_user_session_path()}>
                <i className="fa fa-sign-out"></i> Sign out
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
