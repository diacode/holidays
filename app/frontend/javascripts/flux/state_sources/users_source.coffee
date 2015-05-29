Globals = require '../../utils/globals'

module.exports = Marty.createStateSource
  type: 'http'
  id: 'UsersAPI'

  findAll: ->
    @get  Routes.api_v1_users_path()

