jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

# Fixes bug that prevents dropdown from being clickable on tablets/smartphones
$('body').on 'touchstart.dropdown', '.dropdown-menu', (e) ->
  e.stopPropagation()