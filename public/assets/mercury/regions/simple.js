(function(){var t={}.hasOwnProperty,e=function(e,i){function n(){this.constructor=e}for(var s in i)t.call(i,s)&&(e[s]=i[s]);return n.prototype=i.prototype,e.prototype=new n,e.__super__=i.prototype,e};this.Mercury.Regions.Simple=function(t){function i(t,e,s){this.element=t,this.window=e,this.options=null!=s?s:{},Mercury.log("building "+n,this.element,this.options),i.__super__.constructor.apply(this,arguments)}var n;return e(i,t),i.supported=document.getElementById,i.supportedText="Chrome 10+, Firefox 4+, IE 7+, Safari 5+, Opera 8+",n="simple",i.prototype.type=function(){return n},i.prototype.build=function(){var t,e,i;return"block"===this.element.css("display")?(i="100%",t=this.element.height()):(i=this.element.width(),t=this.element.height()),e=this.element.text(),this.textarea=jQuery("<textarea>",this.document).val(e).addClass("mercury-textarea"),this.textarea.css({border:0,background:"transparent","overflow-y":"hidden",width:i,height:t,fontFamily:"inherit",fontSize:"inherit",fontWeight:"inherit",fontStyle:"inherit",color:"inherit","min-height":0,padding:"0",margin:0,"border-radius":0,display:"inherit",lineHeight:"inherit",textAlign:"inherit"}),this.element.empty().append(this.textarea),this.container=this.element,this.container.data("region",this),this.element=this.textarea,this.resize()},i.prototype.bindEvents=function(){var t=this;return Mercury.on("mode",function(e,i){return"preview"===i.mode?t.togglePreview():void 0}),Mercury.on("focus:frame",function(){return t.previewing||Mercury.region!==t?void 0:t.focus()}),Mercury.on("action",function(e,i){return t.previewing||Mercury.region!==t?void 0:i.action?t.execCommand(i.action,i):void 0}),Mercury.on("unfocus:regions",function(){return t.previewing||Mercury.region!==t?void 0:(t.element.blur(),t.container.removeClass("focus"),Mercury.trigger("region:blurred",{region:t}))}),this.bindElementEvents()},i.prototype.bindElementEvents=function(){var t=this;return this.element.on("focus",function(){return t.previewing?void 0:(Mercury.region=t,t.container.addClass("focus"),Mercury.trigger("region:focused",{region:t}))}),this.element.on("keydown",function(e){var i,n,s,r,o,a;if(!t.previewing){switch(t.resize(),e.keyCode){case 90:if(!e.metaKey)return;return e.preventDefault(),e.shiftKey?t.execCommand("redo"):t.execCommand("undo"),void 0;case 13:r=t.selection(),a=t.element.val(),o=a.lastIndexOf("\n",r.start),i=a.indexOf("\n",r.end),o>i&&(i=a.length),"\n"===a[o]&&(o=a.lastIndexOf("\n",r.start-1)),"-"===a[o+1]&&r.replace("\n- ",!1,!0),/\d/.test(a[o+1])&&(n=a.substring(o,i),/(\d+)\./.test(n)&&(s=parseInt(RegExp.$1),r.replace("\n"+(s+=1)+". ",!1,!0))),e.preventDefault();break;case 9:e.preventDefault(),t.execCommand("insertHTML",{value:"  "})}return t.pushHistory(e.keyCode)}}),this.element.on("keyup",function(){return t.previewing?void 0:(Mercury.changes=!0,t.resize(),Mercury.trigger("region:update",{region:t}))}),this.element.on("mouseup",function(){return t.previewing?void 0:(t.focus(),Mercury.trigger("region:focused",{region:t}))}),this.element.on("paste",function(e){if(!t.previewing&&Mercury.region===t){if(t.specialContainer)return e.preventDefault(),void 0;if(!t.pasting)return Mercury.changes=!0,t.handlePaste(e.originalEvent)}})},i.prototype.handlePaste=function(t){this.execCommand("insertHTML",{value:t.clipboardData.getData("text/plain").replace(/\n/g," ")}),t.preventDefault()},i.prototype.path=function(){return[this.container.get(0)]},i.prototype.focus=function(){return this.element.focus()},i.prototype.content=function(t,e){return null==t&&(t=null),null==e&&(e=!0),null!==t?"string"===jQuery.type(t)?this.element.val(t):(this.element.val(t.html),this.selection().select(t.selection.start,t.selection.end)):this.element.val()},i.prototype.contentAndSelection=function(){return{html:this.content(null,!1),selection:this.selection().serialize()}},i.prototype.togglePreview=function(){var t;return this.previewing?(this.previewing=!1,this.element=this.container,this.container.attr(Mercury.config.regions.attribute,n),this.build(),this.bindElementEvents(),Mercury.region===this?this.focus():void 0):(this.previewing=!0,t=jQuery("<div></div>").text(this.element.val()).html(),this.container.removeAttr(Mercury.config.regions.attribute),this.container.html(t),Mercury.trigger("region:blurred",{region:this}))},i.prototype.execCommand=function(t,e){var n;return null==e&&(e={}),i.__super__.execCommand.apply(this,arguments),(n=Mercury.Regions.Simple.actions[t])&&n.call(this,this.selection(),e),this.resize()},i.prototype.pushHistory=function(t){var e,i,n,s=this;return e=[13,46,8],n=2.5,t&&(i=e.indexOf(t)),clearTimeout(this.historyTimeout),i>=0&&i!==this.lastKnownKeyCode?this.history.push(this.contentAndSelection()):t?this.historyTimeout=setTimeout(function(){return s.history.push(s.contentAndSelection())},1e3*n):this.history.push(this.contentAndSelection()),this.lastKnownKeyCode=i},i.prototype.selection=function(){return new Mercury.Regions.Simple.Selection(this.element)},i.prototype.resize=function(){return this.element.css({height:this.element.get(0).scrollHeight-100}),this.element.css({height:this.element.get(0).scrollHeight})},i.prototype.snippets=function(){},i.actions={undo:function(){return this.content(this.history.undo())},redo:function(){return this.content(this.history.redo())},insertHTML:function(t,e){var i;return e.value.get&&(i=e.value.get(0))&&(e.value=jQuery("<div>").html(i).html()),t.replace(e.value,!1,!0)}},i}(Mercury.Region),Mercury.Regions.Simple.Selection=function(){function t(t){this.element=t,this.el=this.element.get(0),this.getDetails()}return t.prototype.serialize=function(){return{start:this.start,end:this.end}},t.prototype.getDetails=function(){return this.length=this.el.selectionEnd-this.el.selectionStart,this.start=this.el.selectionStart,this.end=this.el.selectionEnd,this.text=this.element.val().substr(this.start,this.length)},t.prototype.replace=function(t,e,i){var n,s,r;return null==e&&(e=!1),null==i&&(i=!1),this.getDetails(),r=this.element.val(),s=this.element.val(),this.element.val(r.substr(0,this.start)+t+r.substr(this.end,r.length)),n=this.element.val()!==s,e&&this.select(this.start,this.start+t.length),i&&this.select(this.start+t.length,this.start+t.length),n},t.prototype.select=function(t,e){return this.start=t,this.end=e,this.element.focus(),this.el.selectionStart=this.start,this.el.selectionEnd=this.end,this.getDetails()},t.prototype.wrap=function(t,e){return this.getDetails(),this.deselectNewLines(),this.replace(t+this.text+e,""!==this.text),""===this.text?this.select(this.start+t.length,this.start+t.length):void 0},t.prototype.deselectNewLines=function(){var t,e;return e=this.text,t=e.replace(/\n+$/g,"").length,this.select(this.start,this.start+t)},t.prototype.placeMarker=function(){return this.wrap("[mercury-marker]","[mercury-marker]")},t.prototype.removeMarker=function(){var t,e,i;return i=this.element.val(),e=i.indexOf("[mercury-marker]"),e>-1?(t=i.indexOf("[mercury-marker]",e+1)-"[mercury-marker]".length,this.element.val(this.element.val().replace(/\[mercury-marker\]/g,"")),this.select(e,t)):void 0},t.prototype.textContent=function(){return this.text},t}()}).call(this);