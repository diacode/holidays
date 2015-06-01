UserCard = require './card'
UsersStore = require '../../stores/users_store'
UserForm = require './form'
globals = require '../../../utils/globals'
UserFormActionCreators = require '../../action_creators/user_form_action_creators'


UsersSection = React.createClass
  displayName: 'UsersSection'

  _renderUsersList: ->
    usersCards = @props.users.map (user) ->
      <UserCard key={user.id} {...user}/>

    <div className="user-list">
      {usersCards}
      {@_renderAddNew()}
    </div>

  _renderAddNew: ->
    return unless globals.currentUser.admin

    <div className="user add-new" onClick={@_handleOnNewClick}>
      <div>
        <i className="fa fa-plus-circle" />
        <h5>Add new team member</h5>
      </div>
    </div>

  _handleOnNewClick: (e) ->
    e.preventDefault()
    UserFormActionCreators.showForm()

  _renderForm: ->
    return unless globals.currentUser.admin

    <UserForm />

  render: ->
    <div>
      <div className="wrapper">
        {@_renderUsersList()}
      </div>
      {@_renderForm()}
    </div>

module.exports = Marty.createContainer UsersSection,
  listenTo: UsersStore

  fetch:
    users: ->
      UsersStore.findAll()

  failed: (errors) ->
    console.log 'Failed rendering Users Section'
    console.log errors
