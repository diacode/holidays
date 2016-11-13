{ connect } = require 'react-redux'

actions = require '../../actions'

moment = require 'moment'
Modal = require '../utils/modal'

GrantForm = React.createClass
  displayName: 'GrantForm'

  componentDidMount: ->
    @props.dispatch actions.grantVacationDaysForm.fetchUsers()

  _onSubmit: (e) ->
    e.preventDefault()
    
    @props.dispatch actions.grantVacationDaysForm.save(
      amount: @refs.amount.value,
      year: @refs.year.value
      reason: @refs.reason.value
      user_ids: @_getSelectedUserIds()
    )

  _hideForm: ->
    @props.dispatch actions.grantVacationDaysForm.showForm(false)
    @_clear()

  _clear: ->
    for key, input of @refs
      if input.type == "checkbox"
        input.checked = false
      else
        input.value = ""

  _getSelectedUserIds: ->
    selectedCheckboxes = _.pick @refs, (val, key) ->
      key.startsWith("selectedUsers_") && val.checked
    _.map selectedCheckboxes, (checkbox) -> checkbox.value

  _renderUserList: ->
    userList = @props.userList.map (user, i) ->
      <li>
        <label>
          <input type="checkbox" ref="selectedUsers_#{i}" value={user.id} />
          <img src={user.avatar_url} />
          {user.full_name}
        </label>
      </li>

    <ul className="user-list">{userList}</ul>

  _handleCancelClick: (e) ->
    e.preventDefault()
    @_hideForm()

  _renderActions: ->
    <div className="actions">
      <a href="#" onClick={@_handleCancelClick}>Cancel</a>
      <button className="btn" type="submit">
        Grant days
      </button>
    </div>

  render: ->
    <Modal show={@props.showForm} hide={@_hideForm}>
      <div className="modal">
        <form onSubmit={@_onSubmit}>
          <header>
            <h3>Grant Vacation Days</h3>
          </header>

          {@_renderUserList()}

          <div className="granted-values">
            <input type="number" ref="amount" required="required" />
            <input type="number" ref="year" required="required" />
            <input type="text" ref="reason" />
          </div>

          {@_renderActions()}
        </form>
      </div>
    </Modal>

mapStateToProps = (state) ->
  state.grantVacationDaysForm

module.exports = connect(mapStateToProps)(GrantForm)
