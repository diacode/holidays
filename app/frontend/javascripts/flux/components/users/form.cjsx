Modal = require '../utils/new_modal'
UserFormStore = require '../../stores/user_form_store'
UserFormActionCreators = require '../../action_creators/user_form_action_creators'
FormMixin = require '../../mixins/form_mixin'


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

  render: ->
    <Modal show={@props.showModal} hide={@_handleHideModal}>
      <div className="modal">
        <form onSubmit={@_onSubmit}>
          <header>
            <h3>New team member</h3>
          </header>
          <div className="data-wrapper">
            <h5>Email</h5>
            {@_renderInput('email', 'Email', 'email')}
            <h5>Full name</h5>
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

