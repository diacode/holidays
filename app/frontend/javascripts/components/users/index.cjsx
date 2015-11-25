{ connect } = require 'react-redux'

UserCard = require './card'
UserForm = require './form'
globals = require '../../utils/globals'
actions = require '../../actions'

UsersIndex = React.createClass
  displayName: 'UsersIndex'

  componentDidMount: ->
    @props.dispatch actions.users.fetchUsers()

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
    @props.dispatch actions.users.showForm()

  _renderForm: ->
    return unless globals.currentUser.admin

    <UserForm />

  render: ->
    <div className="users-section">
      <div className="wrapper">
        {@_renderUsersList()}
      </div>
      {@_renderForm()}
    </div>

mapStateToProps = (state) ->
  state.users

module.exports = connect(mapStateToProps)(UsersIndex)
