(function(){this.Mercury.modalHandlers.insertSnippet=function(){var e=this;return this.element.find("form").on("submit",function(t){var n,r;return t.preventDefault(),n=e.element.find("form").serializeObject(),Mercury.snippet?(r=Mercury.snippet,r.setOptions(n),Mercury.snippet=null):r=Mercury.Snippet.create(e.options.snippetName,n),Mercury.trigger("action",{action:"insertSnippet",value:r}),e.hide()})}}).call(this);