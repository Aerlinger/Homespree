(function(){this.Mercury.dialogHandlers.style=function(){var e=this;return this.element.find("[data-class]").on("click",function(e){var t;return t=jQuery(e.target).data("class"),Mercury.trigger("action",{action:"style",value:t})})}}).call(this);