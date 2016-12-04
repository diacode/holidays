classnames = require 'classnames'

module.exports = React.createClass
  displayName: 'Modal'

  _onOverlayClick: (e)->
    $target = $(e.target)
    if $target.hasClass 'md-overlay'
      @props.hide()

  render: ->
    overlayStyleClasses = classnames
      'md-overlay': true
      'md-show': @props.show

    modalStyleClasses = classnames @props.modalClass,
      'md-modal': true
      'md-show': @props.show

    <div className={overlayStyleClasses} onClick={@_onOverlayClick}>
      <div className={modalStyleClasses}>
        <div className="md-content">
          {@props.children}
        </div>
      </div>
    </div>
