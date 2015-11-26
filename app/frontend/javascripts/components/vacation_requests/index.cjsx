{ connect } = require 'react-redux'
actions = require '../../actions'

VacationRequestListItem = require './list_item'
ReactCSSTransitionGroup = require 'react-addons-css-transition-group'

VacationRequestsIndex = React.createClass
  displayName: 'VacationRequestsIndex'

  componentDidMount: ->
    @props.dispatch actions.vacationRequests.fetchVacationRequests()

  _renderItems: ->
    @props.vacationRequests.map (vacationRequest) =>
      <VacationRequestListItem key={vacationRequest.id} dispatch={@props.dispatch} {...vacationRequest} />

  _renderLoadMore: ->
    return unless @props.meta.current_page < @props.meta.total_pages

    <div className="load-more">
      <a href="#" onClick={@_handleLoadMoreClick}>Load more</a>
    </div>

  _handleLoadMoreClick: (e)->
    e.preventDefault()
    @props.dispatch actions.vacationRequests.fetchVacationRequests(@props.meta.current_page + 1)

  _renderList: ->
    <div id="vacation_requests_wrapper" className="box">
      <ul className="vacation-requests-list">
        {@_renderItems()}
      </ul>
      {@_renderLoadMore()}
    </div>

  _renderNoData: ->
    <p>No data found yet</p>

  _render: ->
    <section className="vacation-requests-section">
      <div className="container">
        <header>
          <h2>Vacation requests</h2>
        </header>
        {
          if @props.vacationRequests.length > 0
            @_renderList()
          else
            @_renderNoData()
        }
      </div>
    </section>

  render: ->
    @props.childen || @_render()


mapStateToProps = (state) ->
  state.vacationRequests

module.exports = connect(mapStateToProps)(VacationRequestsIndex)
