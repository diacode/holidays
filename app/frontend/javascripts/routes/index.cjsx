{ Route, IndexRoute } = require 'react-router'
UsersIndex = require '../components/users/index'
ApplicationWrapper = require '../layouts/application_wrapper'
PublicCalendarIndex = require '../components/public_calendar/index'
VacationRequestsIndex = require '../components/vacation_requests/index'
VacationRequestEdit = require '../components/vacation_requests/edit'
SettingsIndex = require '../components/settings/index'
PublicHolidays = require '../components/public_holidays/section'
NotFound = require '../components/application/not_found'

module.exports =
  <Route path="/" component={ApplicationWrapper}>
    <IndexRoute component={UsersIndex} />

    <Route path="/team" component={UsersIndex} />
    <Route path="/public_calendar" component={PublicCalendarIndex} />
    <Route path="/vacation_requests">
      <IndexRoute component={VacationRequestsIndex}/>
      <Route path=":id/edit" component={VacationRequestEdit} />
    </Route>
    <Route path="/settings" component={SettingsIndex} />
    <Route path="/settings/public_holidays" component={PublicHolidays} />

    <Route path="*" component={NotFound} />
  </Route>
