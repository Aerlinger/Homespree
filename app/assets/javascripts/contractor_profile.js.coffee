###
  ---------------------------------------------------------------------------------------------------------------------

  Client-side (Non-AJAX) code for the Contractor profile pages

  ---------------------------------------------------------------------------------------------------------------------
###

# Order of fields to be displayed during the intro sequence -----------------------------------------------------------
fields = {

  # Card fields
  ##################################################################
  title: {  # The company title
    intro: "What is the name of your company?"
  }

  # TODO: Enable editing first and last name in a single step
  full_name: {
    intro: "Name of the owner?"
  }

  card_mobile_number: {
    intro: "What is your phone number?"
  }

# Should this be a dropdown?
  card_years_experience: {
    intro: "How many years have you been in business?"
  }

  card_insured_up_to: {
    intro: "Insured Amount?"
    skippable: "I do not have insurance"
  }

  card_bonded_up_to: {
    intro: "Bonded Amount?"
    skippable: "I am not bonded"
  }

  # Optional Fields
  ##################################################################
  services: {
    intro: "What services does your company offer?"
    position: "left"
  }

  # Location Info:
  ##################################################################
  service_area: {
    intro: "Where is your business located?"
    position: "left"
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
  i = 1
  # Add data attributes for each field to the DOM
  for key, value of intro_fields
    obj = $('#' + key)
    obj.attr({
      "data-step": i
      "data-intro": value["intro"]
      "data-skip": value["skippable"]
    })
    i++

    
# Trims leading and trailing whitespace from a string:  ---------------------------------------------------------------
strtrim = (str) ->
  str?.replace(/^\s\s*/, '')?.replace(/\s\s*$/, '')


$(document).ready ->

  # Only run this script if we're on the contractor's profile page.
  if $("#page.profile").length > 0

    # Load the definition of out introduction fields
    setupIntro(fields)

    # Timeout is used to account for the delay when switching fields:
    introJs().onchange((targetElement) ->
      $('.introjs-overlay').click()

      # Timeout is used to account for the delay when switching fields
      setTimeout () ->
        $(targetElement).find('a.edit-link').click()
      , 500
    ).start()

    # Make contractor specialties sortable
    $('#contractor_specialties').sortable
      axis: 'y'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))

        # Update the info in the contractor's card
        $("#primary_service_text").text($(this).find('.specialty-name').first().text())

    # When clicking an "Add specialty" button, hide the button and add a list item to #contractor_specialties
    $(".add-specialty").click (evt) ->
      $(this).parent().hide(500);
      specialty_text = strtrim($(this).parent().first()[0].firstChild.data)


    $("#logo_uploader").S3Uploader()
    $('.best_in_place').best_in_place()

    # TODO: Tooltips aren't working for some reason.
    $('#licensed').tooltip()
    $('.item.photo').first().addClass("active");