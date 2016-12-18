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
          <div key={idx} className="day-dot"></div>

        <div className="year-wrapper" key={year}>
          <h4>Year {year}</h4>
          <div className="days-counter">
            <div className="days-amount">
              <strong>{grantedDays}</strong>
              days granted
            </div>
            <div className="dot-wrapper">{dots}</div>
          </div>
        </div>
    else
      <p>This user doesn't have any vacation day granted yet.</p>

  _renderDaysAvailable: ->
    dots = _.times @props.userProfile.available_days, (idx) ->
      <div key={idx} className="day-dot"></div>

    <div className="available-days-wrapper">
      <div className="days-counter">
        <div className="days-amount">
          <strong>{@props.userProfile.available_days}</strong>
          vacation days to be taken
        </div>
        <div className="dot-wrapper">{dots}</div>
      </div>
    </div>

  _renderVacationHistoryRows: ->
    if @props.userProfile.requested_approved_days.length
      @props.userProfile.requested_approved_days.map (rad) ->
        parsedDate = moment(rad.day)

        <tr key={rad.id}>
          <td>{parsedDate.format("dddd, MMMM Do YYYY")}</td>
        </tr>
    else
      <tr className="empty">
        <td>This user haven't taken any day off yet.</td>
      </tr>

  render: ->
    <div className="user-profile-section">
      <div className="wrapper">
        <header>
          <img src={@props.userProfile.avatar_url.thumb} />
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
                </tr>
              </thead>

              <tbody>
                {@_renderVacationHistoryRows()}
              </tbody>
            </table>
          </div>
        </div>
        <div className="right-column">
          <h3>Days Available</h3>
          {@_renderDaysAvailable()}

          <h3>Granted Vacation Days</h3>
          {@_renderGrantedVacationDays()}
        </div>
      </div>
    </div>

mapStateToProps = (state) ->
  state.users

module.exports = connect(mapStateToProps)(UserProfile)
