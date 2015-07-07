module.exports = Marty.createApplication () ->
  @register
    stores:
      users: require '../stores/users_store'
      userForm: require '../stores/user_form_store'
      publicCalendar: require '../stores/public_calendar_store'
      vacationRequests: require '../stores/vacation_requests_store'
      publicHolidays: require '../stores/public_holidays_store'
      editVacationRequest: require '../stores/edit_vacation_request_store'
    actionCreators:
      userForm: require '../action_creators/user_form_action_creators'
      vacationRequests: require '../action_creators/vacation_requests_action_creators'
      publicHolidays: require '../action_creators/public_holiday_action_creators'
      editVacationRequest: require '../action_creators/edit_vacation_request_action_creators'
    queries:
      users: require '../queries/users_queries'
      publicHolidays: require '../queries/public_holidays_queries'
      requestedDays: require '../queries/requested_days_queries'
      vacationRequests: require '../queries/vacation_requests_queries'
    stateSources:
      users: require '../state_sources/users_source'
      publicHolidays: require '../state_sources/public_holidays_source'
      requestedDays: require '../state_sources/requested_days_source'
      vacationRequests: require '../state_sources/vacation_requests_source'
  @router = require '../../router'
