(function(){this.Mercury.Region=function(){function e(e,t,n){this.element=e,this.window=t,this.options=n!=null?n:{},Mercury.log("building "+this.type(),this.element,this.options),this.document=this.window.document,this.name=this.element.attr(Mercury.config.regions.identifier),this.history=new Mercury.HistoryBuffer,this.build(),this.bindEvents(),this.pushHistory(),this.element.data("region",this)}return e.prototype.type=function(){return"unknown"},e.prototype.build=function(){},e.prototype.focus=function(){},e.prototype.bindEvents=function(){var e=this;return Mercury.on("mode",function(t,n){if(n.mode==="preview")return e.togglePreview()}),Mercury.on("focus:frame",function(){if(e.previewing||Mercury.region!==e)return;return e.focus()}),Mercury.on("action",function(t,n){if(e.previewing||Mercury.region!==e||t.isDefaultPrevented())return;if(n.action)return e.execCommand(n.action,n)}),this.element.on("mousemove",function(t){var n;if(e.previewing||Mercury.region!==e)return;n=jQuery(t.target).closest("[data-snippet]");if(n.length){e.snippet=n;if(e.snippet.data("snippet"))return Mercury.trigger("show:toolbar",{type:"snippet",snippet:e.snippet})}}),this.element.on("mouseout",function(){if(e.previewing)return;return Mercury.trigger("hide:toolbar",{type:"snippet",immediately:!1})})},e.prototype.content=function(e,t){var n,r,i,s,o;e==null&&(e=null),t==null&&(t=!1);if(e!==null)return this.element.html(e);n=jQuery("<div>").appendTo(this.document.createDocumentFragment()),n.html(this.element.html().replace(/^\s+|\s+$/g,""));if(t){o=n.find("[data-snippet]");for(i=0,s=o.length;i<s;i++)r=o[i],r=jQuery(r),r.attr({contenteditable:null,"data-version":null}),r.html("["+r.data("snippet")+"]")}return n.html()},e.prototype.togglePreview=function(){if(!this.previewing)return this.previewing=!0,this.element.removeAttr(Mercury.config.regions.attribute),Mercury.trigger("region:blurred",{region:this});this.previewing=!1,this.element.attr(Mercury.config.regions.attribute,this.type());if(Mercury.region===this)return this.focus()},e.prototype.execCommand=function(e,t){return t==null&&(t={}),this.focus(),e!=="redo"&&this.pushHistory(),Mercury.log("execCommand",e,t.value),Mercury.changes=!0},e.prototype.pushHistory=function(){return this.history.push(this.content())},e.prototype.snippets=function(){var e,t,n,r,i,s;n={},s=this.element.find("[data-snippet]");for(r=0,i=s.length;r<i;r++){e=s[r],t=Mercury.Snippet.find(jQuery(e).data("snippet"));if(!t)continue;n[t.identity]=t.serialize()}return n},e.prototype.dataAttributes=function(){var e,t,n,r,i;t={},i=Mercury.config.regions.dataAttributes;for(n=0,r=i.length;n<r;n++)e=i[n],t[e]=(this.container||this.element).attr("data-"+e);return t},e.prototype.serialize=function(){return{type:this.type(),data:this.dataAttributes(),value:this.content(null,!0),snippets:this.snippets()}},e}()}).call(this);