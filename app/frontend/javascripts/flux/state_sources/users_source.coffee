globals = require '../../utils/globals'

module.exports = Marty.createStateSource
  type: 'http'
  id: 'UsersAPI'

  findAll: ->
    @get(Routes.api_v1_users_path()).then (res) ->
      if res.ok then return res.json()

      throw new Error('Error', res)

  create: (user) ->
    body =
      authenticity_token: globals.authenticityToken
      user: user

    @post
      url: Routes.api_v1_users_path()
      body: body
