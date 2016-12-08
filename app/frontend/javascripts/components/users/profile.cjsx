{ connect } = require 'react-redux'
moment = require 'moment'

globals = require '../../utils/globals'
actions = require '../../actions'

UserProfile = React.createClass
  displayName: 'UserProfile'

  componentDidMount: ->
    @props.dispatch actions.users.find(@props.params.id)

  _renderGrantedVacationDays: ->
    years = _.keys(@props.userProfile.granted_days).sort()

    if years.length
      years.map (year) =>
        grantedDays = @props.userProfile.granted_days[year]
        squares = _.times grantedDays, (idx) ->
          <div key={idx} className="granted-day-square"></div>

        <div className="year-wrapper" key={year}>
          <h3>{year}</h3>
          <div className="square-wrapper">{squares}</div>
          {grantedDays} days granted
        </div>

  _renderVacationHistoryRows: ->
    @props.userProfile.requested_approved_days.map (rad) ->
      parsedDate = moment(rad.day)

      <tr key={rad.id}>
        <td>{parsedDate.format("dddd, MMMM Do YYYY")}</td>
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
        <h2>Vacation history</h2>
        <table>
          <thead>
            <tr>
              <th>Date</th>
            </tr>
          </thead>

          <tbody>
            {@_renderVacationHistoryRows()}
          </tbody>
        </table>

        <h2>Granted Vacation Days</h2>
        {@_renderGrantedVacationDays()}
      </div>
    </div>

mapStateToProps = (state) ->
  state.users

module.exports = connect(mapStateToProps)(UserProfile)
