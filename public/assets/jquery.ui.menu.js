/*!
 * jQuery UI Core 1.10.0
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/category/ui-core/
 */
(function(t,e){function i(e,i){var s,o,a,r=e.nodeName.toLowerCase();return"area"===r?(s=e.parentNode,o=s.name,e.href&&o&&"map"===s.nodeName.toLowerCase()?(a=t("img[usemap=#"+o+"]")[0],!!a&&n(a)):!1):(/input|select|textarea|button|object/.test(r)?!e.disabled:"a"===r?e.href||i:i)&&n(e)}function n(e){return t.expr.filters.visible(e)&&!t(e).parents().addBack().filter(function(){return"hidden"===t.css(this,"visibility")}).length}var s=0,o=/^ui-id-\d+$/;t.ui=t.ui||{},t.ui.version||(t.extend(t.ui,{version:"1.10.0",keyCode:{BACKSPACE:8,COMMA:188,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,NUMPAD_ADD:107,NUMPAD_DECIMAL:110,NUMPAD_DIVIDE:111,NUMPAD_ENTER:108,NUMPAD_MULTIPLY:106,NUMPAD_SUBTRACT:109,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SPACE:32,TAB:9,UP:38}}),t.fn.extend({_focus:t.fn.focus,focus:function(e,i){return"number"==typeof e?this.each(function(){var n=this;setTimeout(function(){t(n).focus(),i&&i.call(n)},e)}):this._focus.apply(this,arguments)},scrollParent:function(){var e;return e=t.ui.ie&&/(static|relative)/.test(this.css("position"))||/absolute/.test(this.css("position"))?this.parents().filter(function(){return/(relative|absolute|fixed)/.test(t.css(this,"position"))&&/(auto|scroll)/.test(t.css(this,"overflow")+t.css(this,"overflow-y")+t.css(this,"overflow-x"))}).eq(0):this.parents().filter(function(){return/(auto|scroll)/.test(t.css(this,"overflow")+t.css(this,"overflow-y")+t.css(this,"overflow-x"))}).eq(0),/fixed/.test(this.css("position"))||!e.length?t(document):e},zIndex:function(i){if(i!==e)return this.css("zIndex",i);if(this.length)for(var n,s,o=t(this[0]);o.length&&o[0]!==document;){if(n=o.css("position"),("absolute"===n||"relative"===n||"fixed"===n)&&(s=parseInt(o.css("zIndex"),10),!isNaN(s)&&0!==s))return s;o=o.parent()}return 0},uniqueId:function(){return this.each(function(){this.id||(this.id="ui-id-"+ ++s)})},removeUniqueId:function(){return this.each(function(){o.test(this.id)&&t(this).removeAttr("id")})}}),t.extend(t.expr[":"],{data:t.expr.createPseudo?t.expr.createPseudo(function(e){return function(i){return!!t.data(i,e)}}):function(e,i,n){return!!t.data(e,n[3])},focusable:function(e){return i(e,!isNaN(t.attr(e,"tabindex")))},tabbable:function(e){var n=t.attr(e,"tabindex"),s=isNaN(n);return(s||n>=0)&&i(e,!s)}}),t("<a>").outerWidth(1).jquery||t.each(["Width","Height"],function(i,n){function s(e,i,n,s){return t.each(o,function(){i-=parseFloat(t.css(e,"padding"+this))||0,n&&(i-=parseFloat(t.css(e,"border"+this+"Width"))||0),s&&(i-=parseFloat(t.css(e,"margin"+this))||0)}),i}var o="Width"===n?["Left","Right"]:["Top","Bottom"],a=n.toLowerCase(),r={innerWidth:t.fn.innerWidth,innerHeight:t.fn.innerHeight,outerWidth:t.fn.outerWidth,outerHeight:t.fn.outerHeight};t.fn["inner"+n]=function(i){return i===e?r["inner"+n].call(this):this.each(function(){t(this).css(a,s(this,i)+"px")})},t.fn["outer"+n]=function(e,i){return"number"!=typeof e?r["outer"+n].call(this,e):this.each(function(){t(this).css(a,s(this,e,!0,i)+"px")})}}),t.fn.addBack||(t.fn.addBack=function(t){return this.add(null==t?this.prevObject:this.prevObject.filter(t))}),t("<a>").data("a-b","a").removeData("a-b").data("a-b")&&(t.fn.removeData=function(e){return function(i){return arguments.length?e.call(this,t.camelCase(i)):e.call(this)}}(t.fn.removeData)),t.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase()),t.support.selectstart="onselectstart"in document.createElement("div"),t.fn.extend({disableSelection:function(){return this.bind((t.support.selectstart?"selectstart":"mousedown")+".ui-disableSelection",function(t){t.preventDefault()})},enableSelection:function(){return this.unbind(".ui-disableSelection")}}),t.extend(t.ui,{plugin:{add:function(e,i,n){var s,o=t.ui[e].prototype;for(s in n)o.plugins[s]=o.plugins[s]||[],o.plugins[s].push([i,n[s]])},call:function(t,e,i){var n,s=t.plugins[e];if(s&&t.element[0].parentNode&&11!==t.element[0].parentNode.nodeType)for(n=0;s.length>n;n++)t.options[s[n][0]]&&s[n][1].apply(t.element,i)}},hasScroll:function(e,i){if("hidden"===t(e).css("overflow"))return!1;var n=i&&"left"===i?"scrollLeft":"scrollTop",s=!1;return e[n]>0?!0:(e[n]=1,s=e[n]>0,e[n]=0,s)}}))})(jQuery),/*!
 * jQuery UI Widget 1.10.0
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/jQuery.widget/
 */
function(t,e){var i=0,n=Array.prototype.slice,s=t.cleanData;t.cleanData=function(e){for(var i,n=0;null!=(i=e[n]);n++)try{t(i).triggerHandler("remove")}catch(o){}s(e)},t.widget=function(e,i,n){var s,o,a,r,l={},c=e.split(".")[0];e=e.split(".")[1],s=c+"-"+e,n||(n=i,i=t.Widget),t.expr[":"][s.toLowerCase()]=function(e){return!!t.data(e,s)},t[c]=t[c]||{},o=t[c][e],a=t[c][e]=function(t,e){return this._createWidget?(arguments.length&&this._createWidget(t,e),void 0):new a(t,e)},t.extend(a,o,{version:n.version,_proto:t.extend({},n),_childConstructors:[]}),r=new i,r.options=t.widget.extend({},r.options),t.each(n,function(e,n){return t.isFunction(n)?(l[e]=function(){var t=function(){return i.prototype[e].apply(this,arguments)},s=function(t){return i.prototype[e].apply(this,t)};return function(){var e,i=this._super,o=this._superApply;return this._super=t,this._superApply=s,e=n.apply(this,arguments),this._super=i,this._superApply=o,e}}(),void 0):(l[e]=n,void 0)}),a.prototype=t.widget.extend(r,{widgetEventPrefix:o?r.widgetEventPrefix:e},l,{constructor:a,namespace:c,widgetName:e,widgetFullName:s}),o?(t.each(o._childConstructors,function(e,i){var n=i.prototype;t.widget(n.namespace+"."+n.widgetName,a,i._proto)}),delete o._childConstructors):i._childConstructors.push(a),t.widget.bridge(e,a)},t.widget.extend=function(i){for(var s,o,a=n.call(arguments,1),r=0,l=a.length;l>r;r++)for(s in a[r])o=a[r][s],a[r].hasOwnProperty(s)&&o!==e&&(i[s]=t.isPlainObject(o)?t.isPlainObject(i[s])?t.widget.extend({},i[s],o):t.widget.extend({},o):o);return i},t.widget.bridge=function(i,s){var o=s.prototype.widgetFullName||i;t.fn[i]=function(a){var r="string"==typeof a,l=n.call(arguments,1),c=this;return a=!r&&l.length?t.widget.extend.apply(null,[a].concat(l)):a,r?this.each(function(){var n,s=t.data(this,o);return s?t.isFunction(s[a])&&"_"!==a.charAt(0)?(n=s[a].apply(s,l),n!==s&&n!==e?(c=n&&n.jquery?c.pushStack(n.get()):n,!1):void 0):t.error("no such method '"+a+"' for "+i+" widget instance"):t.error("cannot call methods on "+i+" prior to initialization; "+"attempted to call method '"+a+"'")}):this.each(function(){var e=t.data(this,o);e?e.option(a||{})._init():t.data(this,o,new s(a,this))}),c}},t.Widget=function(){},t.Widget._childConstructors=[],t.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:!1,create:null},_createWidget:function(e,n){n=t(n||this.defaultElement||this)[0],this.element=t(n),this.uuid=i++,this.eventNamespace="."+this.widgetName+this.uuid,this.options=t.widget.extend({},this.options,this._getCreateOptions(),e),this.bindings=t(),this.hoverable=t(),this.focusable=t(),n!==this&&(t.data(n,this.widgetFullName,this),this._on(!0,this.element,{remove:function(t){t.target===n&&this.destroy()}}),this.document=t(n.style?n.ownerDocument:n.document||n),this.window=t(this.document[0].defaultView||this.document[0].parentWindow)),this._create(),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:t.noop,_getCreateEventData:t.noop,_create:t.noop,_init:t.noop,destroy:function(){this._destroy(),this.element.unbind(this.eventNamespace).removeData(this.widgetName).removeData(this.widgetFullName).removeData(t.camelCase(this.widgetFullName)),this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled "+"ui-state-disabled"),this.bindings.unbind(this.eventNamespace),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")},_destroy:t.noop,widget:function(){return this.element},option:function(i,n){var s,o,a,r=i;if(0===arguments.length)return t.widget.extend({},this.options);if("string"==typeof i)if(r={},s=i.split("."),i=s.shift(),s.length){for(o=r[i]=t.widget.extend({},this.options[i]),a=0;s.length-1>a;a++)o[s[a]]=o[s[a]]||{},o=o[s[a]];if(i=s.pop(),n===e)return o[i]===e?null:o[i];o[i]=n}else{if(n===e)return this.options[i]===e?null:this.options[i];r[i]=n}return this._setOptions(r),this},_setOptions:function(t){var e;for(e in t)this._setOption(e,t[e]);return this},_setOption:function(t,e){return this.options[t]=e,"disabled"===t&&(this.widget().toggleClass(this.widgetFullName+"-disabled ui-state-disabled",!!e).attr("aria-disabled",e),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")),this},enable:function(){return this._setOption("disabled",!1)},disable:function(){return this._setOption("disabled",!0)},_on:function(e,i,n){var s,o=this;"boolean"!=typeof e&&(n=i,i=e,e=!1),n?(i=s=t(i),this.bindings=this.bindings.add(i)):(n=i,i=this.element,s=this.widget()),t.each(n,function(n,a){function r(){return e||o.options.disabled!==!0&&!t(this).hasClass("ui-state-disabled")?("string"==typeof a?o[a]:a).apply(o,arguments):void 0}"string"!=typeof a&&(r.guid=a.guid=a.guid||r.guid||t.guid++);var l=n.match(/^(\w+)\s*(.*)$/),c=l[1]+o.eventNamespace,h=l[2];h?s.delegate(h,c,r):i.bind(c,r)})},_off:function(t,e){e=(e||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,t.unbind(e).undelegate(e)},_delay:function(t,e){function i(){return("string"==typeof t?n[t]:t).apply(n,arguments)}var n=this;return setTimeout(i,e||0)},_hoverable:function(e){this.hoverable=this.hoverable.add(e),this._on(e,{mouseenter:function(e){t(e.currentTarget).addClass("ui-state-hover")},mouseleave:function(e){t(e.currentTarget).removeClass("ui-state-hover")}})},_focusable:function(e){this.focusable=this.focusable.add(e),this._on(e,{focusin:function(e){t(e.currentTarget).addClass("ui-state-focus")},focusout:function(e){t(e.currentTarget).removeClass("ui-state-focus")}})},_trigger:function(e,i,n){var s,o,a=this.options[e];if(n=n||{},i=t.Event(i),i.type=(e===this.widgetEventPrefix?e:this.widgetEventPrefix+e).toLowerCase(),i.target=this.element[0],o=i.originalEvent)for(s in o)s in i||(i[s]=o[s]);return this.element.trigger(i,n),!(t.isFunction(a)&&a.apply(this.element[0],[i].concat(n))===!1||i.isDefaultPrevented())}},t.each({show:"fadeIn",hide:"fadeOut"},function(e,i){t.Widget.prototype["_"+e]=function(n,s,o){"string"==typeof s&&(s={effect:s});var a,r=s?s===!0||"number"==typeof s?i:s.effect||i:e;s=s||{},"number"==typeof s&&(s={duration:s}),a=!t.isEmptyObject(s),s.complete=o,s.delay&&n.delay(s.delay),a&&t.effects&&t.effects.effect[r]?n[e](s):r!==e&&n[r]?n[r](s.duration,s.easing,o):n.queue(function(i){t(this)[e](),o&&o.call(n[0]),i()})}})}(jQuery),/*!
 * jQuery UI Position 1.10.0
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/position/
 */
function(t,e){function i(t,e,i){return[parseInt(t[0],10)*(p.test(t[0])?e/100:1),parseInt(t[1],10)*(p.test(t[1])?i/100:1)]}function n(e,i){return parseInt(t.css(e,i),10)||0}function s(e){var i=e[0];return 9===i.nodeType?{width:e.width(),height:e.height(),offset:{top:0,left:0}}:t.isWindow(i)?{width:e.width(),height:e.height(),offset:{top:e.scrollTop(),left:e.scrollLeft()}}:i.preventDefault?{width:0,height:0,offset:{top:i.pageY,left:i.pageX}}:{width:e.outerWidth(),height:e.outerHeight(),offset:e.offset()}}t.ui=t.ui||{};var o,a=Math.max,r=Math.abs,l=Math.round,c=/left|center|right/,h=/top|center|bottom/,u=/[\+\-]\d+%?/,d=/^\w+/,p=/%$/,f=t.fn.position;t.position={scrollbarWidth:function(){if(o!==e)return o;var i,n,s=t("<div style='display:block;width:50px;height:50px;overflow:hidden;'><div style='height:100px;width:auto;'></div></div>"),a=s.children()[0];return t("body").append(s),i=a.offsetWidth,s.css("overflow","scroll"),n=a.offsetWidth,i===n&&(n=s[0].clientWidth),s.remove(),o=i-n},getScrollInfo:function(e){var i=e.isWindow?"":e.element.css("overflow-x"),n=e.isWindow?"":e.element.css("overflow-y"),s="scroll"===i||"auto"===i&&e.width<e.element[0].scrollWidth,o="scroll"===n||"auto"===n&&e.height<e.element[0].scrollHeight;return{width:s?t.position.scrollbarWidth():0,height:o?t.position.scrollbarWidth():0}},getWithinInfo:function(e){var i=t(e||window),n=t.isWindow(i[0]);return{element:i,isWindow:n,offset:i.offset()||{left:0,top:0},scrollLeft:i.scrollLeft(),scrollTop:i.scrollTop(),width:n?i.width():i.outerWidth(),height:n?i.height():i.outerHeight()}}},t.fn.position=function(e){if(!e||!e.of)return f.apply(this,arguments);e=t.extend({},e);var o,p,m,g,v,y,b=t(e.of),_=t.position.getWithinInfo(e.within),w=t.position.getScrollInfo(_),x=(e.collision||"flip").split(" "),k={};return y=s(b),b[0].preventDefault&&(e.at="left top"),p=y.width,m=y.height,g=y.offset,v=t.extend({},g),t.each(["my","at"],function(){var t,i,n=(e[this]||"").split(" ");1===n.length&&(n=c.test(n[0])?n.concat(["center"]):h.test(n[0])?["center"].concat(n):["center","center"]),n[0]=c.test(n[0])?n[0]:"center",n[1]=h.test(n[1])?n[1]:"center",t=u.exec(n[0]),i=u.exec(n[1]),k[this]=[t?t[0]:0,i?i[0]:0],e[this]=[d.exec(n[0])[0],d.exec(n[1])[0]]}),1===x.length&&(x[1]=x[0]),"right"===e.at[0]?v.left+=p:"center"===e.at[0]&&(v.left+=p/2),"bottom"===e.at[1]?v.top+=m:"center"===e.at[1]&&(v.top+=m/2),o=i(k.at,p,m),v.left+=o[0],v.top+=o[1],this.each(function(){var s,c,h=t(this),u=h.outerWidth(),d=h.outerHeight(),f=n(this,"marginLeft"),y=n(this,"marginTop"),C=u+f+n(this,"marginRight")+w.width,T=d+y+n(this,"marginBottom")+w.height,D=t.extend({},v),S=i(k.my,h.outerWidth(),h.outerHeight());"right"===e.my[0]?D.left-=u:"center"===e.my[0]&&(D.left-=u/2),"bottom"===e.my[1]?D.top-=d:"center"===e.my[1]&&(D.top-=d/2),D.left+=S[0],D.top+=S[1],t.support.offsetFractions||(D.left=l(D.left),D.top=l(D.top)),s={marginLeft:f,marginTop:y},t.each(["left","top"],function(i,n){t.ui.position[x[i]]&&t.ui.position[x[i]][n](D,{targetWidth:p,targetHeight:m,elemWidth:u,elemHeight:d,collisionPosition:s,collisionWidth:C,collisionHeight:T,offset:[o[0]+S[0],o[1]+S[1]],my:e.my,at:e.at,within:_,elem:h})}),e.using&&(c=function(t){var i=g.left-D.left,n=i+p-u,s=g.top-D.top,o=s+m-d,l={target:{element:b,left:g.left,top:g.top,width:p,height:m},element:{element:h,left:D.left,top:D.top,width:u,height:d},horizontal:0>n?"left":i>0?"right":"center",vertical:0>o?"top":s>0?"bottom":"middle"};u>p&&p>r(i+n)&&(l.horizontal="center"),d>m&&m>r(s+o)&&(l.vertical="middle"),l.important=a(r(i),r(n))>a(r(s),r(o))?"horizontal":"vertical",e.using.call(this,t,l)}),h.offset(t.extend(D,{using:c}))})},t.ui.position={fit:{left:function(t,e){var i,n=e.within,s=n.isWindow?n.scrollLeft:n.offset.left,o=n.width,r=t.left-e.collisionPosition.marginLeft,l=s-r,c=r+e.collisionWidth-o-s;e.collisionWidth>o?l>0&&0>=c?(i=t.left+l+e.collisionWidth-o-s,t.left+=l-i):t.left=c>0&&0>=l?s:l>c?s+o-e.collisionWidth:s:l>0?t.left+=l:c>0?t.left-=c:t.left=a(t.left-r,t.left)},top:function(t,e){var i,n=e.within,s=n.isWindow?n.scrollTop:n.offset.top,o=e.within.height,r=t.top-e.collisionPosition.marginTop,l=s-r,c=r+e.collisionHeight-o-s;e.collisionHeight>o?l>0&&0>=c?(i=t.top+l+e.collisionHeight-o-s,t.top+=l-i):t.top=c>0&&0>=l?s:l>c?s+o-e.collisionHeight:s:l>0?t.top+=l:c>0?t.top-=c:t.top=a(t.top-r,t.top)}},flip:{left:function(t,e){var i,n,s=e.within,o=s.offset.left+s.scrollLeft,a=s.width,l=s.isWindow?s.scrollLeft:s.offset.left,c=t.left-e.collisionPosition.marginLeft,h=c-l,u=c+e.collisionWidth-a-l,d="left"===e.my[0]?-e.elemWidth:"right"===e.my[0]?e.elemWidth:0,p="left"===e.at[0]?e.targetWidth:"right"===e.at[0]?-e.targetWidth:0,f=-2*e.offset[0];0>h?(i=t.left+d+p+f+e.collisionWidth-a-o,(0>i||r(h)>i)&&(t.left+=d+p+f)):u>0&&(n=t.left-e.collisionPosition.marginLeft+d+p+f-l,(n>0||u>r(n))&&(t.left+=d+p+f))},top:function(t,e){var i,n,s=e.within,o=s.offset.top+s.scrollTop,a=s.height,l=s.isWindow?s.scrollTop:s.offset.top,c=t.top-e.collisionPosition.marginTop,h=c-l,u=c+e.collisionHeight-a-l,d="top"===e.my[1],p=d?-e.elemHeight:"bottom"===e.my[1]?e.elemHeight:0,f="top"===e.at[1]?e.targetHeight:"bottom"===e.at[1]?-e.targetHeight:0,m=-2*e.offset[1];0>h?(n=t.top+p+f+m+e.collisionHeight-a-o,t.top+p+f+m>h&&(0>n||r(h)>n)&&(t.top+=p+f+m)):u>0&&(i=t.top-e.collisionPosition.marginTop+p+f+m-l,t.top+p+f+m>u&&(i>0||u>r(i))&&(t.top+=p+f+m))}},flipfit:{left:function(){t.ui.position.flip.left.apply(this,arguments),t.ui.position.fit.left.apply(this,arguments)},top:function(){t.ui.position.flip.top.apply(this,arguments),t.ui.position.fit.top.apply(this,arguments)}}},function(){var e,i,n,s,o,a=document.getElementsByTagName("body")[0],r=document.createElement("div");e=document.createElement(a?"div":"body"),n={visibility:"hidden",width:0,height:0,border:0,margin:0,background:"none"},a&&t.extend(n,{position:"absolute",left:"-1000px",top:"-1000px"});for(o in n)e.style[o]=n[o];e.appendChild(r),i=a||document.documentElement,i.insertBefore(e,i.firstChild),r.style.cssText="position: absolute; left: 10.7432222px;",s=t(r).offset().left,t.support.offsetFractions=s>10&&11>s,e.innerHTML="",i.removeChild(e)}()}(jQuery),/*!
 * jQuery UI Menu 1.10.0
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/menu/
 *
 * Depends:
 *	jquery.ui.core.js
 *	jquery.ui.widget.js
 *	jquery.ui.position.js
 */
function(t){t.widget("ui.menu",{version:"1.10.0",defaultElement:"<ul>",delay:300,options:{icons:{submenu:"ui-icon-carat-1-e"},menus:"ul",position:{my:"left top",at:"right top"},role:"menu",blur:null,focus:null,select:null},_create:function(){this.activeMenu=this.element,this.mouseHandled=!1,this.element.uniqueId().addClass("ui-menu ui-widget ui-widget-content ui-corner-all").toggleClass("ui-menu-icons",!!this.element.find(".ui-icon").length).attr({role:this.options.role,tabIndex:0}).bind("click"+this.eventNamespace,t.proxy(function(t){this.options.disabled&&t.preventDefault()},this)),this.options.disabled&&this.element.addClass("ui-state-disabled").attr("aria-disabled","true"),this._on({"mousedown .ui-menu-item > a":function(t){t.preventDefault()},"click .ui-state-disabled > a":function(t){t.preventDefault()},"click .ui-menu-item:has(a)":function(e){var i=t(e.target).closest(".ui-menu-item");!this.mouseHandled&&i.not(".ui-state-disabled").length&&(this.mouseHandled=!0,this.select(e),i.has(".ui-menu").length?this.expand(e):this.element.is(":focus")||(this.element.trigger("focus",[!0]),this.active&&1===this.active.parents(".ui-menu").length&&clearTimeout(this.timer)))},"mouseenter .ui-menu-item":function(e){var i=t(e.currentTarget);i.siblings().children(".ui-state-active").removeClass("ui-state-active"),this.focus(e,i)},mouseleave:"collapseAll","mouseleave .ui-menu":"collapseAll",focus:function(t,e){var i=this.active||this.element.children(".ui-menu-item").eq(0);e||this.focus(t,i)},blur:function(e){this._delay(function(){t.contains(this.element[0],this.document[0].activeElement)||this.collapseAll(e)})},keydown:"_keydown"}),this.refresh(),this._on(this.document,{click:function(e){t(e.target).closest(".ui-menu").length||this.collapseAll(e),this.mouseHandled=!1}})},_destroy:function(){this.element.removeAttr("aria-activedescendant").find(".ui-menu").addBack().removeClass("ui-menu ui-widget ui-widget-content ui-corner-all ui-menu-icons").removeAttr("role").removeAttr("tabIndex").removeAttr("aria-labelledby").removeAttr("aria-expanded").removeAttr("aria-hidden").removeAttr("aria-disabled").removeUniqueId().show(),this.element.find(".ui-menu-item").removeClass("ui-menu-item").removeAttr("role").removeAttr("aria-disabled").children("a").removeUniqueId().removeClass("ui-corner-all ui-state-hover").removeAttr("tabIndex").removeAttr("role").removeAttr("aria-haspopup").children().each(function(){var e=t(this);e.data("ui-menu-submenu-carat")&&e.remove()}),this.element.find(".ui-menu-divider").removeClass("ui-menu-divider ui-widget-content")},_keydown:function(e){function i(t){return t.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&")}var n,s,o,a,r,l=!0;switch(e.keyCode){case t.ui.keyCode.PAGE_UP:this.previousPage(e);break;case t.ui.keyCode.PAGE_DOWN:this.nextPage(e);break;case t.ui.keyCode.HOME:this._move("first","first",e);break;case t.ui.keyCode.END:this._move("last","last",e);break;case t.ui.keyCode.UP:this.previous(e);break;case t.ui.keyCode.DOWN:this.next(e);break;case t.ui.keyCode.LEFT:this.collapse(e);break;case t.ui.keyCode.RIGHT:this.active&&!this.active.is(".ui-state-disabled")&&this.expand(e);break;case t.ui.keyCode.ENTER:case t.ui.keyCode.SPACE:this._activate(e);break;case t.ui.keyCode.ESCAPE:this.collapse(e);break;default:l=!1,s=this.previousFilter||"",o=String.fromCharCode(e.keyCode),a=!1,clearTimeout(this.filterTimer),o===s?a=!0:o=s+o,r=new RegExp("^"+i(o),"i"),n=this.activeMenu.children(".ui-menu-item").filter(function(){return r.test(t(this).children("a").text())}),n=a&&-1!==n.index(this.active.next())?this.active.nextAll(".ui-menu-item"):n,n.length||(o=String.fromCharCode(e.keyCode),r=new RegExp("^"+i(o),"i"),n=this.activeMenu.children(".ui-menu-item").filter(function(){return r.test(t(this).children("a").text())})),n.length?(this.focus(e,n),n.length>1?(this.previousFilter=o,this.filterTimer=this._delay(function(){delete this.previousFilter},1e3)):delete this.previousFilter):delete this.previousFilter}l&&e.preventDefault()},_activate:function(t){this.active.is(".ui-state-disabled")||(this.active.children("a[aria-haspopup='true']").length?this.expand(t):this.select(t))},refresh:function(){var e,i=this.options.icons.submenu,n=this.element.find(this.options.menus);n.filter(":not(.ui-menu)").addClass("ui-menu ui-widget ui-widget-content ui-corner-all").hide().attr({role:this.options.role,"aria-hidden":"true","aria-expanded":"false"}).each(function(){var e=t(this),n=e.prev("a"),s=t("<span>").addClass("ui-menu-icon ui-icon "+i).data("ui-menu-submenu-carat",!0);n.attr("aria-haspopup","true").prepend(s),e.attr("aria-labelledby",n.attr("id"))}),e=n.add(this.element),e.children(":not(.ui-menu-item):has(a)").addClass("ui-menu-item").attr("role","presentation").children("a").uniqueId().addClass("ui-corner-all").attr({tabIndex:-1,role:this._itemRole()}),e.children(":not(.ui-menu-item)").each(function(){var e=t(this);/[^\-—–\s]/.test(e.text())||e.addClass("ui-widget-content ui-menu-divider")}),e.children(".ui-state-disabled").attr("aria-disabled","true"),this.active&&!t.contains(this.element[0],this.active[0])&&this.blur()},_itemRole:function(){return{menu:"menuitem",listbox:"option"}[this.options.role]},_setOption:function(t,e){"icons"===t&&this.element.find(".ui-menu-icon").removeClass(this.options.icons.submenu).addClass(e.submenu),this._super(t,e)},focus:function(t,e){var i,n;this.blur(t,t&&"focus"===t.type),this._scrollIntoView(e),this.active=e.first(),n=this.active.children("a").addClass("ui-state-focus"),this.options.role&&this.element.attr("aria-activedescendant",n.attr("id")),this.active.parent().closest(".ui-menu-item").children("a:first").addClass("ui-state-active"),t&&"keydown"===t.type?this._close():this.timer=this._delay(function(){this._close()},this.delay),i=e.children(".ui-menu"),i.length&&/^mouse/.test(t.type)&&this._startOpening(i),this.activeMenu=e.parent(),this._trigger("focus",t,{item:e})},_scrollIntoView:function(e){var i,n,s,o,a,r;this._hasScroll()&&(i=parseFloat(t.css(this.activeMenu[0],"borderTopWidth"))||0,n=parseFloat(t.css(this.activeMenu[0],"paddingTop"))||0,s=e.offset().top-this.activeMenu.offset().top-i-n,o=this.activeMenu.scrollTop(),a=this.activeMenu.height(),r=e.height(),0>s?this.activeMenu.scrollTop(o+s):s+r>a&&this.activeMenu.scrollTop(o+s-a+r))},blur:function(t,e){e||clearTimeout(this.timer),this.active&&(this.active.children("a").removeClass("ui-state-focus"),this.active=null,this._trigger("blur",t,{item:this.active}))},_startOpening:function(t){clearTimeout(this.timer),"true"===t.attr("aria-hidden")&&(this.timer=this._delay(function(){this._close(),this._open(t)},this.delay))},_open:function(e){var i=t.extend({of:this.active},this.options.position);clearTimeout(this.timer),this.element.find(".ui-menu").not(e.parents(".ui-menu")).hide().attr("aria-hidden","true"),e.show().removeAttr("aria-hidden").attr("aria-expanded","true").position(i)},collapseAll:function(e,i){clearTimeout(this.timer),this.timer=this._delay(function(){var n=i?this.element:t(e&&e.target).closest(this.element.find(".ui-menu"));n.length||(n=this.element),this._close(n),this.blur(e),this.activeMenu=n},this.delay)},_close:function(t){t||(t=this.active?this.active.parent():this.element),t.find(".ui-menu").hide().attr("aria-hidden","true").attr("aria-expanded","false").end().find("a.ui-state-active").removeClass("ui-state-active")},collapse:function(t){var e=this.active&&this.active.parent().closest(".ui-menu-item",this.element);e&&e.length&&(this._close(),this.focus(t,e))},expand:function(t){var e=this.active&&this.active.children(".ui-menu ").children(".ui-menu-item").first();e&&e.length&&(this._open(e.parent()),this._delay(function(){this.focus(t,e)}))},next:function(t){this._move("next","first",t)},previous:function(t){this._move("prev","last",t)},isFirstItem:function(){return this.active&&!this.active.prevAll(".ui-menu-item").length},isLastItem:function(){return this.active&&!this.active.nextAll(".ui-menu-item").length},_move:function(t,e,i){var n;this.active&&(n="first"===t||"last"===t?this.active["first"===t?"prevAll":"nextAll"](".ui-menu-item").eq(-1):this.active[t+"All"](".ui-menu-item").eq(0)),n&&n.length&&this.active||(n=this.activeMenu.children(".ui-menu-item")[e]()),this.focus(i,n)},nextPage:function(e){var i,n,s;return this.active?(this.isLastItem()||(this._hasScroll()?(n=this.active.offset().top,s=this.element.height(),this.active.nextAll(".ui-menu-item").each(function(){return i=t(this),0>i.offset().top-n-s}),this.focus(e,i)):this.focus(e,this.activeMenu.children(".ui-menu-item")[this.active?"last":"first"]())),void 0):(this.next(e),void 0)},previousPage:function(e){var i,n,s;return this.active?(this.isFirstItem()||(this._hasScroll()?(n=this.active.offset().top,s=this.element.height(),this.active.prevAll(".ui-menu-item").each(function(){return i=t(this),i.offset().top-n+s>0}),this.focus(e,i)):this.focus(e,this.activeMenu.children(".ui-menu-item").first())),void 0):(this.next(e),void 0)},_hasScroll:function(){return this.element.outerHeight()<this.element.prop("scrollHeight")},select:function(e){this.active=this.active||t(e.target).closest(".ui-menu-item");var i={item:this.active};this.active.has(".ui-menu").length||this.collapseAll(e,!0),this._trigger("select",e,i)}})}(jQuery);