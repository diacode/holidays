MainView = require './main_view'
PublicHolidaysEditor = require '../flux/components/public_holidays/editor'

class View extends MainView
  mount: ->
    super()
    React.render React.createElement(PublicHolidaysEditor, {}), document.getElementById('public_holidays_editor')

module.exports = View
