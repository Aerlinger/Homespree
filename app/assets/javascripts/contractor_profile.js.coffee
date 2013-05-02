$ ->
  # TODO: tooltips aren't working yet...
  # $('#licensed').tooltip()

  $("#update").click ->
    introJs().start();

    introJs().onchange () ->
      console.log "new step"

  # --- Delegate mouse clicks for each introjs element -------------------
  $('.best_in_place').after("  <a href='javascript:void(0)' class='edit-link'><i class='e-icon-pencil'>edit</i></a>")

  $('.edit-link').click (evt) ->
    $(this).prev().click()

  # --- base in place overrides:

  $('#best_in_place_user_1_email').click()


  # Call this LAST
  $('.best_in_place').best_in_place()