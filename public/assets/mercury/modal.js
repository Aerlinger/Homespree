(function(){var e=function(e,t){return function(){return e.apply(t,arguments)}};this.Mercury.modal=function(e,t){var n;return t==null&&(t={}),n=new Mercury.Modal(e,t),n.show(),n},this.Mercury.Modal=function(){function t(t,n){this.url=t,this.options=n!=null?n:{},this.hide=e(this.hide,this)}return t.prototype.show=function(e,t){var n,r=this;e==null&&(e=null),t==null&&(t=null),this.url=e||this.url,this.options=t||this.options,(n=this.options).minWidth||(n.minWidth=400),this.options.ujsHandling!==!1&&(this.options.ujsHandling=!0),Mercury.trigger("focus:window"),this.initializeModal(),this.visible?this.update():this.appear();if(this.options.content)return setTimeout(function(){return r.loadContent(r.options.content)},500)},t.prototype.initializeModal=function(){if(this.initialized)return;return this.build(),this.bindEvents(),this.initialized=!0},t.prototype.build=function(){var e,t;return this.element=jQuery("<div>",{"class":"mercury-modal loading"}),this.element.html('<h1 class="mercury-modal-title"><span></span><a>&times;</a></h1>'),this.element.append('<div class="mercury-modal-content-container"><div class="mercury-modal-content"></div></div>'),this.overlay=jQuery("<div>",{"class":"mercury-modal-overlay"}),this.titleElement=this.element.find(".mercury-modal-title"),this.contentContainerElement=this.element.find(".mercury-modal-content-container"),this.contentElement=this.element.find(".mercury-modal-content"),this.element.appendTo((e=jQuery(this.options.appendTo).get(0))!=null?e:"body"),this.overlay.appendTo((t=jQuery(this.options.appendTo).get(0))!=null?t:"body")},t.prototype.bindEvents=function(){var e=this;return Mercury.on("refresh",function(){return e.resize(!0)}),Mercury.on("resize",function(){return e.position()}),this.overlay.on("click",function(){if(e.options.allowHideUsingOverlay)return e.hide()}),this.titleElement.find("a").on("click",function(){return e.hide()}),this.options.ujsHandling&&this.element.on("ajax:beforeSend",function(t,n,r){return r.success=function(t){return e.loadContent(t)}}),jQuery(document).on("keydown",function(t){if(t.keyCode===27&&e.visible)return e.hide()})},t.prototype.appear=function(){var e=this;return this.showing=!0,this.position(),this.overlay.show(),this.overlay.animate({opacity:1},200,"easeInOutSine",function(){return e.element.css({top:-e.element.height()}),e.setTitle(),e.element.show(),e.element.animate({top:0},200,"easeInOutSine",function(){return e.visible=!0,e.showing=!1,e.load()})})},t.prototype.resize=function(e){var t,n,r,i,s=this;r=e?"visible":"hidden",n=this.titleElement.outerHeight(),i=this.contentElement.outerWidth(),this.contentPane&&this.contentPane.css({height:"auto"}),this.contentElement.css({height:"auto",visibility:r,display:"block"}),t=this.contentElement.outerHeight()+n,i<this.options.minWidth&&(i=this.options.minWidth);if(t>Mercury.displayRect.fullHeight||this.options.fullHeight)t=Mercury.displayRect.fullHeight;return this.element.stop().animate({left:(Mercury.displayRect.width-i)/2,width:i,height:t},200,"easeInOutSine",function(){var e;return s.contentElement.css({visibility:"visible",display:"block"}),s.contentPane.length?(s.contentElement.css({height:t-n,overflow:"visible"}),e=s.contentControl.length?s.contentControl.outerHeight()+10:0,s.contentPane.css({height:t-n-e-20}),s.contentPane.find(".mercury-display-pane").css({width:i-20})):s.contentElement.css({height:t-n,overflow:"auto"})})},t.prototype.position=function(){var e,t,n,r,i;r=Mercury.displayRect.width,this.contentPane&&this.contentPane.css({height:"auto"}),this.contentElement.css({height:"auto"}),this.element.css({width:"auto",height:"auto",display:"block",visibility:"hidden"}),i=this.element.width(),t=this.element.height(),i<this.options.minWidth&&(i=this.options.minWidth);if(t>Mercury.displayRect.fullHeight||this.options.fullHeight)t=Mercury.displayRect.fullHeight;return n=this.titleElement.outerHeight(),this.contentPane&&this.contentPane.length?(this.contentElement.css({height:t-n,overflow:"visible"}),e=this.contentControl.length?this.contentControl.outerHeight()+10:0,this.contentPane.css({height:t-n-e-20}),this.contentPane.find(".mercury-display-pane").css({width:i-20})):this.contentElement.css({height:t-n,overflow:"auto"}),this.element.css({left:(r-i)/2,width:i,height:t,display:this.visible?"block":"none",visibility:"visible"})},t.prototype.update=function(){return this.reset(),this.resize(),this.load()},t.prototype.load=function(){var e=this;this.setTitle();if(!this.url)return;return this.element.addClass("loading"),Mercury.preloadedViews[this.url]?setTimeout(function(){return e.loadContent(Mercury.preloadedViews[e.url])},10):jQuery.ajax(this.url,{headers:Mercury.ajaxHeaders(),type:this.options.loadType||"GET",data:this.options.loadData,success:function(t){return e.loadContent(t)},error:function(){return e.hide(),Mercury.notify("Mercury was unable to load %s for the modal.",e.url)}})},t.prototype.loadContent=function(e,t){return t==null&&(t=null),this.initializeModal(),this.options=t||this.options,this.setTitle(),this.loaded=!0,this.element.removeClass("loading"),this.contentElement.html(e),this.contentElement.css({display:"none",visibility:"hidden"}),this.contentPane=this.element.find(".mercury-display-pane-container"),this.contentControl=this.element.find(".mercury-display-controls"),this.options.afterLoad&&this.options.afterLoad.call(this),this.options.handler&&(Mercury.modalHandlers[this.options.handler]?typeof Mercury.modalHandlers[this.options.handler]=="function"?Mercury.modalHandlers[this.options.handler].call(this):(jQuery.extend(this,Mercury.modalHandlers[this.options.handler]),this.initialize()):Mercury.lightviewHandlers[this.options.handler]&&(typeof Mercury.lightviewHandlers[this.options.handler]=="function"?Mercury.lightviewHandlers[this.options.handler].call(this):(jQuery.extend(this,Mercury.lightviewHandlers[this.options.handler]),this.initialize()))),Mercury.config.localization.enabled&&this.element.localize(Mercury.locale()),this.element.find(".modal-close").on("click",this.hide),this.resize()},t.prototype.setTitle=function(){var e;return this.titleElement.find("span").html(Mercury.I18n(this.options.title)),e=this.titleElement.find("a"),this.options.closeButton===!1?e.hide():e.show()},t.prototype.serializeForm=function(){return this.element.find("form").serializeObject()||{}},t.prototype.reset=function(){return this.titleElement.find("span").html(""),this.contentElement.html("")},t.prototype.hide=function(){if(this.showing)return;return this.options={},Mercury.trigger("focus:frame"),this.element.hide(),this.overlay.hide(),this.reset(),this.visible=!1},t}()}).call(this);