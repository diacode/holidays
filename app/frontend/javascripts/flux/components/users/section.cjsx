UserCard = require './card'
UserForm = require './form'
globals = require '../../../utils/globals'


UsersSection = React.createClass
  displayName: 'UsersSection'

  _renderUsersList: ->
    usersCards = @props.users.map (user) ->
      <UserCard key={user.id} {...user}/>

    <div className="cards-list">
      {usersCards}
      {@_renderAddNew()}
    </div>

  _renderAddNew: ->
    return unless globals.currentUser.admin

    <div className="card add-new" onClick={@_handleOnNewClick}>
      <div>
        <i className="fa fa-plus-circle" />
        <h5>Add new team member</h5>
      </div>
    </div>

  _handleOnNewClick: (e) ->
    e.preventDefault()
    @app.actionCreators.userForm.showForm()

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
  listenTo: [
    'usersStore'
  ]

  fetch:
    users: ->
      @app.usersStore.findAll()

  failed: (errors) ->
    console.log 'Failed rendering Users Section'
    console.log errors