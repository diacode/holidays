class UserNav
  @mount: ->
    @$selector = $('#user_nav_toggle')
    @_initSelector()

  @_initSelector: ->
    @$selector.on 'click', @_toggleMenu
    $(document).on 'click', @_hideMenu

  @_toggleMenu: (e)=>
    e.preventDefault()
    e.stopPropagation()
    @$selector.closest('li').toggleClass 'active'

  @_hideMenu: (e)=>
    @$selector.closest('li').removeClass 'active'

  @unmount: ->
    @$selector.off 'click'
    $(document).off 'click', @_hideMenu


module.exports = UserNav
