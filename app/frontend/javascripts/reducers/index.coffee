{ combineReducers } = require 'redux'
{ routeReducer } = require('redux-simple-router')

module.exports = combineReducers
  routing: routeReducer
  users: require './users'
  userForm: require './user_form'
  vacationRequestForm: require './vacation_request_form'
  grantVacationDaysForm: require './grant_vacation_days_form'
  publicCalendar: require './public_calendar'
  vacationRequests: require './vacation_requests'
  editVacationRequest: require './edit_vacation_request'
  publicHolidays: require './public_holidays'
