require('marty').HttpStateSource.removeHook('parseJSON')
window.Marty = Marty
ApplicationContainer = Marty.ApplicationContainer
VacationRequestApplication = require './flux/applications/vacation_requests_application'
RequestHolidaysForm = require './flux/components/holidays/request_form'
MainApplication = require './flux/applications/main_application'
ApplicationWrapper = require './flux/components/application/application_wrapper'
SideBar = require './flux/components/application/side_bar'

$ ->
  vacationRequestsApplication = new VacationRequestApplication()
  vacationRequestsApplicationContainer = <ApplicationContainer app={vacationRequestsApplication}>
      <RequestHolidaysForm />
    </ApplicationContainer>

  React.render vacationRequestsApplicationContainer, document.getElementById('request_holidays_button_wrapper')


  mainApplication = new MainApplication()

  mainApplication.router.run (Handler, state) =>
    appContainer = <ApplicationContainer app={mainApplication}>
      <Handler {...state.params}/>
    </ApplicationContainer>

    React.render appContainer, document.getElementById('main_wrapper')



