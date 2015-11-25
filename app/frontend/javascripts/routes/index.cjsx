{ Route, IndexRoute } = require 'react-router'
UsersIndex = require '../components/users/index'
ApplicationWrapper = require '../layouts/application_wrapper'
PublicCalendar = require '../components/public_calendar/section'
VacationRequests = require '../components/vacation_requests/section'
VacationRequestEditor = require '../components/vacation_requests/editor'
SettingsIndex = require '../components/settings/index'
PublicHolidays = require '../components/public_holidays/section'
NotFound = require '../components/application/not_found'

module.exports =
  <Route path="/" component={ApplicationWrapper}>
    <IndexRoute component={UsersIndex} />

    <Route name="team" path="/team" component={UsersIndex} />
    <Route name="public_calendar" path="/public_calendar" component={PublicCalendar} />
    <Route name="vacation_requests" path="/vacation_requests" component={VacationRequests} />
    <Route name="edit_vacation_request" path="/vacation_requests/:id/edit" component={VacationRequestEditor} />
    <Route name="settings" path="/settings" component={SettingsIndex} />
    <Route name="public_holidays" path="/settings/public_holidays" component={PublicHolidays} />

    <Route path="*" component={NotFound} />
  </Route>
