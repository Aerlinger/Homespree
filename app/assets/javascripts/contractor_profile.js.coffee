###
  ---------------------------------------------------------------------------------------------------------------------

  Client-side (Non-AJAX) code for the Contractor profile pages

  ---------------------------------------------------------------------------------------------------------------------
###

# Order of fields to be displayed during the intro sequence -----------------------------------------------------------
fields = {

  # TODO: Enable editing first and last name in a single step
  card_first_name: {
    intro: "Name of the owner? (First and Last)"
    required: true
  }

  card_mobile_number: {
    intro: "What is your phone number?"
    required: true
  }

# Should this be a dropdown?
  card_years_experience: {
    intro: "How many years have you been in business?"
    required: true
  }

  # Optional Fields
  ##################################################################
  services: {
    intro: "What services does your company offer?"
    position: "left"
    required: true
  }

  # Location Info:
  ##################################################################
  service_area: {
    intro: "Where is your business located?"
    position: "left"
    required: true
  }

  slogan: {
    intro: "Your company's slogan?"
  }

  description: {
    intro: "Enter a brief description of your company"
  }
}


# Load intro definition from a hash object:  --------------------------------------------------------------------------
setupIntro = (intro_fields) ->
  console.log "Loading Intro..."
  i = 1
  # Add data attributes for each field to the DOM
  for key, value of intro_fields
    i++
    obj = $('#' + key)
    obj.attr({
      "data-step": i
      "data-intro": value["intro"]
      "data-skip": value["skippable"]
      "data-required": value["required"]
    })


# Trims leading and trailing whitespace from a string:  ---------------------------------------------------------------
strtrim = (str) ->
  str?.replace(/^\s\s*/, '')?.replace(/\s\s*$/, '')

$(document).ready ->
  console.log("images loaded")

  # Only run this script if we're on the contractor's profile page.
  if $("#page.profile").length > 0

    # Load the definition of out introduction fields
    setupIntro(fields)

    $("#intro_js_start").attr({
      "data-step": 1
      "data-intro": "Welcome to your Homespree profile! Taking a few seconds to fill out your profile will help customers find your business."
      "data-position": "right"
    })

    # Timeout is used to account for the delay when switching fields:
    introJs().onchange((targetElement) ->

      # If the contractor has gone far enough to pass 'skippable' item, they do not need to see this message again.
      if $(targetElement).attr("data-step") > 1
        $('.introjs-overlay').click()

        # Timeout is used to account for the delay when switching fields
        setTimeout () ->
          $(targetElement).find('a.edit-link').click()
        , 500
    ).start()

    $('.best_in_place').best_in_place()
    setTimeout () ->
      $('.introjs-overlay').click()
    , 500

    # Make contractor specialties sortable
    $('#contractor_specialties').sortable
#      containment: "#services"
      helper: "clone"
      appendTo: 'body'
      revert: true
      zIndex: 9999
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))

        # Update the info in the contractor's card
        $("#primary_service_text").text($(this).find('.specialty-name').first().text())

    # TODO: Tooltips aren't working for some reason.
    $('#licensed').tooltip()
    $('.item.photo').first().addClass("active");