$(document).ready(function() {

  function mobile_confirm($btn, msg) {
    $btn.click(function() {
      var result = confirm(msg)
      $btn.removeClass('ui-btn-active')
      return result
    })
  }

  mobile_confirm($('[data-feature=bought-btn]'), 'Deseja marcar essa lista como comprada?')
  mobile_confirm($('[data-feature=delete-list-btn]'), 'Apagar mesmo esta lista?')

})