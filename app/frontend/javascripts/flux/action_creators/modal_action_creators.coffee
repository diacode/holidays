Constants = require '../constants/constants'

module.exports = Marty.createActionCreators
  id: 'ModalActionCreators'

  show: ->
    @dispatch Constants.modal.SHOW

  hide: ->
    @dispatch Constants.modal.HIDE
