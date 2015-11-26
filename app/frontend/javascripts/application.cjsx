Root = require './containers/root'
ReactDOM = require 'react-dom'
configureStore = require './store'
createBrowserHistory = require 'history/lib/createBrowserHistory'
{ syncReduxAndRouter } = require('redux-simple-router')

loadApplication = ->
  store = configureStore()
  history = createBrowserHistory()

  syncReduxAndRouter(history, store)

  props =
    routerHistory: history
    store: store

  ReactDOM.render <Root {...props} />, document.getElementById 'application_wrapper'

loadApplication()
