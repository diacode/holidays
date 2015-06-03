MainView = require './main_view'
PublicHolidaysEditor = require '../flux/components/public_holidays/editor'
PublicHolidaysSection = require '../flux/components/public_holidays/section'

class View extends MainView
  mount: ->
    super()
    React.render React.createElement(PublicHolidaysSection, {}), document.getElementById('main_content')

module.exports = View
