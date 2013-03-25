(function(){this.Mercury.modalHandlers.insertMedia={initialize:function(){var e=this;return this.element.find(".control-label input").on("click",this.onLabelChecked),this.element.find(".controls .optional, .controls .required").on("focus",function(t){return e.onInputFocused($(t.target))}),this.focus("#media_image_url"),this.initializeForm(),this.element.find("form").on("submit",function(t){t.preventDefault(),e.validateForm();if(!e.valid){e.resize();return}return e.submitForm(),e.hide()})},initializeForm:function(){var e,t,n,r;if(!Mercury.region||!Mercury.region.selection)return;n=Mercury.region.selection();if(t=typeof n.is=="function"?n.is("img"):void 0)this.element.find("#media_image_url").val(t.attr("src")),this.element.find("#media_image_alignment").val(t.attr("align")),this.element.find("#media_image_float").val(t.attr("style")!=null?t.css("float"):""),this.focus("#media_image_url");if(e=typeof n.is=="function"?n.is("iframe"):void 0){r=e.attr("src");if(/^https?:\/\/www.youtube.com\//i.test(r))return this.element.find("#media_youtube_url").val(""+r.match(/^https?/)[0]+"://youtu.be/"+r.match(/\/embed\/(\w+)/)[1]),this.element.find("#media_youtube_width").val(e.width()),this.element.find("#media_youtube_height").val(e.height()),this.focus("#media_youtube_url");if(/^https?:\/\/player.vimeo.com\//i.test(r))return this.element.find("#media_vimeo_url").val(""+r.match(/^https?/)[0]+"://vimeo.com/"+r.match(/\/video\/(\w+)/)[1]),this.element.find("#media_vimeo_width").val(e.width()),this.element.find("#media_vimeo_height").val(e.height()),this.focus("#media_vimeo_url")}},focus:function(e){var t=this;return setTimeout(function(){return t.element.find(e).focus()},300)},onLabelChecked:function(){var e;return e=jQuery(this).closest(".control-label").attr("for"),jQuery(this).closest(".control-group").find("#"+e).focus()},onInputFocused:function(e){e.closest(".control-group").find("input[type=radio]").prop("checked",!0);if(e.closest(".media-options").length)return;return this.element.find(".media-options").hide(),this.element.find("#"+e.attr("id").replace("media_","")+"_options").show(),this.resize(!0)},addInputError:function(e,t){return e.after('<span class="help-inline error-message">'+Mercury.I18n(t)+"</span>").closest(".control-group").addClass("error"),this.valid=!1},clearInputErrors:function(){return this.element.find(".control-group.error").removeClass("error").find(".error-message").remove(),this.valid=!0},validateForm:function(){var e,t,n;this.clearInputErrors(),t=this.element.find("input[name=media_type]:checked").val(),e=this.element.find("#media_"+t);switch(t){case"youtube_url":n=this.element.find("#media_youtube_url").val();if(!/^https?:\/\/youtu.be\//.test(n))return this.addInputError(e,"is invalid");break;case"vimeo_url":n=this.element.find("#media_vimeo_url").val();if(!/^https?:\/\/vimeo.com\//.test(n))return this.addInputError(e,"is invalid");break;default:if(!e.val())return this.addInputError(e,"can't be blank")}},submitForm:function(){var e,t,n,r,i,s,o,u;s=this.element.find("input[name=media_type]:checked").val();switch(s){case"image_url":t={src:this.element.find("#media_image_url").val()};if(e=this.element.find("#media_image_alignment").val())t.align=e;if(r=this.element.find("#media_image_float").val())t.style="float: "+r+";";return Mercury.trigger("action",{action:"insertImage",value:t});case"youtube_url":return o=this.element.find("#media_youtube_url").val(),n=o.replace(/https?:\/\/youtu.be\//,""),i="http",/^https:/.test(o)&&(i="https"),u=jQuery("<iframe>",{width:parseInt(this.element.find("#media_youtube_width").val(),10)||560,height:parseInt(this.element.find("#media_youtube_height").val(),10)||349,src:""+i+"://www.youtube.com/embed/"+n+"?wmode=transparent",frameborder:0,allowfullscreen:"true"}),Mercury.trigger("action",{action:"insertHTML",value:u});case"vimeo_url":return o=this.element.find("#media_vimeo_url").val(),n=o.replace(/^https?:\/\/vimeo.com\//,""),i="http",/^https:/.test(o)&&(i="https"),u=jQuery("<iframe>",{width:parseInt(this.element.find("#media_vimeo_width").val(),10)||400,height:parseInt(this.element.find("#media_vimeo_height").val(),10)||225,src:""+i+"://player.vimeo.com/video/"+n+"?title=1&byline=1&portrait=0&color=ffffff",frameborder:0}),Mercury.trigger("action",{action:"insertHTML",value:u})}}}}).call(this);