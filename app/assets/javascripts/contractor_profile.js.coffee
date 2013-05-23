$(document).ready ->

  # Order of fields to be displayed during the intro sequence
  fields = {

    #  Company Name
    #  Primary Service (Painting, etc)
    #  Owner Name
    #  License Number (If no license, ‘I do not hold a license’)
    #  Insured up to $$ (If no insurance, ‘I do not have insurance’)
    #  Bonded up to $$ (If no insurance, ‘I am not bonded’)


    # On the "Card"
    title: {
      intro: "Welcome to your Homespree profile! Taking a few seconds to fill out
              your profile will help customers find your business."
      position: "top"
    },

    company_name: {
      intro: "What is the name of your company?"
    },

    owner_name: {
      intro: "Name of the owner?"
    }

    # This will be filled in when the contractor defines their specialties
    primary_service: {

    },


    license_number: {
      intro: "What is your license number?"
      skippable: "I do not have a license"

      # TODO: license info should go here.
    },

    insured_up_to: {
      skippable: "I do not have insurance"
    }

    bonded_up_to: {
      skippable: "I am not bonded"
    }

    # Location Info:

    # Services Info:
  }


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

  $('.edit_link').click ->
    $(this).hide()

  $('.edit-link').click ->
    $(this).hide()

setupIntro = () ->
