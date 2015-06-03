MainView = require './main_view'
UsersSection = require '../flux/components/users/section'
ApplicationContainer = Marty.ApplicationContainer

class View extends MainView
  mount: ->
    super()
    React.render @_buildUsersApplication(), document.getElementById('main_content')

  _buildUsersApplication: ->
    TeamApp = Marty.createApplication () ->
      @register
        usersStore: require '../flux/stores/users_store'
        userFormStore: require '../flux/stores/user_form_store'
        actionCreators:
          userForm: require '../flux/action_creators/user_form_action_creators'
        queries:
          users: require '../flux/queries/users_queries'
        stateSources:
          users: require '../flux/state_sources/users_source'

    <ApplicationContainer app={new TeamApp()}>
      <UsersSection />
    </ApplicationContainer>



module.exports = View
