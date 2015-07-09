VacationRequestListItem = require './list_item'
ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

VacationRequestsList = React.createClass
  displayName: 'VacationRequestsList'

  _renderItems: ->
    @props.vacationRequests.map (vacationRequest) ->
      <VacationRequestListItem key={vacationRequest.id} {...vacationRequest} />

  _renderLoadMore: ->
    return unless @props.meta.current_page < @props.meta.total_pages

    <div className="load-more">
      <a href="#" onClick={@_handleLoadMoreClick}>Load more</a>
    </div>

  _handleLoadMoreClick: (e)->
    e.preventDefault()
    @app.queries.vacationRequests.findAll @props.meta.current_page + 1

  _renderList: ->
    <div id="vacation_requests_wrapper" className="box">
      <ul className="vacation-requests-list">
        <ReactCSSTransitionGroup transitionName="vacation-request">
          {@_renderItems()}
        </ReactCSSTransitionGroup>
      </ul>
      {@_renderLoadMore()}
    </div>

  _renderNoData: ->
    <p>No data found yet</p>

  render: ->
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


module.exports = Marty.createContainer VacationRequestsList,
  listenTo: [
    'stores.vacationRequests'
  ]

  fetch:
    vacationRequests: ->
      @app.stores.vacationRequests.fetchVacationRequests()
    meta: ->
      @app.stores.vacationRequests.getState().meta

  failed: (errors) ->
    console.log 'Failed rendering VacationRequestsList'
    console.log errors
