(function(e,t,i,n){var s=i(e),o=i(t),a=i.fancybox=function(){a.open.apply(this,arguments)},r=navigator.userAgent.match(/msie/),l=null,c=t.createTouch!==n,h=function(e){return e&&e.hasOwnProperty&&e instanceof i},u=function(e){return e&&"string"===i.type(e)},d=function(e){return u(e)&&e.indexOf("%")>0},p=function(e,t){var i=parseInt(e,10)||0;return t&&d(e)&&(i*=a.getViewport()[t]/100),Math.ceil(i)},f=function(e,t){return p(e,t)+"px"};i.extend(a,{version:"2.1.4",defaults:{padding:15,margin:20,width:800,height:600,minWidth:100,minHeight:100,maxWidth:9999,maxHeight:9999,autoSize:!0,autoHeight:!1,autoWidth:!1,autoResize:!0,autoCenter:!c,fitToView:!0,aspectRatio:!1,topRatio:.5,leftRatio:.5,scrolling:"auto",wrapCSS:"",arrows:!0,closeBtn:!0,closeClick:!1,nextClick:!1,mouseWheel:!0,autoPlay:!1,playSpeed:3e3,preload:3,modal:!1,loop:!0,ajax:{dataType:"html",headers:{"X-fancyBox":!0}},iframe:{scrolling:"auto",preload:!0},swf:{wmode:"transparent",allowfullscreen:"true",allowscriptaccess:"always"},keys:{next:{13:"left",34:"up",39:"left",40:"up"},prev:{8:"right",33:"down",37:"right",38:"down"},close:[27],play:[32],toggle:[70]},direction:{next:"left",prev:"right"},scrollOutside:!0,index:0,type:null,href:null,content:null,title:null,tpl:{wrap:'<div class="fancybox-wrap" tabIndex="-1"><div class="fancybox-skin"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div></div>',image:'<img class="fancybox-image" src="{href}" alt="" />',iframe:'<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" frameborder="0" vspace="0" hspace="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen'+(r?' allowtransparency="true"':"")+"></iframe>",error:'<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>',closeBtn:'<a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a>',next:'<a title="Next" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',prev:'<a title="Previous" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'},openEffect:"fade",openSpeed:250,openEasing:"swing",openOpacity:!0,openMethod:"zoomIn",closeEffect:"fade",closeSpeed:250,closeEasing:"swing",closeOpacity:!0,closeMethod:"zoomOut",nextEffect:"elastic",nextSpeed:250,nextEasing:"swing",nextMethod:"changeIn",prevEffect:"elastic",prevSpeed:250,prevEasing:"swing",prevMethod:"changeOut",helpers:{overlay:!0,title:!0},onCancel:i.noop,beforeLoad:i.noop,afterLoad:i.noop,beforeShow:i.noop,afterShow:i.noop,beforeChange:i.noop,beforeClose:i.noop,afterClose:i.noop},group:{},opts:{},previous:null,coming:null,current:null,isActive:!1,isOpen:!1,isOpened:!1,wrap:null,skin:null,outer:null,inner:null,player:{timer:null,isActive:!1},ajaxLoad:null,imgPreload:null,transitions:{},helpers:{},open:function(e,t){return e&&(i.isPlainObject(t)||(t={}),!1!==a.close(!0))?(i.isArray(e)||(e=h(e)?i(e).get():[e]),i.each(e,function(s,o){var r,l,c,d,p,f={};"object"===i.type(o)&&(o.nodeType&&(o=i(o)),h(o)?(f={href:o.data("fancybox-href")||o.attr("href"),title:o.data("fancybox-title")||o.attr("title"),isDom:!0,element:o},i.metadata&&i.extend(!0,f,o.metadata())):f=o),r=t.href||f.href||(u(o)?o:null),l=t.title!==n?t.title:f.title||"",d=(c=t.content||f.content)?"html":t.type||f.type,!d&&f.isDom&&(d=o.data("fancybox-type"),d||(d=(d=o.prop("class").match(/fancybox\.(\w+)/))?d[1]:null)),u(r)&&(d||(a.isImage(r)?d="image":a.isSWF(r)?d="swf":"#"===r.charAt(0)?d="inline":u(o)&&(d="html",c=o)),"ajax"===d&&(p=r.split(/\s+/,2),r=p.shift(),p=p.shift())),c||("inline"===d?r?c=i(u(r)?r.replace(/.*(?=#[^\s]+$)/,""):r):f.isDom&&(c=o):"html"===d?c=r:!d&&!r&&f.isDom&&(d="inline",c=o)),i.extend(f,{href:r,type:d,content:c,title:l,selector:p}),e[s]=f}),a.opts=i.extend(!0,{},a.defaults,t),t.keys!==n&&(a.opts.keys=t.keys?i.extend({},a.defaults.keys,t.keys):!1),a.group=e,a._start(a.opts.index)):void 0},cancel:function(){var e=a.coming;e&&!1!==a.trigger("onCancel")&&(a.hideLoading(),a.ajaxLoad&&a.ajaxLoad.abort(),a.ajaxLoad=null,a.imgPreload&&(a.imgPreload.onload=a.imgPreload.onerror=null),e.wrap&&e.wrap.stop(!0,!0).trigger("onReset").remove(),a.coming=null,a.current||a._afterZoomOut(e))},close:function(e){a.cancel(),!1!==a.trigger("beforeClose")&&(a.unbindEvents(),a.isActive&&(a.isOpen&&!0!==e?(a.isOpen=a.isOpened=!1,a.isClosing=!0,i(".fancybox-item, .fancybox-nav").remove(),a.wrap.stop(!0,!0).removeClass("fancybox-opened"),a.transitions[a.current.closeMethod]()):(i(".fancybox-wrap").stop(!0).trigger("onReset").remove(),a._afterZoomOut())))},play:function(e){var t=function(){clearTimeout(a.player.timer)},n=function(){t(),a.current&&a.player.isActive&&(a.player.timer=setTimeout(a.next,a.current.playSpeed))},s=function(){t(),i("body").unbind(".player"),a.player.isActive=!1,a.trigger("onPlayEnd")};!0===e||!a.player.isActive&&!1!==e?a.current&&(a.current.loop||a.current.index<a.group.length-1)&&(a.player.isActive=!0,i("body").bind({"afterShow.player onUpdate.player":n,"onCancel.player beforeClose.player":s,"beforeLoad.player":t}),n(),a.trigger("onPlayStart")):s()},next:function(e){var t=a.current;t&&(u(e)||(e=t.direction.next),a.jumpto(t.index+1,e,"next"))},prev:function(e){var t=a.current;t&&(u(e)||(e=t.direction.prev),a.jumpto(t.index-1,e,"prev"))},jumpto:function(e,t,i){var s=a.current;s&&(e=p(e),a.direction=t||s.direction[e>=s.index?"next":"prev"],a.router=i||"jumpto",s.loop&&(0>e&&(e=s.group.length+e%s.group.length),e%=s.group.length),s.group[e]!==n&&(a.cancel(),a._start(e)))},reposition:function(e,t){var n,s=a.current,o=s?s.wrap:null;o&&(n=a._getPosition(t),e&&"scroll"===e.type?(delete n.position,o.stop(!0,!0).animate(n,200)):(o.css(n),s.pos=i.extend({},s.dim,n)))},update:function(e){var t=e&&e.type,i=!t||"orientationchange"===t;i&&(clearTimeout(l),l=null),a.isOpen&&!l&&(l=setTimeout(function(){var n=a.current;n&&!a.isClosing&&(a.wrap.removeClass("fancybox-tmp"),(i||"load"===t||"resize"===t&&n.autoResize)&&a._setDimension(),"scroll"===t&&n.canShrink||a.reposition(e),a.trigger("onUpdate"),l=null)},i&&!c?0:300))},toggle:function(e){a.isOpen&&(a.current.fitToView="boolean"===i.type(e)?e:!a.current.fitToView,c&&(a.wrap.removeAttr("style").addClass("fancybox-tmp"),a.trigger("onUpdate")),a.update())},hideLoading:function(){o.unbind(".loading"),i("#fancybox-loading").remove()},showLoading:function(){var e,t;a.hideLoading(),e=i('<div id="fancybox-loading"><div></div></div>').click(a.cancel).appendTo("body"),o.bind("keydown.loading",function(e){27===(e.which||e.keyCode)&&(e.preventDefault(),a.cancel())}),a.defaults.fixed||(t=a.getViewport(),e.css({position:"absolute",top:.5*t.h+t.y,left:.5*t.w+t.x}))},getViewport:function(){var t=a.current&&a.current.locked||!1,i={x:s.scrollLeft(),y:s.scrollTop()};return t?(i.w=t[0].clientWidth,i.h=t[0].clientHeight):(i.w=c&&e.innerWidth?e.innerWidth:s.width(),i.h=c&&e.innerHeight?e.innerHeight:s.height()),i},unbindEvents:function(){a.wrap&&h(a.wrap)&&a.wrap.unbind(".fb"),o.unbind(".fb"),s.unbind(".fb")},bindEvents:function(){var e,t=a.current;t&&(s.bind("orientationchange.fb"+(c?"":" resize.fb")+(t.autoCenter&&!t.locked?" scroll.fb":""),a.update),(e=t.keys)&&o.bind("keydown.fb",function(s){var o=s.which||s.keyCode,r=s.target||s.srcElement;return 27===o&&a.coming?!1:(!(s.ctrlKey||s.altKey||s.shiftKey||s.metaKey||r&&(r.type||i(r).is("[contenteditable]"))||!i.each(e,function(e,r){return t.group.length>1&&r[o]!==n?(a[e](r[o]),s.preventDefault(),!1):i.inArray(o,r)>-1?(a[e](),s.preventDefault(),!1):void 0})),void 0)}),i.fn.mousewheel&&t.mouseWheel&&a.wrap.bind("mousewheel.fb",function(e,n,s,o){for(var r=i(e.target||null),l=!1;r.length&&!l&&!r.is(".fancybox-skin")&&!r.is(".fancybox-wrap");)l=r[0]&&!(r[0].style.overflow&&"hidden"===r[0].style.overflow)&&(r[0].clientWidth&&r[0].scrollWidth>r[0].clientWidth||r[0].clientHeight&&r[0].scrollHeight>r[0].clientHeight),r=i(r).parent();0!==n&&!l&&a.group.length>1&&!t.canShrink&&(o>0||s>0?a.prev(o>0?"down":"left"):(0>o||0>s)&&a.next(0>o?"up":"right"),e.preventDefault())}))},trigger:function(e,t){var n,s=t||a.coming||a.current;if(s){if(i.isFunction(s[e])&&(n=s[e].apply(s,Array.prototype.slice.call(arguments,1))),!1===n)return!1;s.helpers&&i.each(s.helpers,function(t,n){n&&a.helpers[t]&&i.isFunction(a.helpers[t][e])&&(n=i.extend(!0,{},a.helpers[t].defaults,n),a.helpers[t][e](n,s))}),i.event.trigger(e+".fb")}},isImage:function(e){return u(e)&&e.match(/(^data:image\/.*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp)((\?|#).*)?$)/i)},isSWF:function(e){return u(e)&&e.match(/\.(swf)((\?|#).*)?$/i)},_start:function(e){var t,n,s={};if(e=p(e),t=a.group[e]||null,!t)return!1;if(s=i.extend(!0,{},a.opts,t),t=s.margin,n=s.padding,"number"===i.type(t)&&(s.margin=[t,t,t,t]),"number"===i.type(n)&&(s.padding=[n,n,n,n]),s.modal&&i.extend(!0,s,{closeBtn:!1,closeClick:!1,nextClick:!1,arrows:!1,mouseWheel:!1,keys:null,helpers:{overlay:{closeClick:!1}}}),s.autoSize&&(s.autoWidth=s.autoHeight=!0),"auto"===s.width&&(s.autoWidth=!0),"auto"===s.height&&(s.autoHeight=!0),s.group=a.group,s.index=e,a.coming=s,!1===a.trigger("beforeLoad"))a.coming=null;else{if(n=s.type,t=s.href,!n)return a.coming=null,a.current&&a.router&&"jumpto"!==a.router?(a.current.index=e,a[a.router](a.direction)):!1;if(a.isActive=!0,("image"===n||"swf"===n)&&(s.autoHeight=s.autoWidth=!1,s.scrolling="visible"),"image"===n&&(s.aspectRatio=!0),"iframe"===n&&c&&(s.scrolling="scroll"),s.wrap=i(s.tpl.wrap).addClass("fancybox-"+(c?"mobile":"desktop")+" fancybox-type-"+n+" fancybox-tmp "+s.wrapCSS).appendTo(s.parent||"body"),i.extend(s,{skin:i(".fancybox-skin",s.wrap),outer:i(".fancybox-outer",s.wrap),inner:i(".fancybox-inner",s.wrap)}),i.each(["Top","Right","Bottom","Left"],function(e,t){s.skin.css("padding"+t,f(s.padding[e]))}),a.trigger("onReady"),"inline"===n||"html"===n){if(!s.content||!s.content.length)return a._error("content")}else if(!t)return a._error("href");"image"===n?a._loadImage():"ajax"===n?a._loadAjax():"iframe"===n?a._loadIframe():a._afterLoad()}},_error:function(e){i.extend(a.coming,{type:"html",autoWidth:!0,autoHeight:!0,minWidth:0,minHeight:0,scrolling:"no",hasError:e,content:a.coming.tpl.error}),a._afterLoad()},_loadImage:function(){var e=a.imgPreload=new Image;e.onload=function(){this.onload=this.onerror=null,a.coming.width=this.width,a.coming.height=this.height,a._afterLoad()},e.onerror=function(){this.onload=this.onerror=null,a._error("image")},e.src=a.coming.href,!0!==e.complete&&a.showLoading()},_loadAjax:function(){var e=a.coming;a.showLoading(),a.ajaxLoad=i.ajax(i.extend({},e.ajax,{url:e.href,error:function(e,t){a.coming&&"abort"!==t?a._error("ajax",e):a.hideLoading()},success:function(t,i){"success"===i&&(e.content=t,a._afterLoad())}}))},_loadIframe:function(){var e=a.coming,t=i(e.tpl.iframe.replace(/\{rnd\}/g,(new Date).getTime())).attr("scrolling",c?"auto":e.iframe.scrolling).attr("src",e.href);i(e.wrap).bind("onReset",function(){try{i(this).find("iframe").hide().attr("src","//about:blank").end().empty()}catch(e){}}),e.iframe.preload&&(a.showLoading(),t.one("load",function(){i(this).data("ready",1),c||i(this).bind("load.fb",a.update),i(this).parents(".fancybox-wrap").width("100%").removeClass("fancybox-tmp").show(),a._afterLoad()})),e.content=t.appendTo(e.inner),e.iframe.preload||a._afterLoad()},_preloadImages:function(){var e,t,i=a.group,n=a.current,s=i.length,o=n.preload?Math.min(n.preload,s-1):0;for(t=1;o>=t;t+=1)e=i[(n.index+t)%s],"image"===e.type&&e.href&&((new Image).src=e.href)},_afterLoad:function(){var e,t,n,s,o,r=a.coming,l=a.current;if(a.hideLoading(),r&&!1!==a.isActive)if(!1===a.trigger("afterLoad",r,l))r.wrap.stop(!0).trigger("onReset").remove(),a.coming=null;else{switch(l&&(a.trigger("beforeChange",l),l.wrap.stop(!0).removeClass("fancybox-opened").find(".fancybox-item, .fancybox-nav").remove()),a.unbindEvents(),e=r.content,t=r.type,n=r.scrolling,i.extend(a,{wrap:r.wrap,skin:r.skin,outer:r.outer,inner:r.inner,current:r,previous:l}),s=r.href,t){case"inline":case"ajax":case"html":r.selector?e=i("<div>").html(e).find(r.selector):h(e)&&(e.data("fancybox-placeholder")||e.data("fancybox-placeholder",i('<div class="fancybox-placeholder"></div>').insertAfter(e).hide()),e=e.show().detach(),r.wrap.bind("onReset",function(){i(this).find(e).length&&e.hide().replaceAll(e.data("fancybox-placeholder")).data("fancybox-placeholder",!1)}));break;case"image":e=r.tpl.image.replace("{href}",s);break;case"swf":e='<object id="fancybox-swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="movie" value="'+s+'"></param>',o="",i.each(r.swf,function(t,i){e+='<param name="'+t+'" value="'+i+'"></param>',o+=" "+t+'="'+i+'"'}),e+='<embed src="'+s+'" type="application/x-shockwave-flash" width="100%" height="100%"'+o+"></embed></object>"}(!h(e)||!e.parent().is(r.inner))&&r.inner.append(e),a.trigger("beforeShow"),r.inner.css("overflow","yes"===n?"scroll":"no"===n?"hidden":n),a._setDimension(),a.reposition(),a.isOpen=!1,a.coming=null,a.bindEvents(),a.isOpened?l.prevMethod&&a.transitions[l.prevMethod]():i(".fancybox-wrap").not(r.wrap).stop(!0).trigger("onReset").remove(),a.transitions[a.isOpened?r.nextMethod:r.openMethod](),a._preloadImages()}},_setDimension:function(){var e,t,n,s,o,r,l,c,h,u=a.getViewport(),g=0,m=!1,v=!1,m=a.wrap,y=a.skin,b=a.inner,_=a.current,v=_.width,w=_.height,x=_.minWidth,k=_.minHeight,C=_.maxWidth,T=_.maxHeight,A=_.scrolling,D=_.scrollOutside?_.scrollbarWidth:0,E=_.margin,S=p(E[1]+E[3]),P=p(E[0]+E[2]);if(m.add(y).add(b).width("auto").height("auto").removeClass("fancybox-tmp"),E=p(y.outerWidth(!0)-y.width()),e=p(y.outerHeight(!0)-y.height()),t=S+E,n=P+e,s=d(v)?(u.w-t)*p(v)/100:v,o=d(w)?(u.h-n)*p(w)/100:w,"iframe"===_.type){if(h=_.content,_.autoHeight&&1===h.data("ready"))try{h[0].contentWindow.document.location&&(b.width(s).height(9999),r=h.contents().find("body"),D&&r.css("overflow-x","hidden"),o=r.height())}catch(I){}}else(_.autoWidth||_.autoHeight)&&(b.addClass("fancybox-tmp"),_.autoWidth||b.width(s),_.autoHeight||b.height(o),_.autoWidth&&(s=b.width()),_.autoHeight&&(o=b.height()),b.removeClass("fancybox-tmp"));if(v=p(s),w=p(o),c=s/o,x=p(d(x)?p(x,"w")-t:x),C=p(d(C)?p(C,"w")-t:C),k=p(d(k)?p(k,"h")-n:k),T=p(d(T)?p(T,"h")-n:T),r=C,l=T,_.fitToView&&(C=Math.min(u.w-t,C),T=Math.min(u.h-n,T)),t=u.w-S,P=u.h-P,_.aspectRatio?(v>C&&(v=C,w=p(v/c)),w>T&&(w=T,v=p(w*c)),x>v&&(v=x,w=p(v/c)),k>w&&(w=k,v=p(w*c))):(v=Math.max(x,Math.min(v,C)),_.autoHeight&&"iframe"!==_.type&&(b.width(v),w=b.height()),w=Math.max(k,Math.min(w,T))),_.fitToView)if(b.width(v).height(w),m.width(v+E),u=m.width(),S=m.height(),_.aspectRatio)for(;(u>t||S>P)&&v>x&&w>k&&!(g++>19);)w=Math.max(k,Math.min(T,w-10)),v=p(w*c),x>v&&(v=x,w=p(v/c)),v>C&&(v=C,w=p(v/c)),b.width(v).height(w),m.width(v+E),u=m.width(),S=m.height();else v=Math.max(x,Math.min(v,v-(u-t))),w=Math.max(k,Math.min(w,w-(S-P)));D&&"auto"===A&&o>w&&t>v+E+D&&(v+=D),b.width(v).height(w),m.width(v+E),u=m.width(),S=m.height(),m=(u>t||S>P)&&v>x&&w>k,v=_.aspectRatio?r>v&&l>w&&s>v&&o>w:(r>v||l>w)&&(s>v||o>w),i.extend(_,{dim:{width:f(u),height:f(S)},origWidth:s,origHeight:o,canShrink:m,canExpand:v,wPadding:E,hPadding:e,wrapSpace:S-y.outerHeight(!0),skinSpace:y.height()-w}),!h&&_.autoHeight&&w>k&&T>w&&!v&&b.height("auto")},_getPosition:function(e){var t=a.current,i=a.getViewport(),n=t.margin,s=a.wrap.width()+n[1]+n[3],o=a.wrap.height()+n[0]+n[2],n={position:"absolute",top:n[0],left:n[3]};return t.autoCenter&&t.fixed&&!e&&i.h>=o&&i.w>=s?n.position="fixed":t.locked||(n.top+=i.y,n.left+=i.x),n.top=f(Math.max(n.top,n.top+(i.h-o)*t.topRatio)),n.left=f(Math.max(n.left,n.left+(i.w-s)*t.leftRatio)),n},_afterZoomIn:function(){var e=a.current;e&&(a.isOpen=a.isOpened=!0,a.wrap.css("overflow","visible").addClass("fancybox-opened"),a.update(),(e.closeClick||e.nextClick&&a.group.length>1)&&a.inner.css("cursor","pointer").bind("click.fb",function(t){!i(t.target).is("a")&&!i(t.target).parent().is("a")&&(t.preventDefault(),a[e.closeClick?"close":"next"]())}),e.closeBtn&&i(e.tpl.closeBtn).appendTo(a.skin).bind("click.fb",function(e){e.preventDefault(),a.close()}),e.arrows&&a.group.length>1&&((e.loop||e.index>0)&&i(e.tpl.prev).appendTo(a.outer).bind("click.fb",a.prev),(e.loop||e.index<a.group.length-1)&&i(e.tpl.next).appendTo(a.outer).bind("click.fb",a.next)),a.trigger("afterShow"),e.loop||e.index!==e.group.length-1?a.opts.autoPlay&&!a.player.isActive&&(a.opts.autoPlay=!1,a.play()):a.play(!1))},_afterZoomOut:function(e){e=e||a.current,i(".fancybox-wrap").trigger("onReset").remove(),i.extend(a,{group:{},opts:{},router:!1,current:null,isActive:!1,isOpened:!1,isOpen:!1,isClosing:!1,wrap:null,skin:null,outer:null,inner:null}),a.trigger("afterClose",e)}}),a.transitions={getOrigPosition:function(){var e=a.current,t=e.element,i=e.orig,n={},s=50,o=50,r=e.hPadding,l=e.wPadding,c=a.getViewport();return!i&&e.isDom&&t.is(":visible")&&(i=t.find("img:first"),i.length||(i=t)),h(i)?(n=i.offset(),i.is("img")&&(s=i.outerWidth(),o=i.outerHeight())):(n.top=c.y+(c.h-o)*e.topRatio,n.left=c.x+(c.w-s)*e.leftRatio),("fixed"===a.wrap.css("position")||e.locked)&&(n.top-=c.y,n.left-=c.x),n={top:f(n.top-r*e.topRatio),left:f(n.left-l*e.leftRatio),width:f(s+l),height:f(o+r)}},step:function(e,t){var i,n,s=t.prop;n=a.current;var o=n.wrapSpace,r=n.skinSpace;("width"===s||"height"===s)&&(i=t.end===t.start?1:(e-t.start)/(t.end-t.start),a.isClosing&&(i=1-i),n="width"===s?n.wPadding:n.hPadding,n=e-n,a.skin[s](p("width"===s?n:n-o*i)),a.inner[s](p("width"===s?n:n-o*i-r*i)))},zoomIn:function(){var e=a.current,t=e.pos,n=e.openEffect,s="elastic"===n,o=i.extend({opacity:1},t);delete o.position,s?(t=this.getOrigPosition(),e.openOpacity&&(t.opacity=.1)):"fade"===n&&(t.opacity=.1),a.wrap.css(t).animate(o,{duration:"none"===n?0:e.openSpeed,easing:e.openEasing,step:s?this.step:null,complete:a._afterZoomIn})},zoomOut:function(){var e=a.current,t=e.closeEffect,i="elastic"===t,n={opacity:.1};i&&(n=this.getOrigPosition(),e.closeOpacity&&(n.opacity=.1)),a.wrap.animate(n,{duration:"none"===t?0:e.closeSpeed,easing:e.closeEasing,step:i?this.step:null,complete:a._afterZoomOut})},changeIn:function(){var e,t=a.current,i=t.nextEffect,n=t.pos,s={opacity:1},o=a.direction;n.opacity=.1,"elastic"===i&&(e="down"===o||"up"===o?"top":"left","down"===o||"right"===o?(n[e]=f(p(n[e])-200),s[e]="+=200px"):(n[e]=f(p(n[e])+200),s[e]="-=200px")),"none"===i?a._afterZoomIn():a.wrap.css(n).animate(s,{duration:t.nextSpeed,easing:t.nextEasing,complete:a._afterZoomIn})},changeOut:function(){var e=a.previous,t=e.prevEffect,n={opacity:.1},s=a.direction;"elastic"===t&&(n["down"===s||"up"===s?"top":"left"]=("up"===s||"left"===s?"-":"+")+"=200px"),e.wrap.animate(n,{duration:"none"===t?0:e.prevSpeed,easing:e.prevEasing,complete:function(){i(this).trigger("onReset").remove()}})}},a.helpers.overlay={defaults:{closeClick:!0,speedOut:200,showEarly:!0,css:{},locked:!c,fixed:!0},overlay:null,fixed:!1,create:function(e){e=i.extend({},this.defaults,e),this.overlay&&this.close(),this.overlay=i('<div class="fancybox-overlay"></div>').appendTo("body"),this.fixed=!1,e.fixed&&a.defaults.fixed&&(this.overlay.addClass("fancybox-overlay-fixed"),this.fixed=!0)},open:function(e){var t=this;e=i.extend({},this.defaults,e),this.overlay?this.overlay.unbind(".overlay").width("auto").height("auto"):this.create(e),this.fixed||(s.bind("resize.overlay",i.proxy(this.update,this)),this.update()),e.closeClick&&this.overlay.bind("click.overlay",function(e){i(e.target).hasClass("fancybox-overlay")&&(a.isActive?a.close():t.close())}),this.overlay.css(e.css).show()},close:function(){i(".fancybox-overlay").remove(),s.unbind("resize.overlay"),this.overlay=null,!1!==this.margin&&(i("body").css("margin-right",this.margin),this.margin=!1),this.el&&this.el.removeClass("fancybox-lock")},update:function(){var e,i="100%";this.overlay.width(i).height("100%"),r?(e=Math.max(t.documentElement.offsetWidth,t.body.offsetWidth),o.width()>e&&(i=o.width())):o.width()>s.width()&&(i=o.width()),this.overlay.width(i).height(o.height())},onReady:function(e,n){i(".fancybox-overlay").stop(!0,!0),this.overlay||(this.margin=o.height()>s.height()||"scroll"===i("body").css("overflow-y")?i("body").css("margin-right"):!1,this.el=t.all&&!t.querySelector?i("html"):i("body"),this.create(e)),e.locked&&this.fixed&&(n.locked=this.overlay.append(n.wrap),n.fixed=!1),!0===e.showEarly&&this.beforeShow.apply(this,arguments)},beforeShow:function(e,t){t.locked&&(this.el.addClass("fancybox-lock"),!1!==this.margin&&i("body").css("margin-right",p(this.margin)+t.scrollbarWidth)),this.open(e)},onUpdate:function(){this.fixed||this.update()},afterClose:function(e){this.overlay&&!a.isActive&&this.overlay.fadeOut(e.speedOut,i.proxy(this.close,this))}},a.helpers.title={defaults:{type:"float",position:"bottom"},beforeShow:function(e){var t=a.current,n=t.title,s=e.type;if(i.isFunction(n)&&(n=n.call(t.element,t)),u(n)&&""!==i.trim(n)){switch(t=i('<div class="fancybox-title fancybox-title-'+s+'-wrap">'+n+"</div>"),s){case"inside":s=a.skin;break;case"outside":s=a.wrap;break;case"over":s=a.inner;break;default:s=a.skin,t.appendTo("body"),r&&t.width(t.width()),t.wrapInner('<span class="child"></span>'),a.current.margin[2]+=Math.abs(p(t.css("margin-bottom")))}t["top"===e.position?"prependTo":"appendTo"](s)}}},i.fn.fancybox=function(e){var t,n=i(this),s=this.selector||"",r=function(o){var r,l,c=i(this).blur(),h=t;!(o.ctrlKey||o.altKey||o.shiftKey||o.metaKey||c.is(".fancybox-wrap")||(r=e.groupAttr||"data-fancybox-group",l=c.attr(r),l||(r="rel",l=c.get(0)[r]),l&&""!==l&&"nofollow"!==l&&(c=s.length?i(s):n,c=c.filter("["+r+'="'+l+'"]'),h=c.index(this)),e.index=h,!1===a.open(c,e)||!o.preventDefault()))};return e=e||{},t=e.index||0,s&&!1!==e.live?o.undelegate(s,"click.fb-start").delegate(s+":not('.fancybox-item, .fancybox-nav')","click.fb-start",r):n.unbind("click.fb-start").bind("click.fb-start",r),this.filter("[data-fancybox-start=1]").trigger("click"),this},o.ready(function(){if(i.scrollbarWidth===n&&(i.scrollbarWidth=function(){var e=i('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body"),t=e.children(),t=t.innerWidth()-t.height(99).innerWidth();return e.remove(),t}),i.support.fixedPosition===n){var e=i.support,t=i('<div style="position:fixed;top:20px;"></div>').appendTo("body"),s=20===t[0].offsetTop||15===t[0].offsetTop;t.remove(),e.fixedPosition=s}i.extend(a.defaults,{scrollbarWidth:i.scrollbarWidth(),fixed:i.support.fixedPosition,parent:i("body")})})})(window,document,jQuery);