(function(){this.Mercury.modalHandlers.insertSnippet=function(){var t=this;return this.element.find("form").on("submit",function(e){var i,n;return e.preventDefault(),i=t.element.find("form").serializeObject(),Mercury.snippet?(n=Mercury.snippet,n.setOptions(i),Mercury.snippet=null):n=Mercury.Snippet.create(t.options.snippetName,i),Mercury.trigger("action",{action:"insertSnippet",value:n}),t.hide()})}}).call(this);