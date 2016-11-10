{ connect } = require 'react-redux'
actions = require '../../actions'

Link = require('react-router').Link
GrantVacationDaysForm = require '../granted_vacation_days/grant_form'

SettingsPage = React.createClass
  displayName: 'SettingsIndex'

  _handleGrantButtonClick: (e) ->
    @props.dispatch actions.grantVacationDaysForm.showForm(true)

  _render: ->
    <section className="wrapper">
      <div className="cards-list">
        <GrantVacationDaysForm />

        <div className="card button" href="/settings/public_holidays">
          <Link to="/settings/public_holidays">
            <div>
              <i className="fa fa-calendar"></i>
              <h5>Public holidays</h5>
            </div>
          </Link>
        </div>

        <div className="card button">
          <a href="#" onClick={@_handleGrantButtonClick}>
            <div>
              <i className="fa fa-plus"></i>
              <h5>Grant Vacation Days</h5>
            </div>
          </a>
        </div>
      </div>
    </section>

  render: ->
    @props.children || @_render()

mapStateToProps = (state) -> state

module.exports = connect(mapStateToProps)(SettingsPage)
