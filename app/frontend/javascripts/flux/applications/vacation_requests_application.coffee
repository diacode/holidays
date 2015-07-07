module.exports = VacationRequestApp = Marty.createApplication () ->
  @register
    stores:
      publicCalendar: require '../stores/public_calendar_store'
      requestForm: require '../stores/request_form_store'
    actionCreators: require '../action_creators/request_form_action_creators'
    queries: require '../queries/public_holidays_queries'
    stateSources:
      publicHolidays: require '../state_sources/public_holidays_source'
      vacationRequests: require '../state_sources/vacation_requests_source'
