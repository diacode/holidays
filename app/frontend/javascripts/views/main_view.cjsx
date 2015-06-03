UserNav = require '../widgets/user_nav'
RequestHolidaysForm = require '../flux/components/holidays/request_form'
ApplicationContainer = Marty.ApplicationContainer

class MainView
  mount: ->
    UserNav.mount()
    @_initRequestVacations()
  unmount: ->
    UserNav.unmount()

  _initRequestVacations: ->
    React.render @_buildApplication(), document.getElementById('request_holidays_button_wrapper')

  _buildApplication: ->
    MainApplication = Marty.createApplication () ->
      @register
        publicCalendarStore: require '../flux/stores/public_calendar_store'
        requestFormStore: require '../flux/stores/request_form_store'
        actionCreators: require '../flux/action_creators/request_form_action_creators'
        queries: require '../flux/queries/public_holidays_queries'
        stateSources:
          publicHolidays: require '../flux/state_sources/public_holidays_source'
          vacationRequests: require '../flux/state_sources/vacation_requests_source'



    <ApplicationContainer app={new MainApplication()}>
      <RequestHolidaysForm />
    </ApplicationContainer>



module.exports = MainView





