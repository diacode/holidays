{ Provider } = require 'react-redux'
configureStore = require '../store'
{ Router, RoutingContext } = require 'react-router'
routes = require '../routes'

module.exports = React.createClass
  displayName: 'Root'

  renderRouter: ->
    { routingContext, routerHistory } = @props

    if @props.routingContext
      <RoutingContext {...routingContext} />
    else
      <Router history={routerHistory}>
        {routes}
      </Router>

  render: ->
    <Provider store={@props.store}>
      {@renderRouter()}
    </Provider>
