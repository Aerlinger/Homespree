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

  mobile_number: {
    intro: "What is your phone number?"
  }

# Should this be a dropdown?
  years_experience: {
    intro: "How many years have you been in business?"
  }

  insured_up_to: {
    intro: "Insured Amount?"
    skippable: "I do not have insurance"
  }

  bonded_up_to: {
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
  if $("#page.profile").length > 0

    $("#logo_uploader").S3Uploader()

    # Load the definition of out introduction fields
    setupIntro(fields)

    introJs().onchange((targetElement) ->
#      $('.introjs-overlay').click()
#
#      # Timeout is used to account for the delay when switching fields
#      setTimeout () ->
#        $(targetElement).find('a.edit-link').click()
#      , 500
    ).start()

    # Services section responsive design:  ----------------------------------------------------------------------------

    # When deleting a contractor's specialty, hide the X button and add a list item to #available specialties
    $('#contractor_specialties').sortable
      axis: 'y'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))

        # Update the info in the contractor's card
        $("#primary_service_text").text($(this).find('.specialty-name').first().text())

    # When deleting a contractor's specialty, hide the X button and add a list item to #available specialties
    $(".delete-specialty").click (evt) ->

      $(this).parent().hide(500);
      specialty_text = strtrim($(this).parent().first().find('.specialty-name').text())

      $("#available_specialties").prepend(
        '<li>' +
        specialty_text +
        '<a href="/contractors/1/specialties?specialty_name=Power+Washing"
            class="add-specialty pull-right btn btn-mini btn-success"
            data-method="post" data-remote="true" rel="nofollow">Add
        </a>
        </li>'
      ).fadeIn(500);


    # When clicking an "Add specialty" button, hide the button and add a list item to #contractor_specialties
    $(".add-specialty").click (evt) ->

      $(this).parent().hide(500);
      specialty_text = strtrim($(this).parent().first()[0].firstChild.data)

      $("#contractor_specialties").append(
        '<li class="specialty" id="specialty_5"><span class="badge badge-info drag" style="padding: 0 !important">
        &nbsp;
        <i class="e-icon-arrow-combo"></i>
        DRAG&nbsp;
        </span>
        <span class="specialty-name">' + specialty_text + '</span>
        <a href="/contractors/1/remove_specialty?specialty_id=5"
            class="delete-specialty pull-right"
            data-method="post" data-remote="true" rel="nofollow"
            style="position: relative; color: darkred;"><i class="e-icon-cancel"></i>
        </a>
        </li>'
      ).fadeIn(500)


    # Best In Place Customization:  -----------------------------------------------------------------------------------
#    $('.best_in_place').each (idx, item) ->
#      if $(item).text() == ""
#        $(item).html('<em>No information</em>')

    $('.best_in_place').best_in_place()

    # TODO: Tooltips aren't working for some reason.
    $('#licensed').tooltip()
    $('.item.photo').first().addClass("active");