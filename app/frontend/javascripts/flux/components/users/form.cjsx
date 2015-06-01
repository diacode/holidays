Modal = require '../utils/modal'
UserFormStore = require '../../stores/user_form_store'
UserFormActionCreators = require '../../action_creators/user_form_action_creators'
FormMixin = require '../../mixins/form_mixin'
Gravatar = require 'react-gravatar'

UserForm = React.createClass
  displayName: 'UserForm'

  mixins: [
    FormMixin
  ]

  getDefaultProps: ->
    showModal: false

  _handleHideModal: ->
    UserFormActionCreators.hideForm()

  _onSubmit: (e) ->
    e.preventDefault()
    UserFormActionCreators.saveItem @props.item

  _handleOnChange: (e) ->
    UserFormActionCreators.setItem @_formValues()

  _handelCancelClick: (e) ->
    e.preventDefault()
    UserFormActionCreators.hideForm()

  _renderAvatar: ->
    <div className="avatar-wrapper">
      <Gravatar email={@props.item.email} size={100} default="mm" />
    </div>

  render: ->
    <Modal show={@props.showModal} hide={@_handleHideModal}>
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

module.exports = Marty.createContainer UserForm,
  listenTo: UserFormStore

  fetch:
    item: ->
      UserFormStore.getState().item
    showModal: ->
      UserFormStore.getState().showModal
    errors: ->
      UserFormStore.getState().errors

