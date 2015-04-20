classnames = require 'classnames'
ModalActionCreators = require '../../action_creators/modal_action_creators'
ModalStore = require '../../stores/modal_store'

Modal = React.createClass
  displayName: 'Modal'

  mixins: [
    React.addons.PureRenderMixin
  ]

  _onOverlayClick: (e)->
    $target = $(e.target)
    if $target.hasClass 'md-overlay'
      ModalActionCreators.hide()

  render: ->
    overlayStyleClasses = classnames
      'md-overlay': true
      'md-show': @props.show

    modalStyleClasses = classnames
      'md-modal': true
      'md-show': @props.show

    <div className={overlayStyleClasses} onClick={@_onOverlayClick}>
      <div className={modalStyleClasses}>
        <div className="md-content">
          {@props.children}
        </div>
      </div>
    </div>

module.exports = Marty.createContainer Modal,
  listenTo: ModalStore

  fetch:
    show: () ->
      ModalStore.state.show

  failed: (errors) ->
    console.log "Failed rendering modal"
    console.log errors
