(function(){this.Mercury.modalHandlers.htmlEditor=function(){var t,e=this;return t=Mercury.region.content(null,!0,!1),this.element.find("textarea").val(t),this.element.find("form").on("submit",function(t){var i;return t.preventDefault(),i=e.element.find("textarea").val(),Mercury.trigger("action",{action:"replaceHTML",value:i}),e.hide()})}}).call(this);