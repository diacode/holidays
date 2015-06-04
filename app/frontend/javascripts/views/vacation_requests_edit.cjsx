MainView = require './main_view'
VacationRequestEditor = require '../flux/components/vacation_requests/editor'
ApplicationContainer = Marty.ApplicationContainer

class View extends MainView
  mount: ->
    super()
    React.render @_buildVacationRquestsApplication(), document.getElementById('main_content')

  _buildVacationRquestsApplication: ->
    VacationRequestEditorApp = Marty.createApplication () ->
      @register
        stores:
          editVacationRequest: require '../flux/stores/edit_vacation_request_store'
          publicCalendar: require '../flux/stores/public_calendar_store'
        queries:
          vacationRequests: require '../flux/queries/vacation_requests_queries'
          publicHolidays: require '../flux/queries/public_holidays_queries'
        stateSources:
          vacationRequests: require '../flux/state_sources/vacation_requests_source'
          publicHolidays: require '../flux/state_sources/public_holidays_source'
          requestedDays: require '../flux/state_sources/requested_days_source'
        actionCreators:
          vacationRequests: require '../flux/action_creators/vacation_requests_action_creators'
          editVacationRequest: require '../flux/action_creators/edit_vacation_request_action_creators'

    <ApplicationContainer app={new VacationRequestEditorApp()}>
      <VacationRequestEditor vacationRequestId={gon.vacation_request_id} />
    </ApplicationContainer>


module.exports = View
