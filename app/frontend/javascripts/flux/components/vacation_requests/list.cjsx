VacationRequestListItem = require './list_item'
VacationRequestsStore = require '../../stores/vacation_requests_store'
ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

VacationRequestsList = React.createClass
  displayName: 'VacationRequestsList'

  _renderItems: ->
    @props.vacationRequests.map (vacationRequest) ->
      <VacationRequestListItem key={vacationRequest.id} {...vacationRequest} />

  render: ->
    <ul>
      <ReactCSSTransitionGroup transitionName="vacation-request">
        {@_renderItems()}
      </ReactCSSTransitionGroup>
    </ul>

module.exports = Marty.createContainer VacationRequestsList,
  listenTo: [
    VacationRequestsStore
  ]

  fetch:
    vacationRequests: ->
      VacationRequestsStore.fetchVacationRequests()

  failed: (errors) ->
    console.log 'Failed rendering VacationRequestsList'
    console.log errors
