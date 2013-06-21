!function(){this.Mercury.Region=function(){function e(e,t,i){this.element=e,this.window=t,this.options=null!=i?i:{},Mercury.log("building "+this.type(),this.element,this.options),this.document=this.window.document,this.name=this.element.attr(Mercury.config.regions.identifier),this.history=new Mercury.HistoryBuffer,this.build(),this.bindEvents(),this.pushHistory(),this.element.data("region",this)}return e.prototype.type=function(){return"unknown"},e.prototype.build=function(){},e.prototype.focus=function(){},e.prototype.bindEvents=function(){var e=this;return Mercury.on("mode",function(t,i){return"preview"===i.mode?e.togglePreview():void 0}),Mercury.on("focus:frame",function(){return e.previewing||Mercury.region!==e?void 0:e.focus()}),Mercury.on("action",function(t,i){return e.previewing||Mercury.region!==e||t.isDefaultPrevented()?void 0:i.action?e.execCommand(i.action,i):void 0}),this.element.on("mousemove",function(t){var i;if(!e.previewing&&Mercury.region===e)return i=jQuery(t.target).closest("[data-snippet]"),i.length&&(e.snippet=i,e.snippet.data("snippet"))?Mercury.trigger("show:toolbar",{type:"snippet",snippet:e.snippet}):void 0}),this.element.on("mouseout",function(){return e.previewing?void 0:Mercury.trigger("hide:toolbar",{type:"snippet",immediately:!1})})},e.prototype.content=function(e,t){var i,n,r,o,s;if(null==e&&(e=null),null==t&&(t=!1),null!==e)return this.element.html(e);if(i=jQuery("<div>").appendTo(this.document.createDocumentFragment()),i.html(this.element.html().replace(/^\s+|\s+$/g,"")),t)for(s=i.find("[data-snippet]"),r=0,o=s.length;o>r;r++)n=s[r],n=jQuery(n),n.attr({contenteditable:null,"data-version":null}),n.html("["+n.data("snippet")+"]");return i.html()},e.prototype.togglePreview=function(){return this.previewing?(this.previewing=!1,this.element.attr(Mercury.config.regions.attribute,this.type()),Mercury.region===this?this.focus():void 0):(this.previewing=!0,this.element.removeAttr(Mercury.config.regions.attribute),Mercury.trigger("region:blurred",{region:this}))},e.prototype.execCommand=function(e,t){return null==t&&(t={}),this.focus(),"redo"!==e&&this.pushHistory(),Mercury.log("execCommand",e,t.value),Mercury.changes=!0},e.prototype.pushHistory=function(){return this.history.push(this.content())},e.prototype.snippets=function(){var e,t,i,n,r,o;for(i={},o=this.element.find("[data-snippet]"),n=0,r=o.length;r>n;n++)e=o[n],t=Mercury.Snippet.find(jQuery(e).data("snippet")),t&&(i[t.identity]=t.serialize());return i},e.prototype.dataAttributes=function(){var e,t,i,n,r;for(t={},r=Mercury.config.regions.dataAttributes,i=0,n=r.length;n>i;i++)e=r[i],t[e]=(this.container||this.element).attr("data-"+e);return t},e.prototype.serialize=function(){return{type:this.type(),data:this.dataAttributes(),value:this.content(null,!0),snippets:this.snippets()}},e}()}.call(this);