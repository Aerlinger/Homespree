$ ->
  $("#customer_type ul li a").click (evt) ->
    $("#customer_type a.btn .text").text "I'm a " + $(evt.target).text()

