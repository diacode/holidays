viewsContext = require.context("../views", true);
MainView = viewsContext './main_view'

module.exports = ->
  mount: (viewPath) ->
    view = try
      View = viewsContext viewPath
      new View()
    catch error
      new MainView()

    view.mount()
