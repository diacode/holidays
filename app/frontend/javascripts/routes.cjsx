Router = require 'react-router'
Route = Router.Route
Users = require './flux/components/users/section'
ApplicationWrapper = require './flux/components/application/application_wrapper'
PublicCalendar = require './flux/components/public_calendar/section'
VacationRequests = require './flux/components/vacation_requests/section'
VacationRequestEditor = require './flux/components/vacation_requests/editor'
SettingsIndex = require './flux/components/settings/index'
PublicHolidays = require './flux/components/public_holidays/section'

module.exports = (
  <Route handler={ApplicationWrapper}>
    <Route name="home" path="/" handler={Users} />
    <Route name="team" path="/team" handler={Users} />
    <Route name="public_calendar" path="/public_calendar" handler={PublicCalendar} />
    <Route name="vacation_requests" path="/vacation_requests" handler={VacationRequests} />
    <Route name="edit_vacation_request" path="/vacation_requests/:id/edit" handler={VacationRequestEditor} />
    <Route name="settings" path="/settings" handler={SettingsIndex} />
    <Route name="public_holidays" path="/settings/public_holidays" handler={PublicHolidays} />
  </Route>
)
