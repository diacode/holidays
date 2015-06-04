MainView = require './main_view'
PublicHolidaysSection = require '../flux/components/public_holidays/section'
ApplicationContainer = Marty.ApplicationContainer

class View extends MainView
  mount: ->
    super()
    React.render @_buildPublicHolidaysApp(), document.getElementById('main_content')

  _buildPublicHolidaysApp: ->
    PublicHolidaysApp = Marty.createApplication () ->
      @register
        stores:
          publicHolidays: require '../flux/stores/public_holidays_store'
        queries:
          publicHolidays: require '../flux/queries/public_holidays_queries'
        stateSources:
          publicHolidays: require '../flux/state_sources/public_holidays_source'
        actionCreators:
          publicHolidays: require '../flux/action_creators/public_holiday_action_creators'

    <ApplicationContainer app={new PublicHolidaysApp()}>
      <PublicHolidaysSection />
    </ApplicationContainer>

module.exports = View
