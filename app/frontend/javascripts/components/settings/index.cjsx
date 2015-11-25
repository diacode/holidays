Link = require('react-router').Link

module.exports = React.createClass
  displayName: 'SettingsIndex'

  render: ->
    <section className="wrapper">
      <div className="cards-list">
        <div className="card button" href="/settings/public_holidays">
          <Link to="public_holidays">
            <div>
              <i className="fa fa-calendar"></i>
              <h5>Public holidays</h5>
            </div>
          </Link>
        </div>
      </div>
    </section>
