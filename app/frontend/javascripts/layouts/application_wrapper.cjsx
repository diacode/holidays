SideBar = require './side_bar'
MainHeader = require './main_header'

module.exports = React.createClass
  displayName: 'ApplicationWrapper'

  render: ->
    <div>
      <MainHeader />
      <div id="main_wrapper">
        <SideBar />
        <main id="main_content">
          {@props.children}
        </main>
      </div>
    </div>

