VacationRequestListItem = require './list_item'
ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

VacationRequestsList = React.createClass
  displayName: 'VacationRequestsList'

  _renderItems: ->
    @props.vacationRequests.map (vacationRequest) ->
      <VacationRequestListItem key={vacationRequest.id} {...vacationRequest} />

  render: ->
    <section className="vacation-requests-section">
      <div className="container">
        <header>
          <h2>Vacation requests</h2>
        </header>
        <div id="vacation_requests_wrapper" className="box">
          <ul className="vacation-requests-list">
            <ReactCSSTransitionGroup transitionName="vacation-request">
              {@_renderItems()}
            </ReactCSSTransitionGroup>
          </ul>
        </div>
      </div>
    </section>

module.exports = Marty.createContainer VacationRequestsList,
  listenTo: [
    'stores.vacationRequests'
  ]

  fetch:
    vacationRequests: ->
      @app.stores.vacationRequests.fetchVacationRequests()

  failed: (errors) ->
    console.log 'Failed rendering VacationRequestsList'
    console.log errors
