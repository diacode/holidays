require('marty').HttpStateSource.removeHook('parseJSON')
window.Marty = Marty
ViewMounter = require './app/view_mounter'

$ ->
  viewPath = "./#{$('body').data('view-name')}"
  new ViewMounter().mount viewPath
