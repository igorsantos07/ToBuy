$(document).bind("mobileinit", function() {
  $.mobile.ajaxEnabled = false
  $.mobile.hashListeningEnabled = false
  $.mobile.selectmenu.prototype.options.nativeMenu = false
})