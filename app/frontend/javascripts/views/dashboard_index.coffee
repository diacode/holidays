MainView = require './main_view'
Calendar = require '../flux/components/calendar/calendar'
moment = require 'moment'

class View extends MainView
  mount: ->
    super()

    selected = moment().startOf("day")

    React.render React.createElement(Calendar, selected: selected), document.getElementById('calendar')

module.exports = View
