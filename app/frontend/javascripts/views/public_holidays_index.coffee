MainView = require './main_view'
PublicHolidaysEditor = require '../flux/components/public_holidays/editor'
PublicHolidaysSection = require '../flux/components/public_holidays/section'

class View extends MainView
  mount: ->
    super()
    React.render React.createElement(PublicHolidaysSection, {}), document.getElementById('public_holidays_section')
    React.render React.createElement(PublicHolidaysEditor, {}), document.getElementById('public_holidays_editor')

module.exports = View
