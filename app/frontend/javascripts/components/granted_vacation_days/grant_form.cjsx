{ connect } = require 'react-redux'

actions = require '../../actions'

moment = require 'moment'
Modal = require '../utils/modal'

GrantForm = React.createClass
  displayName: 'GrantForm'

  _onSubmit: (e) -> console.log("not yet")

  _hideForm: ->
    @props.dispatch actions.grantVacationDaysForm.showForm(false)

  render: ->
    <Modal show={@props.showForm} hide={@_hideForm}>
      <div className="modal">
        <form onSubmit={@_onSubmit}>
          <header>
            <h3>Grant Vacation Days</h3>
          </header>
        </form>
      </div>
    </Modal>

mapStateToProps = (state) ->
  state.grantVacationDaysForm

module.exports = connect(mapStateToProps)(GrantForm)
