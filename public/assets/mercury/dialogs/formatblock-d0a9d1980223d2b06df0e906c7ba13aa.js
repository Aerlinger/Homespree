!function(){this.Mercury.dialogHandlers.formatblock=function(){return this.element.find("[data-tag]").on("click",function(t){var e;return e=jQuery(t.target).data("tag"),Mercury.trigger("action",{action:"formatblock",value:e})})}}.call(this);