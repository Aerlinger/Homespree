(function(){$(function(){return $("#customer_type ul li a").click(function(e){return $("#customer_type a.btn .text").text("I'm a "+$(e.target).text()),$("#user_type").attr("value",$(e.target).text())})})}).call(this);