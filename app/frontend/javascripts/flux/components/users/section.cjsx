UserCard = require './card'
UsersStore = require '../../stores/users_store'

UsersSection = React.createClass
  displayName: 'UsersSection'

  _renderToolbar: ->
    return unless @props.currentUser.admin

    <div className="toolbar">
      <a className="btn" href="/team/new">
        <i className="fa fa-plus"/>
        Add new team member
      </a>
    </div>

  _renderUsersList: ->
    usersCards = @props.users.map (user) ->
      <UserCard key={user.id} {...user}/>

    <div className="user-list">
      {usersCards}
    </div>

  render: ->
    <div>
      {@_renderToolbar()}
      <div className="wrapper">
        {@_renderUsersList()}
      </div>
    </div>

module.exports = Marty.createContainer UsersSection,
  listenTo: UsersStore

  fetch:
    users: ->
      UsersStore.findAll()

  failed: (errors) ->
    console.log 'Failed rendering Users Section'
    console.log errors
