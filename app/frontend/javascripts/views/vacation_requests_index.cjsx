MainView = require './main_view'
VacationRequestsSection = require '../flux/components/vacation_requests/section'
ApplicationContainer = Marty.ApplicationContainer

class View extends MainView
  mount: ->
    super()
    React.render @_buildVacationRquestsApplication(), document.getElementById('main_content')

  _buildVacationRquestsApplication: ->
    VacationRequestsApp = Marty.createApplication () ->
      @register
        vacationRequestsStore: require '../flux/stores/vacation_requests_store'
        queries:
          vacationRequests: require '../flux/queries/vacation_requests_queries'
        stateSources:
          vacationRequests: require '../flux/state_sources/vacation_requests_source'
        actionCreators:
          vacationRequests: require '../flux/action_creators/vacation_requests_action_creators'

    <ApplicationContainer app={new VacationRequestsApp()}>
      <VacationRequestsSection />
    </ApplicationContainer>


module.exports = View
