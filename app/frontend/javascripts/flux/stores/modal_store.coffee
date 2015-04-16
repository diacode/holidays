Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'ModalStore'

  handlers:
    show: Constants.modal.SHOW
    hide: Constants.modal.HIDE

  getInitialState: ->
    show: false

  show: ->
    @setState
      show: true

  hide: ->
    @setState
      show: false

