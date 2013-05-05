$ ->
  # TODO: tooltips aren't working yet...
  $('#licensed').tooltip()
  $('.item.photo').first().addClass("active");

  $("#update").click ->
    introJs().start();

    introJs().onchange () ->
      console.log "new step"

  # --- Delegate mouse clicks for each introjs element -------------------
  ###  # Disable temporarily
  $('.best_in_place').after("  <a href='javascript:void(0)' class='edit-link'><i class='e-icon-pencil'>edit</i></a>")
  ###


  $('.edit-link').click (evt) ->
    $(this).prev().click()

  # --- best in place overrides:

  $('#best_in_place_user_1_email').click()

  # Call this LAST
  $('.best_in_place').best_in_place()

  $('#portfolio').mouseover ->
    $('#add_photos').show()
    $('#add_photos').css({"opacity": "1"})

  $('#portfolio').mouseout ->
    $('#add_photos').css({"opacity": ".5"})