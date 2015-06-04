Modal = require '../utils/modal'
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
    @app.actionCreators.userForm.hideForm()

  _onSubmit: (e) ->
    e.preventDefault()
    @app.actionCreators.userForm.saveItem @props.item

  _handleOnChange: (e) ->
    @app.actionCreators.userForm.setItem @_formValues()

  _handelCancelClick: (e) ->
    e.preventDefault()
    @app.actionCreators.userForm.hideForm()

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
  listenTo: 'stores.userForm'

  fetch:
    item: ->
      @app.stores.userForm.getState().item
    showModal: ->
      @app.stores.userForm.getState().showModal
    errors: ->
      @app.stores.userForm.getState().errors

