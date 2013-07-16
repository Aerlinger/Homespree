###
  ---------------------------------------------------------------------------------------------------------------------

  Client-side (Non-AJAX) code for the Contractor profile pages

  ---------------------------------------------------------------------------------------------------------------------
###

# Order of fields to be displayed during the intro sequence -----------------------------------------------------------
fields = {

# TODO: Enable editing first and last name in a single step
	card_first_name:
		{
			intro: "Name of the owner? (First and Last)"
			required: true
		}

	card_mobile_number:
		{
			intro: "What is your phone number?"
			required: true
		}

# Should this be a dropdown?
	card_years_experience:
		{
			intro: "How many years have you been in business?"
			required: true
		}

# Optional Fields
##################################################################
	services:
		{
			intro: "What services does your company offer?"
			position: "left"
			required: true
		}

# Location Info:
##################################################################
	service_area:
		{
			intro: "Where is your business located?"
			position: "left"
			required: true
		}

	slogan:
		{
			intro: "Your company's slogan?"
		}

	description:
		{
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

# ui-sortable-helper
window.sortableFields = ->
#	Make contractor specialties sortable
	$('#contractor_specialties').sortable
		helper: "clone"
		appendTo: $('#available_specialties')
		revert: true
		zIndex: Number.MAX_VALUE
		axis: 'y'
		update: ->
			$.post($(this).data('update-url'), $(this).sortable('serialize'))



window.launchIntroJs = ->
	# Load the definition of our introduction fields
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
	).oncomplete( ->
    $('body').click()
  ).start()

	setTimeout () ->
		$('.introjs-overlay').click()
	, 500

# The default HTML file upload field is rather nasty and non-customizable so we make it invisible and delegate
# an onClick event to another, prettier, button.
window.invisibleUploadFields = ->
  # These should be declared in the order in which they appear in the DOM (portrait, portfolio, logo)

	$('#upload_portrait').click (evt) ->
		$('#hidden_portrait_url').click()

	$('#upload_logo').click (evt) ->
		$('#hidden_logo_url').click()


# A silly hack to force the form to submit when a file is uploaded:
window.uploadfile = (form_id) ->
	console.log "Uploading for form #{form_id}"
	# click the submit button
	$(form_id).next().click()

# Trims leading and trailing whitespace from a string:  ---------------------------------------------------------------
strtrim = (str) ->
	str?.replace(/^\s\s*/, '')?.replace(/\s\s*$/, '')

$(document).ready ->
  $('ul.slides').first().removeClass('flex-active-slide')
  sortableFields()


$(window).load ->
  $('.best_in_place').best_in_place()
  $('.best_in_place').bind "ajax:success", () ->
    $(this).closest('li').effect 'highlight', {color: "#88FF22"} , 800, () ->
      $(this).find('.edit-link').text("Edit").show()
      $(this).addClass('_edited')


	# TODO: Tooltips aren't working for some reason.
  $('#licensed').tooltip()
  $('.item.photo').first().addClass("active")

  $('#upload_portfolio').click (evt) ->
    $('#hidden_portfolio_url').click()

  invisibleUploadFields()

  $("#portrait_s3_upload").S3Uploader()
  $('#portrait_s3_upload').bind "s3_upload_complete", (e, content) ->
    console.log "Portrait Upload completed"

  $("#logo_s3_upload").S3Uploader()
  $('#logo_s3_upload').bind "s3_upload_complete", (e, content) ->
    console.log "Logo Upload completed"

  $("#portfolio_s3_upload").S3Uploader()
  $('#portfolio_s3_upload').bind "s3_upload_complete", (e, content) ->
    console.log "portfolio Upload completed"

  # TODO: Tooltips aren't working for some reason.
  $('#licensed').tooltip()
  $('.item.photo').first().addClass("active")