{ connect } = require 'react-redux'
moment = require 'moment'

globals = require '../../utils/globals'
actions = require '../../actions'

UserProfile = React.createClass
  displayName: 'UserProfile'

  componentDidMount: ->
    @props.dispatch actions.users.find(@props.params.id)

  _renderGrantedVacationDays: ->
    years = _.keys(@props.userProfile.granted_days).sort (a, b) -> a < b

    if years.length
      years.map (year) =>
        grantedDays = @props.userProfile.granted_days[year]
        dots = _.times grantedDays, (idx) ->
          <div key={idx} className="granted-day-dot"></div>

        <div className="year-wrapper" key={year}>
          <h4>Year {year}</h4>
          <div className="grid">
            <div className="granted-days-amount">
              <strong>{grantedDays}</strong>
              days granted
            </div>
            <div className="dot-wrapper">{dots}</div>
          </div>
        </div>

  _renderVacationHistoryRows: ->
    @props.userProfile.requested_approved_days.map (rad) ->
      parsedDate = moment(rad.day)

      <tr key={rad.id}>
        <td>{parsedDate.format("dddd, MMMM Do YYYY")}</td>
        <td></td>
      </tr>

  render: ->
    <div className="user-profile-section">
      <div className="wrapper">
        <header>
          <img src={@props.userProfile.avatar_url} />
          <h1>{@props.userProfile.full_name}</h1>
        </header>
      </div>

      <div className="subwrapper">
        <div className="left-column">
          <div className="box">
            <h3>Vacation history</h3>
            <table className="table">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Reason</th>
                </tr>
              </thead>

              <tbody>
                {@_renderVacationHistoryRows()}
              </tbody>
            </table>
          </div>
        </div>
        <div className="right-column">
          <h3>Granted Vacation Days</h3>
          {@_renderGrantedVacationDays()}
        </div>
      </div>
    </div>

mapStateToProps = (state) ->
  state.users

module.exports = connect(mapStateToProps)(UserProfile)
