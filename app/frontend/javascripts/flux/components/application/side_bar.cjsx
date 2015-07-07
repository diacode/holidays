Link = require('react-router').Link

module.exports = React.createClass
  displayName: 'SideBar'

  _renderSettings: ->
    return unless gon.current_user.admin

    <li>
      <Link to="settings"><i className="fa fa-cog"></i>Settings</Link>
    </li>

  render: ->
    <aside>
      <nav>
        <ul>
          <li>
            <Link to="home">
              <i className="fa fa-users"></i>Team
            </Link>
          </li>
          <li>
            <Link to="public_calendar"><i className="fa fa-calendar"></i>Public</Link>
          </li>
          <li>
            <Link to="vacation_requests"><i className="fa fa-envelope-o"></i>Inbox</Link>
          </li>
          {@_renderSettings()}
        </ul>
      </nav>
    </aside>
