Modal = require '../utils/modal'
ModalActionCreators = require '../../action_creators/modal_action_creators'
RequestForm = require './request_form'

module.exports = React.createClass
  displayName: 'RequestButton'

  mixins: [
    React.addons.PureRenderMixin
  ]

  _handleOnClick: (e) ->
    e.preventDefault()
    ModalActionCreators.show()

  render: ->
    <div>
      <a onClick={@_handleOnClick} className="btn" href="#">Request holidays</a>
      <Modal>
        <RequestForm />
      </Modal>
    </div>
