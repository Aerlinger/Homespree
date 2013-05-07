$ ->
  $('#licensed').tooltip()
  $('.item.photo').first().addClass("active");

  $("#update").click ->
    introJs().onchange (targetElement) ->
      console.log "new step"

    introJs().start();

  console.log("Loaded contractor profile");



  $('.edit-link').click (evt) ->
    $(this).prev().click()

  $('#best_in_place_user_1_email').click()
  $('.best_in_place').best_in_place()

  $('#portfolio').mouseover ->
    $('#add_photos').show()
    $('#add_photos').css({"opacity": "1"})

  $('#portfolio').mouseout ->
    $('#add_photos').css({"opacity": ".5"})