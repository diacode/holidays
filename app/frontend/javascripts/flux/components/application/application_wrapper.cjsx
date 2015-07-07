SideBar = require './side_bar'
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'ApplicationWrapper'

  render: ->
    <div>
      <SideBar />
      <main id="main_content">
        <RouteHandler/>
      </main>
    </div>

