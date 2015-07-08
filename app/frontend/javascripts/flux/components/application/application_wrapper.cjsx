SideBar = require './side_bar'
MainHeader = require './main_header'
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'ApplicationWrapper'

  render: ->
    <div>
      <MainHeader />
      <div id="main_wrapper">
        <SideBar />
        <main id="main_content">
          <RouteHandler/>
        </main>
      </div>
    </div>

