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

  $('#edit a#remove').click(function() {
    if (confirm('Deseja MESMO remover sua conta? :(\n\nTODOS os seus dados serão removidos, sem possibilidade de recuperação.\n\nNo entanto, você sempre estará livre de vir e fazer um novo cadastro :D')) {
      var $this = $(this)
      $this.siblings('form').show()
      $this.hide()
    }
  })
  $('#edit #dangerous-buttons form a#giveup').click(function() {
    $(this).parent('form').hide()
    $('#edit a#remove').show()
  })
  $('#edit #dangerous-buttons form').submit(function() {
    return confirm('Certeza?')
  })

})