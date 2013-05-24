setupIntro = (fields) ->

  console.log "Setting up intro"
  console.log fields

  i = 1
  for key, value of fields

    console.log "STEP: ", i
    console.log "INTRO: ", value["intro"]
    console.log "SKIP: ", value["skippable"]

    obj = $('#' + key)

    obj.attr({
      "data-step": i
      "data-intro": value["intro"]
      "data-skip": value["skippable"]
    })

    console.log(obj.data());
    i++

$(document).ready ->

  if $("#page.profile").length > 0

    # Order of fields to be displayed during the intro sequence
    fields = {

      # On the "Card"
      ##################################################################
      top: {
        intro: "Welcome to your Homespree profile! Taking a few seconds to fill out
                your profile will help customers find your business."
        position: "top"
      }

      title: {
        intro: "What is the name of your company?"
      }

      # This will be filled in when the contractor defines their specialties
      primary_service: {
        intro: "What is the primary service offered by your company?"
      }

      # Probably not essential
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

      license_number: {
        intro: "What is your license number?"
        skippable: "I do not have a license"

        # TODO: license state
      }

      insured_up_to: {
        intro: "Insured Amount?"
        skippable: "I do not have insurance"
      }

      bonded_up_to: {
        intro: "Bonded Amount?"
        skippable: "I am not bonded"
      }


      # Location Info:
      ##################################################################
      service_area: {
        intro: "Where is your business located?"
      }


      # Optional Fields
      ##################################################################
      services: {
        intro: "What services does your company offer?"
      }

      slogan: {
        intro: "Your company's slogan?"
      }

      description: {
        intro: "Enter a brief description of your company"
      }
    }

    setupIntro(fields)

    introJs().onchange((targetElement) ->
      console.log "Updated: ", targetElement
      ### The following should happen at each step of the introduction:

        Before:
        1. Convert any relevant fields to text inputs.
        2.
        After:
      ###

      $(targetElement).find('a.edit-link').click()
    ).start()

    $('.best_in_place').each (idx, item) ->
      if $(item).text() == ""
        $(item).text('click to add content')


    $('.best_in_place').best_in_place()

    $('#portfolio').mouseover ->
      $('#add_photos').show()
      $('#add_photos').css({"opacity": "1"})

    $('#portfolio').mouseout ->
      $('#add_photos').css({"opacity": ".5"})


    $('#licensed').tooltip()
    $('.item.photo').first().addClass("active");
