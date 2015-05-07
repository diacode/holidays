module.exports = React.createClass
  displayName: 'DayNames'

  mixins: [
    React.addons.PureRenderMixin
  ]

  _renderNames: ->
    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map (day) ->
      <div key={day} className="day">{day}</div>

  render: () ->
    <div className="week names">
      {@_renderNames()}
    </div>
