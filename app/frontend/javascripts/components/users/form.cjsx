{ connect } = require 'react-redux'

actions = require '../../actions'

Modal = require '../utils/modal'
FormMixin = require '../../mixins/form_mixin'
Gravatar = require 'react-gravatar'

UserForm = React.createClass
  displayName: 'UserForm'

  mixins: [
    FormMixin
  ]

  _handleHideModal: ->
    @props.dispatch actions.users.showForm(false)

  _handelCancelClick: (e) ->
    e.preventDefault()
    @props.dispatch actions.users.showForm(false)

  _onSubmit: (e) ->
    e.preventDefault()
    @props.dispatch actions.userForm.saveItem(@props.item)

  _handleOnChange: (e) ->
    @props.dispatch actions.userForm.setItem(@_formValues())


  _renderAvatar: ->
    <div className="avatar-wrapper">
      <Gravatar email={@props.item.email} size={100} default="mm" />
    </div>

  render: ->
    <Modal show={@props.showForm} hide={@_handleHideModal}>
      <div className="modal">
        <form onSubmit={@_onSubmit}>
          <header>
            <h3>New team member</h3>
          </header>
          <div className="data-wrapper">
            {@_renderAvatar()}
            {@_renderInput('email', 'Email', 'email')}
            {@_renderInput('first_name', 'First name')}
            {@_renderInput('last_name', 'Last name')}
          </div>
          {@_renderActions()}
        </form>
      </div>
    </Modal>

mapStateToProps = (state) ->
  state.userForm

module.exports = connect(mapStateToProps)(UserForm)

