Constants = require '../constants/constants'

module.exports = Marty.createStore
  id: 'UserFormStore'

  handlers:
    setShowForm: Constants.users.SET_SHOW_USER_FORM
    setItem: Constants.users.SET_USER_FORM_ITEM
    setErrors: Constants.users.ADD_USER_FORM_ERRORS
    hideForm: [
      Constants.users.ADD_USER
      Constants.users.REPLACE_USER
    ]

  getInitialState: ->
    showModal: false
    item:
      email: ''
      first_name: ''
      last_name: ''
    errors: []

  setShowForm: (show) ->
    @state.showModal = show

    if show is false
      @state.item =
        email: ''
        first_name: ''
        last_name: ''

      @state.errors = []

    @hasChanged()

  setItem: (values) ->
    @setState
      item: values

  setErrors: (errors) ->
    @setState
      errors: errors

  hideForm: ->
    @setShowForm false
