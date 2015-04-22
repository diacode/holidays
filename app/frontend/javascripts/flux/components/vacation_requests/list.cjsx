VacationRequestListItem = require './list_item'
VacationRequestsStore = require '../../stores/vacation_requests_store'

VacationRequestsList = React.createClass
  displayName: 'VacationRequestsList'

  _renderItems: ->
    @props.vacationRequests.map (vacationRequest) ->
      <VacationRequestListItem key={vacationRequest.id} {...vacationRequest} />

  render: ->
    <ul>
      {@_renderItems()}
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
