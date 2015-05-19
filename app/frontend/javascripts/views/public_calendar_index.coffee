MainView = require './main_view'
PublicCalendarSection = require '../flux/components/public_calendar/section'

class View extends MainView
  mount: ->
    super()
    React.render React.createElement(PublicCalendarSection, {}), document.getElementById('public_calendar_wrapper')

module.exports = View
