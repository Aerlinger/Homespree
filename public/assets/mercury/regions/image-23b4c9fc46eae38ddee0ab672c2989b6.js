(function(){var e={}.hasOwnProperty,t=function(t,n){function i(){this.constructor=t}for(var r in n)e.call(n,r)&&(t[r]=n[r]);return i.prototype=n.prototype,t.prototype=new i,t.__super__=n.prototype,t};this.Mercury.Regions.Image=function(e){function r(e,t,n){this.element=e,this.window=t,this.options=n!=null?n:{},r.__super__.constructor.apply(this,arguments)}var n;return t(r,e),r.supported=document.getElementById,r.supportedText="Chrome 10+, Firefox 4+, IE 7+, Safari 5+, Opera 8+",n="image",r.prototype.type=function(){return n},r.prototype.bindEvents=function(){var e=this;return Mercury.on("mode",function(t,n){if(n.mode==="preview")return e.togglePreview()}),Mercury.on("focus:frame",function(){if(e.previewing||Mercury.region!==e)return;return e.focus()}),Mercury.on("action",function(t,n){if(e.previewing||Mercury.region!==e)return;if(n.action)return e.execCommand(n.action,n)}),this.element.on("dragenter",function(t){if(e.previewing)return;return t.preventDefault(),t.originalEvent.dataTransfer.dropEffect="copy"}),this.element.on("dragover",function(t){if(e.previewing)return;return t.preventDefault(),t.originalEvent.dataTransfer.dropEffect="copy"}),this.element.on("drop",function(t){if(e.previewing)return;if(t.originalEvent.dataTransfer.files.length)return t.preventDefault(),e.focus(),Mercury.uploader(t.originalEvent.dataTransfer.files[0])}),this.element.on("focus",function(){return e.focus()})},r.prototype.togglePreview=function(){return this.previewing?(this.previewing=!1,this.element.attr(Mercury.config.regions.attribute,n),this.build()):(this.previewing=!0,this.element.removeAttr(Mercury.config.regions.attribute),Mercury.trigger("region:blurred",{region:this}))},r.prototype.focus=function(){if(this.previewing)return;return Mercury.region=this,Mercury.trigger("region:focused",{region:this}),Mercury.trigger("region:update",{region:this})},r.prototype.execCommand=function(e,t){var n;t==null&&(t={}),r.__super__.execCommand.apply(this,arguments);if(n=Mercury.Regions.Image.actions[e])return n.call(this,t)},r.prototype.pushHistory=function(){return this.history.push({src:this.element.attr("src")})},r.prototype.updateSrc=function(e){return this.element.attr("src",e)},r.prototype.serialize=function(){return{type:n,data:this.dataAttributes(),attributes:{src:this.element.attr("src")}}},r.actions={undo:function(){var e;if(e=this.history.undo())return this.updateSrc(e.src)},redo:function(){var e;if(e=this.history.redo())return this.updateSrc(e.src)},insertImage:function(e){return this.updateSrc(e.value.src)}},r}(Mercury.Region)}).call(this);