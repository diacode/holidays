require('marty').HttpStateSource.removeHook('parseJSON')
window.Marty = Marty
ApplicationContainer = Marty.ApplicationContainer
MainApplication = require './flux/applications/main_application'

$ ->
  mainApplication = new MainApplication()

  mainApplication.router.run (Handler, state) =>
    appContainer = <ApplicationContainer app={mainApplication}>
      <Handler {...state.params}/>
    </ApplicationContainer>

    React.render appContainer, document.getElementById('application_wrapper')
