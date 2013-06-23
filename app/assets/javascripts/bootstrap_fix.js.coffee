# Fixes bug in bootstrap that prevents dropdown from being clickable on tablets/smartphones
$('body').on 'touchstart.dropdown', '.dropdown-menu', (e) ->
  e.stopPropagation()