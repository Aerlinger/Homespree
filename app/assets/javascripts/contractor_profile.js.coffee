$(document).ready ->
  $('#licensed').tooltip()
  $('.item.photo').first().addClass("active");

  introJs().onchange((targetElement) ->
    console.log "new step"
    $(targetElement).find('.best_in_place').first().click()
  ).start()

  $('.best_in_place').each (idx, item) ->
    if $(item).text() == ""
      $(item).text('click to add content')

  $('.edit-link').click (evt) ->
    $(this).prev().click()

  $('.best_in_place').best_in_place()

  $('#portfolio').mouseover ->
    $('#add_photos').show()
    $('#add_photos').css({"opacity": "1"})

  $('#portfolio').mouseout ->
    $('#add_photos').css({"opacity": ".5"})