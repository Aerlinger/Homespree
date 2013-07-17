$ ->
  # Collapsible accordion  ------------------------------------------------------------------------------------------
  if $(".collapse").collapse
    $(".collapse").collapse()

  # Fixes bug in bootstrap that prevents dropdown from being clickable on tablets/smartphones
  $('body').on 'touchstart.dropdown', '.dropdown-menu', (e) ->
    e.stopPropagation()

  # Hide the flash message when clicked:  ---------------------------------------------------------------------------
  $('#flash_link').click (evt) ->
    $(this).slideUp(500)

  # Show/Hide the debug buttons:  -----------------------------------------------------------------------------------
  $("#show_debug").click (evt) ->
    $('.debug').toggle()

  $("#show_debug").click()