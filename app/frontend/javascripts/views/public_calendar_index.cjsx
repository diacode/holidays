MainView = require './main_view'
PublicCalendarSection = require '../flux/components/public_calendar/section'
ApplicationContainer = Marty.ApplicationContainer

class View extends MainView
  mount: ->
    super()
    React.render @_buildPublicCalendarApplication(), document.getElementById('main_content')

  _buildPublicCalendarApplication: ->
    PublicCalendarApp = Marty.createApplication () ->
      @register
        stores:
          publicCalendar: require '../flux/stores/public_calendar_store'
        queries:
          publicHolidays: require '../flux/queries/public_holidays_queries'
          requestedDays: require '../flux/queries/requested_days_queries'
        stateSources:
          publicHolidays: require '../flux/state_sources/public_holidays_source'
          requestedDays: require '../flux/state_sources/requested_days_source'

    <ApplicationContainer app={new PublicCalendarApp()}>
      <PublicCalendarSection />
    </ApplicationContainer>

module.exports = View
