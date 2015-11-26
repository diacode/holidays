{ combineReducers } = require 'redux'
{ routeReducer } = require('redux-simple-router')

module.exports = combineReducers
  routing: routeReducer
  users: require './users'
  userForm: require './user_form'
  vacationRequestForm: require './vacation_request_form'
  publicCalendar: require './public_calendar'
