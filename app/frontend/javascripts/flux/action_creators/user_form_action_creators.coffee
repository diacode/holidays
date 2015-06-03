Constants = require '../constants/constants'
UsersApi = require '../state_sources/users_source'

module.exports = Marty.createActionCreators
  id: 'UserFormActionCreators'

  showForm: ->
    @dispatch Constants.users.SET_SHOW_USER_FORM, true

  hideForm: ->
    @dispatch Constants.users.SET_SHOW_USER_FORM, false

  setItem: (values) ->
    @dispatch Constants.users.SET_USER_FORM_ITEM, values

  saveItem: (item) ->
    if item.id is undefined then @_create(item) else @_updateItem(item)

  _create: (item) ->
    @app.stateSources.users.create(item).then (res)=>
      switch res.status
        when 200
          res.json().then (body) =>
            @dispatch Constants.users.ADD_USER, body
        when 422
          res.json().then (body) =>
            @dispatch Constants.users.ADD_USER_FORM_ERRORS, body
    .catch (err) ->
      console.log err

  _update: (item) ->
    @app.stateSources.users.update(item).then (res)=>
      switch res.status
        when 200
          res.json().then (body) =>
            @dispatch Constants.users.REPLACE_USER, body
        when 422
          res.json().then (body) =>
            @dispatch Constants.users.ADD_USER_FORM_ERRORS, body
    .catch (err) ->
      console.log err

