{ IndexLink, Link } = require('react-router')
globals = require '../utils/globals'

module.exports = React.createClass
  displayName: 'SideBar'

  _renderSettings: ->
    return unless globals.currentUser.admin

    <li>
      <Link activeClassName="active" to="/settings"><i className="fa fa-cog"></i>Settings</Link>
    </li>

  render: ->
    <aside>
      <nav>
        <ul>
          <li>
            <IndexLink activeClassName="active" to="/">
              <i className="fa fa-users"></i>Team
            </IndexLink>
          </li>
          <li>
            <Link activeClassName="active" to="/public_calendar"><i className="fa fa-calendar"></i>Public</Link>
          </li>
          <li>
            <Link activeClassName="active" to="/vacation_requests"><i className="fa fa-envelope-o"></i>Inbox</Link>
          </li>
          {@_renderSettings()}
        </ul>
      </nav>
    </aside>
