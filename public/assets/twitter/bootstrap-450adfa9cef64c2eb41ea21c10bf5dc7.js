/* ===================================================
 * bootstrap-transition.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#transitions
 * ===================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){"use strict";e(function(){e.support.transition=function(){var e=function(){var e,t=document.createElement("bootstrap"),i={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(e in i)if(void 0!==t.style[e])return i[e]}();return e&&{end:e}}()})}(window.jQuery),/* ==========================================================
 * bootstrap-alert.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#alerts
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){"use strict";var t='[data-dismiss="alert"]',i=function(i){e(i).on("click",t,this.close)};i.prototype.close=function(t){function i(){n.trigger("closed").remove()}var n,s=e(this),a=s.attr("data-target");a||(a=s.attr("href"),a=a&&a.replace(/.*(?=#[^\s]*$)/,"")),n=e(a),t&&t.preventDefault(),n.length||(n=s.hasClass("alert")?s:s.parent()),n.trigger(t=e.Event("close")),t.isDefaultPrevented()||(n.removeClass("in"),e.support.transition&&n.hasClass("fade")?n.on(e.support.transition.end,i):i())};var n=e.fn.alert;e.fn.alert=function(t){return this.each(function(){var n=e(this),s=n.data("alert");s||n.data("alert",s=new i(this)),"string"==typeof t&&s[t].call(n)})},e.fn.alert.Constructor=i,e.fn.alert.noConflict=function(){return e.fn.alert=n,this},e(document).on("click.alert.data-api",t,i.prototype.close)}(window.jQuery),/* =========================================================
 * bootstrap-modal.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#modals
 * =========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================= */
!function(e){"use strict";var t=function(t,i){this.options=i,this.$element=e(t).delegate('[data-dismiss="modal"]',"click.dismiss.modal",e.proxy(this.hide,this)),this.options.remote&&this.$element.find(".modal-body").load(this.options.remote)};t.prototype={constructor:t,toggle:function(){return this[this.isShown?"hide":"show"]()},show:function(){var t=this,i=e.Event("show");this.$element.trigger(i),this.isShown||i.isDefaultPrevented()||(this.isShown=!0,this.escape(),this.backdrop(function(){var i=e.support.transition&&t.$element.hasClass("fade");t.$element.parent().length||t.$element.appendTo(document.body),t.$element.show(),i&&t.$element[0].offsetWidth,t.$element.addClass("in").attr("aria-hidden",!1),t.enforceFocus(),i?t.$element.one(e.support.transition.end,function(){t.$element.focus().trigger("shown")}):t.$element.focus().trigger("shown")}))},hide:function(t){t&&t.preventDefault(),t=e.Event("hide"),this.$element.trigger(t),this.isShown&&!t.isDefaultPrevented()&&(this.isShown=!1,this.escape(),e(document).off("focusin.modal"),this.$element.removeClass("in").attr("aria-hidden",!0),e.support.transition&&this.$element.hasClass("fade")?this.hideWithTransition():this.hideModal())},enforceFocus:function(){var t=this;e(document).on("focusin.modal",function(e){t.$element[0]===e.target||t.$element.has(e.target).length||t.$element.focus()})},escape:function(){var e=this;this.isShown&&this.options.keyboard?this.$element.on("keyup.dismiss.modal",function(t){27==t.which&&e.hide()}):this.isShown||this.$element.off("keyup.dismiss.modal")},hideWithTransition:function(){var t=this,i=setTimeout(function(){t.$element.off(e.support.transition.end),t.hideModal()},500);this.$element.one(e.support.transition.end,function(){clearTimeout(i),t.hideModal()})},hideModal:function(){var e=this;this.$element.hide(),this.backdrop(function(){e.removeBackdrop(),e.$element.trigger("hidden")})},removeBackdrop:function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},backdrop:function(t){var i=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var n=e.support.transition&&i;if(this.$backdrop=e('<div class="modal-backdrop '+i+'" />').appendTo(document.body),this.$backdrop.click("static"==this.options.backdrop?e.proxy(this.$element[0].focus,this.$element[0]):e.proxy(this.hide,this)),n&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),!t)return;n?this.$backdrop.one(e.support.transition.end,t):t()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),e.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one(e.support.transition.end,t):t()):t&&t()}};var i=e.fn.modal;e.fn.modal=function(i){return this.each(function(){var n=e(this),s=n.data("modal"),a=e.extend({},e.fn.modal.defaults,n.data(),"object"==typeof i&&i);s||n.data("modal",s=new t(this,a)),"string"==typeof i?s[i]():a.show&&s.show()})},e.fn.modal.defaults={backdrop:!0,keyboard:!0,show:!0},e.fn.modal.Constructor=t,e.fn.modal.noConflict=function(){return e.fn.modal=i,this},e(document).on("click.modal.data-api",'[data-toggle="modal"]',function(t){var i=e(this),n=i.attr("href"),s=e(i.attr("data-target")||n&&n.replace(/.*(?=#[^\s]+$)/,"")),a=s.data("modal")?"toggle":e.extend({remote:!/#/.test(n)&&n},s.data(),i.data());t.preventDefault(),s.modal(a).one("hide",function(){i.focus()})})}(window.jQuery),/* ============================================================
 * bootstrap-dropdown.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#dropdowns
 * ============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */
!function(e){"use strict";function t(){e(n).each(function(){i(e(this)).removeClass("open")})}function i(t){var i,n=t.attr("data-target");return n||(n=t.attr("href"),n=n&&/#/.test(n)&&n.replace(/.*(?=#[^\s]*$)/,"")),i=n&&e(n),i&&i.length||(i=t.parent()),i}var n="[data-toggle=dropdown]",s=function(t){var i=e(t).on("click.dropdown.data-api",this.toggle);e("html").on("click.dropdown.data-api",function(){i.parent().removeClass("open")})};s.prototype={constructor:s,toggle:function(){var n,s,a=e(this);if(!a.is(".disabled, :disabled"))return n=i(a),s=n.hasClass("open"),t(),s||n.toggleClass("open"),a.focus(),!1},keydown:function(t){var s,a,o,r,l;if(/(38|40|27)/.test(t.keyCode)&&(s=e(this),t.preventDefault(),t.stopPropagation(),!s.is(".disabled, :disabled"))){if(o=i(s),r=o.hasClass("open"),!r||r&&27==t.keyCode)return 27==t.which&&o.find(n).focus(),s.click();a=e("[role=menu] li:not(.divider):visible a",o),a.length&&(l=a.index(a.filter(":focus")),38==t.keyCode&&l>0&&l--,40==t.keyCode&&a.length-1>l&&l++,~l||(l=0),a.eq(l).focus())}}};var a=e.fn.dropdown;e.fn.dropdown=function(t){return this.each(function(){var i=e(this),n=i.data("dropdown");n||i.data("dropdown",n=new s(this)),"string"==typeof t&&n[t].call(i)})},e.fn.dropdown.Constructor=s,e.fn.dropdown.noConflict=function(){return e.fn.dropdown=a,this},e(document).on("click.dropdown.data-api",t).on("click.dropdown.data-api",".dropdown form",function(e){e.stopPropagation()}).on("click.dropdown-menu",function(e){e.stopPropagation()}).on("click.dropdown.data-api",n,s.prototype.toggle).on("keydown.dropdown.data-api",n+", [role=menu]",s.prototype.keydown)}(window.jQuery),/* =============================================================
 * bootstrap-scrollspy.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#scrollspy
 * =============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================== */
!function(e){"use strict";function t(t,i){var n,s=e.proxy(this.process,this),a=e(t).is("body")?e(window):e(t);this.options=e.extend({},e.fn.scrollspy.defaults,i),this.$scrollElement=a.on("scroll.scroll-spy.data-api",s),this.selector=(this.options.target||(n=e(t).attr("href"))&&n.replace(/.*(?=#[^\s]+$)/,"")||"")+" .nav li > a",this.$body=e("body"),this.refresh(),this.process()}t.prototype={constructor:t,refresh:function(){var t,i=this;this.offsets=e([]),this.targets=e([]),t=this.$body.find(this.selector).map(function(){var t=e(this),n=t.data("target")||t.attr("href"),s=/^#\w/.test(n)&&e(n);return s&&s.length&&[[s.position().top+(!e.isWindow(i.$scrollElement.get(0))&&i.$scrollElement.scrollTop()),n]]||null}).sort(function(e,t){return e[0]-t[0]}).each(function(){i.offsets.push(this[0]),i.targets.push(this[1])})},process:function(){var e,t=this.$scrollElement.scrollTop()+this.options.offset,i=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,n=i-this.$scrollElement.height(),s=this.offsets,a=this.targets,o=this.activeTarget;if(t>=n)return o!=(e=a.last()[0])&&this.activate(e);for(e=s.length;e--;)o!=a[e]&&t>=s[e]&&(!s[e+1]||s[e+1]>=t)&&this.activate(a[e])},activate:function(t){var i,n;this.activeTarget=t,e(this.selector).parent(".active").removeClass("active"),n=this.selector+'[data-target="'+t+'"],'+this.selector+'[href="'+t+'"]',i=e(n).parent("li").addClass("active"),i.parent(".dropdown-menu").length&&(i=i.closest("li.dropdown").addClass("active")),i.trigger("activate")}};var i=e.fn.scrollspy;e.fn.scrollspy=function(i){return this.each(function(){var n=e(this),s=n.data("scrollspy"),a="object"==typeof i&&i;s||n.data("scrollspy",s=new t(this,a)),"string"==typeof i&&s[i]()})},e.fn.scrollspy.Constructor=t,e.fn.scrollspy.defaults={offset:10},e.fn.scrollspy.noConflict=function(){return e.fn.scrollspy=i,this},e(window).on("load",function(){e('[data-spy="scroll"]').each(function(){var t=e(this);t.scrollspy(t.data())})})}(window.jQuery),/* ========================================================
 * bootstrap-tab.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#tabs
 * ========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================== */
!function(e){"use strict";var t=function(t){this.element=e(t)};t.prototype={constructor:t,show:function(){var t,i,n,s=this.element,a=s.closest("ul:not(.dropdown-menu)"),o=s.attr("data-target");o||(o=s.attr("href"),o=o&&o.replace(/.*(?=#[^\s]*$)/,"")),s.parent("li").hasClass("active")||(t=a.find(".active:last a")[0],n=e.Event("show",{relatedTarget:t}),s.trigger(n),n.isDefaultPrevented()||(i=e(o),this.activate(s.parent("li"),a),this.activate(i,i.parent(),function(){s.trigger({type:"shown",relatedTarget:t})})))},activate:function(t,i,n){function s(){a.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),t.addClass("active"),o?(t[0].offsetWidth,t.addClass("in")):t.removeClass("fade"),t.parent(".dropdown-menu")&&t.closest("li.dropdown").addClass("active"),n&&n()}var a=i.find("> .active"),o=n&&e.support.transition&&a.hasClass("fade");o?a.one(e.support.transition.end,s):s(),a.removeClass("in")}};var i=e.fn.tab;e.fn.tab=function(i){return this.each(function(){var n=e(this),s=n.data("tab");s||n.data("tab",s=new t(this)),"string"==typeof i&&s[i]()})},e.fn.tab.Constructor=t,e.fn.tab.noConflict=function(){return e.fn.tab=i,this},e(document).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(t){t.preventDefault(),e(this).tab("show")})}(window.jQuery),/* ===========================================================
 * bootstrap-tooltip.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#tooltips
 * Inspired by the original jQuery.tipsy by Jason Frame
 * ===========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){"use strict";var t=function(e,t){this.init("tooltip",e,t)};t.prototype={constructor:t,init:function(t,i,n){var s,a,o,r,l;for(this.type=t,this.$element=e(i),this.options=this.getOptions(n),this.enabled=!0,o=this.options.trigger.split(" "),l=o.length;l--;)r=o[l],"click"==r?this.$element.on("click."+this.type,this.options.selector,e.proxy(this.toggle,this)):"manual"!=r&&(s="hover"==r?"mouseenter":"focus",a="hover"==r?"mouseleave":"blur",this.$element.on(s+"."+this.type,this.options.selector,e.proxy(this.enter,this)),this.$element.on(a+"."+this.type,this.options.selector,e.proxy(this.leave,this)));this.options.selector?this._options=e.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},getOptions:function(t){return t=e.extend({},e.fn[this.type].defaults,this.$element.data(),t),t.delay&&"number"==typeof t.delay&&(t.delay={show:t.delay,hide:t.delay}),t},enter:function(t){var i,n=e.fn[this.type].defaults,s={};return this._options&&e.each(this._options,function(e,t){n[e]!=t&&(s[e]=t)},this),i=e(t.currentTarget)[this.type](s).data(this.type),i.options.delay&&i.options.delay.show?(clearTimeout(this.timeout),i.hoverState="in",this.timeout=setTimeout(function(){"in"==i.hoverState&&i.show()},i.options.delay.show),void 0):i.show()},leave:function(t){var i=e(t.currentTarget)[this.type](this._options).data(this.type);return this.timeout&&clearTimeout(this.timeout),i.options.delay&&i.options.delay.hide?(i.hoverState="out",this.timeout=setTimeout(function(){"out"==i.hoverState&&i.hide()},i.options.delay.hide),void 0):i.hide()},show:function(){var t,i,n,s,a,o,r=e.Event("show");if(this.hasContent()&&this.enabled){if(this.$element.trigger(r),r.isDefaultPrevented())return;switch(t=this.tip(),this.setContent(),this.options.animation&&t.addClass("fade"),a="function"==typeof this.options.placement?this.options.placement.call(this,t[0],this.$element[0]):this.options.placement,t.detach().css({top:0,left:0,display:"block"}),this.options.container?t.appendTo(this.options.container):t.insertAfter(this.$element),i=this.getPosition(),n=t[0].offsetWidth,s=t[0].offsetHeight,a){case"bottom":o={top:i.top+i.height,left:i.left+i.width/2-n/2};break;case"top":o={top:i.top-s,left:i.left+i.width/2-n/2};break;case"left":o={top:i.top+i.height/2-s/2,left:i.left-n};break;case"right":o={top:i.top+i.height/2-s/2,left:i.left+i.width}}this.applyPlacement(o,a),this.$element.trigger("shown")}},applyPlacement:function(e,t){var i,n,s,a,o=this.tip(),r=o[0].offsetWidth,l=o[0].offsetHeight;o.offset(e).addClass(t).addClass("in"),i=o[0].offsetWidth,n=o[0].offsetHeight,"top"==t&&n!=l&&(e.top=e.top+l-n,a=!0),"bottom"==t||"top"==t?(s=0,0>e.left&&(s=-2*e.left,e.left=0,o.offset(e),i=o[0].offsetWidth,n=o[0].offsetHeight),this.replaceArrow(s-r+i,i,"left")):this.replaceArrow(n-l,n,"top"),a&&o.offset(e)},replaceArrow:function(e,t,i){this.arrow().css(i,e?50*(1-e/t)+"%":"")},setContent:function(){var e=this.tip(),t=this.getTitle();e.find(".tooltip-inner")[this.options.html?"html":"text"](t),e.removeClass("fade in top bottom left right")},hide:function(){function t(){var t=setTimeout(function(){i.off(e.support.transition.end).detach()},500);i.one(e.support.transition.end,function(){clearTimeout(t),i.detach()})}var i=this.tip(),n=e.Event("hide");return this.$element.trigger(n),n.isDefaultPrevented()?void 0:(i.removeClass("in"),e.support.transition&&this.$tip.hasClass("fade")?t():i.detach(),this.$element.trigger("hidden"),this)},fixTitle:function(){var e=this.$element;(e.attr("title")||"string"!=typeof e.attr("data-original-title"))&&e.attr("data-original-title",e.attr("title")||"").attr("title","")},hasContent:function(){return this.getTitle()},getPosition:function(){var t=this.$element[0];return e.extend({},"function"==typeof t.getBoundingClientRect?t.getBoundingClientRect():{width:t.offsetWidth,height:t.offsetHeight},this.$element.offset())},getTitle:function(){var e,t=this.$element,i=this.options;return e=t.attr("data-original-title")||("function"==typeof i.title?i.title.call(t[0]):i.title)},tip:function(){return this.$tip=this.$tip||e(this.options.template)},arrow:function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},validate:function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},enable:function(){this.enabled=!0},disable:function(){this.enabled=!1},toggleEnabled:function(){this.enabled=!this.enabled},toggle:function(t){var i=t?e(t.currentTarget)[this.type](this._options).data(this.type):this;i.tip().hasClass("in")?i.hide():i.show()},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}};var i=e.fn.tooltip;e.fn.tooltip=function(i){return this.each(function(){var n=e(this),s=n.data("tooltip"),a="object"==typeof i&&i;s||n.data("tooltip",s=new t(this,a)),"string"==typeof i&&s[i]()})},e.fn.tooltip.Constructor=t,e.fn.tooltip.defaults={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1},e.fn.tooltip.noConflict=function(){return e.fn.tooltip=i,this}}(window.jQuery),/* ===========================================================
 * bootstrap-popover.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#popovers
 * ===========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * =========================================================== */
!function(e){"use strict";var t=function(e,t){this.init("popover",e,t)};t.prototype=e.extend({},e.fn.tooltip.Constructor.prototype,{constructor:t,setContent:function(){var e=this.tip(),t=this.getTitle(),i=this.getContent();e.find(".popover-title")[this.options.html?"html":"text"](t),e.find(".popover-content")[this.options.html?"html":"text"](i),e.removeClass("fade top bottom left right in")},hasContent:function(){return this.getTitle()||this.getContent()},getContent:function(){var e,t=this.$element,i=this.options;return e=("function"==typeof i.content?i.content.call(t[0]):i.content)||t.attr("data-content")},tip:function(){return this.$tip||(this.$tip=e(this.options.template)),this.$tip},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}});var i=e.fn.popover;e.fn.popover=function(i){return this.each(function(){var n=e(this),s=n.data("popover"),a="object"==typeof i&&i;s||n.data("popover",s=new t(this,a)),"string"==typeof i&&s[i]()})},e.fn.popover.Constructor=t,e.fn.popover.defaults=e.extend({},e.fn.tooltip.defaults,{placement:"right",trigger:"click",content:"",template:'<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}),e.fn.popover.noConflict=function(){return e.fn.popover=i,this}}(window.jQuery),/* ============================================================
 * bootstrap-button.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#buttons
 * ============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */
!function(e){"use strict";var t=function(t,i){this.$element=e(t),this.options=e.extend({},e.fn.button.defaults,i)};t.prototype.setState=function(e){var t="disabled",i=this.$element,n=i.data(),s=i.is("input")?"val":"html";e+="Text",n.resetText||i.data("resetText",i[s]()),i[s](n[e]||this.options[e]),setTimeout(function(){"loadingText"==e?i.addClass(t).attr(t,t):i.removeClass(t).removeAttr(t)},0)},t.prototype.toggle=function(){var e=this.$element.closest('[data-toggle="buttons-radio"]');e&&e.find(".active").removeClass("active"),this.$element.toggleClass("active")};var i=e.fn.button;e.fn.button=function(i){return this.each(function(){var n=e(this),s=n.data("button"),a="object"==typeof i&&i;s||n.data("button",s=new t(this,a)),"toggle"==i?s.toggle():i&&s.setState(i)})},e.fn.button.defaults={loadingText:"loading..."},e.fn.button.Constructor=t,e.fn.button.noConflict=function(){return e.fn.button=i,this},e(document).on("click.button.data-api","[data-toggle^=button]",function(t){var i=e(t.target);i.hasClass("btn")||(i=i.closest(".btn")),i.button("toggle")})}(window.jQuery),/* =============================================================
 * bootstrap-collapse.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#collapse
 * =============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */
!function(e){"use strict";var t=function(t,i){this.$element=e(t),this.options=e.extend({},e.fn.collapse.defaults,i),this.options.parent&&(this.$parent=e(this.options.parent)),this.options.toggle&&this.toggle()};t.prototype={constructor:t,dimension:function(){var e=this.$element.hasClass("width");return e?"width":"height"},show:function(){var t,i,n,s;if(!this.transitioning&&!this.$element.hasClass("in")){if(t=this.dimension(),i=e.camelCase(["scroll",t].join("-")),n=this.$parent&&this.$parent.find("> .accordion-group > .in"),n&&n.length){if(s=n.data("collapse"),s&&s.transitioning)return;n.collapse("hide"),s||n.data("collapse",null)}this.$element[t](0),this.transition("addClass",e.Event("show"),"shown"),e.support.transition&&this.$element[t](this.$element[0][i])}},hide:function(){var t;!this.transitioning&&this.$element.hasClass("in")&&(t=this.dimension(),this.reset(this.$element[t]()),this.transition("removeClass",e.Event("hide"),"hidden"),this.$element[t](0))},reset:function(e){var t=this.dimension();return this.$element.removeClass("collapse")[t](e||"auto")[0].offsetWidth,this.$element[null!==e?"addClass":"removeClass"]("collapse"),this},transition:function(t,i,n){var s=this,a=function(){"show"==i.type&&s.reset(),s.transitioning=0,s.$element.trigger(n)};this.$element.trigger(i),i.isDefaultPrevented()||(this.transitioning=1,this.$element[t]("in"),e.support.transition&&this.$element.hasClass("collapse")?this.$element.one(e.support.transition.end,a):a())},toggle:function(){this[this.$element.hasClass("in")?"hide":"show"]()}};var i=e.fn.collapse;e.fn.collapse=function(i){return this.each(function(){var n=e(this),s=n.data("collapse"),a=e.extend({},e.fn.collapse.defaults,n.data(),"object"==typeof i&&i);s||n.data("collapse",s=new t(this,a)),"string"==typeof i&&s[i]()})},e.fn.collapse.defaults={toggle:!0},e.fn.collapse.Constructor=t,e.fn.collapse.noConflict=function(){return e.fn.collapse=i,this},e(document).on("click.collapse.data-api","[data-toggle=collapse]",function(t){var i,n=e(this),s=n.attr("data-target")||t.preventDefault()||(i=n.attr("href"))&&i.replace(/.*(?=#[^\s]+$)/,""),a=e(s).data("collapse")?"toggle":n.data();n[e(s).hasClass("in")?"addClass":"removeClass"]("collapsed"),e(s).collapse(a)})}(window.jQuery),/* ==========================================================
 * bootstrap-carousel.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#carousel
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){"use strict";var t=function(t,i){this.$element=e(t),this.$indicators=this.$element.find(".carousel-indicators"),this.options=i,"hover"==this.options.pause&&this.$element.on("mouseenter",e.proxy(this.pause,this)).on("mouseleave",e.proxy(this.cycle,this))};t.prototype={cycle:function(t){return t||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(e.proxy(this.next,this),this.options.interval)),this},getActiveIndex:function(){return this.$active=this.$element.find(".item.active"),this.$items=this.$active.parent().children(),this.$items.index(this.$active)},to:function(t){var i=this.getActiveIndex(),n=this;if(!(t>this.$items.length-1||0>t))return this.sliding?this.$element.one("slid",function(){n.to(t)}):i==t?this.pause().cycle():this.slide(t>i?"next":"prev",e(this.$items[t]))},pause:function(t){return t||(this.paused=!0),this.$element.find(".next, .prev").length&&e.support.transition.end&&(this.$element.trigger(e.support.transition.end),this.cycle(!0)),clearInterval(this.interval),this.interval=null,this},next:function(){return this.sliding?void 0:this.slide("next")},prev:function(){return this.sliding?void 0:this.slide("prev")},slide:function(t,i){var n,s=this.$element.find(".item.active"),a=i||s[t](),o=this.interval,r="next"==t?"left":"right",l="next"==t?"first":"last",c=this;if(this.sliding=!0,o&&this.pause(),a=a.length?a:this.$element.find(".item")[l](),n=e.Event("slide",{relatedTarget:a[0],direction:r}),!a.hasClass("active")){if(this.$indicators.length&&(this.$indicators.find(".active").removeClass("active"),this.$element.one("slid",function(){var t=e(c.$indicators.children()[c.getActiveIndex()]);t&&t.addClass("active")})),e.support.transition&&this.$element.hasClass("slide")){if(this.$element.trigger(n),n.isDefaultPrevented())return;a.addClass(t),a[0].offsetWidth,s.addClass(r),a.addClass(r),this.$element.one(e.support.transition.end,function(){a.removeClass([t,r].join(" ")).addClass("active"),s.removeClass(["active",r].join(" ")),c.sliding=!1,setTimeout(function(){c.$element.trigger("slid")},0)})}else{if(this.$element.trigger(n),n.isDefaultPrevented())return;s.removeClass("active"),a.addClass("active"),this.sliding=!1,this.$element.trigger("slid")}return o&&this.cycle(),this}}};var i=e.fn.carousel;e.fn.carousel=function(i){return this.each(function(){var n=e(this),s=n.data("carousel"),a=e.extend({},e.fn.carousel.defaults,"object"==typeof i&&i),o="string"==typeof i?i:a.slide;s||n.data("carousel",s=new t(this,a)),"number"==typeof i?s.to(i):o?s[o]():a.interval&&s.pause().cycle()})},e.fn.carousel.defaults={interval:5e3,pause:"hover"},e.fn.carousel.Constructor=t,e.fn.carousel.noConflict=function(){return e.fn.carousel=i,this},e(document).on("click.carousel.data-api","[data-slide], [data-slide-to]",function(t){var i,n,s=e(this),a=e(s.attr("data-target")||(i=s.attr("href"))&&i.replace(/.*(?=#[^\s]+$)/,"")),o=e.extend({},a.data(),s.data());a.carousel(o),(n=s.attr("data-slide-to"))&&a.data("carousel").pause().to(n).cycle(),t.preventDefault()})}(window.jQuery),/* =============================================================
 * bootstrap-typeahead.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#typeahead
 * =============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */
!function(e){"use strict";var t=function(t,i){this.$element=e(t),this.options=e.extend({},e.fn.typeahead.defaults,i),this.matcher=this.options.matcher||this.matcher,this.sorter=this.options.sorter||this.sorter,this.highlighter=this.options.highlighter||this.highlighter,this.updater=this.options.updater||this.updater,this.source=this.options.source,this.$menu=e(this.options.menu),this.shown=!1,this.listen()};t.prototype={constructor:t,select:function(){var e=this.$menu.find(".active").attr("data-value");return this.$element.val(this.updater(e)).change(),this.hide()},updater:function(e){return e},show:function(){var t=e.extend({},this.$element.position(),{height:this.$element[0].offsetHeight});return this.$menu.insertAfter(this.$element).css({top:t.top+t.height,left:t.left}).show(),this.shown=!0,this},hide:function(){return this.$menu.hide(),this.shown=!1,this},lookup:function(){var t;return this.query=this.$element.val(),!this.query||this.query.length<this.options.minLength?this.shown?this.hide():this:(t=e.isFunction(this.source)?this.source(this.query,e.proxy(this.process,this)):this.source,t?this.process(t):this)},process:function(t){var i=this;return t=e.grep(t,function(e){return i.matcher(e)}),t=this.sorter(t),t.length?this.render(t.slice(0,this.options.items)).show():this.shown?this.hide():this},matcher:function(e){return~e.toLowerCase().indexOf(this.query.toLowerCase())},sorter:function(e){for(var t,i=[],n=[],s=[];t=e.shift();)t.toLowerCase().indexOf(this.query.toLowerCase())?~t.indexOf(this.query)?n.push(t):s.push(t):i.push(t);return i.concat(n,s)},highlighter:function(e){var t=this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&");return e.replace(new RegExp("("+t+")","ig"),function(e,t){return"<strong>"+t+"</strong>"})},render:function(t){var i=this;return t=e(t).map(function(t,n){return t=e(i.options.item).attr("data-value",n),t.find("a").html(i.highlighter(n)),t[0]}),t.first().addClass("active"),this.$menu.html(t),this},next:function(){var t=this.$menu.find(".active").removeClass("active"),i=t.next();i.length||(i=e(this.$menu.find("li")[0])),i.addClass("active")},prev:function(){var e=this.$menu.find(".active").removeClass("active"),t=e.prev();t.length||(t=this.$menu.find("li").last()),t.addClass("active")},listen:function(){this.$element.on("focus",e.proxy(this.focus,this)).on("blur",e.proxy(this.blur,this)).on("keypress",e.proxy(this.keypress,this)).on("keyup",e.proxy(this.keyup,this)),this.eventSupported("keydown")&&this.$element.on("keydown",e.proxy(this.keydown,this)),this.$menu.on("click",e.proxy(this.click,this)).on("mouseenter","li",e.proxy(this.mouseenter,this)).on("mouseleave","li",e.proxy(this.mouseleave,this))},eventSupported:function(e){var t=e in this.$element;return t||(this.$element.setAttribute(e,"return;"),t="function"==typeof this.$element[e]),t},move:function(e){if(this.shown){switch(e.keyCode){case 9:case 13:case 27:e.preventDefault();break;case 38:e.preventDefault(),this.prev();break;case 40:e.preventDefault(),this.next()}e.stopPropagation()}},keydown:function(t){this.suppressKeyPressRepeat=~e.inArray(t.keyCode,[40,38,9,13,27]),this.move(t)},keypress:function(e){this.suppressKeyPressRepeat||this.move(e)},keyup:function(e){switch(e.keyCode){case 40:case 38:case 16:case 17:case 18:break;case 9:case 13:if(!this.shown)return;this.select();break;case 27:if(!this.shown)return;this.hide();break;default:this.lookup()}e.stopPropagation(),e.preventDefault()},focus:function(){this.focused=!0},blur:function(){this.focused=!1,!this.mousedover&&this.shown&&this.hide()},click:function(e){e.stopPropagation(),e.preventDefault(),this.select(),this.$element.focus()},mouseenter:function(t){this.mousedover=!0,this.$menu.find(".active").removeClass("active"),e(t.currentTarget).addClass("active")},mouseleave:function(){this.mousedover=!1,!this.focused&&this.shown&&this.hide()}};var i=e.fn.typeahead;e.fn.typeahead=function(i){return this.each(function(){var n=e(this),s=n.data("typeahead"),a="object"==typeof i&&i;s||n.data("typeahead",s=new t(this,a)),"string"==typeof i&&s[i]()})},e.fn.typeahead.defaults={source:[],items:8,menu:'<ul class="typeahead dropdown-menu"></ul>',item:'<li><a href="#"></a></li>',minLength:1},e.fn.typeahead.Constructor=t,e.fn.typeahead.noConflict=function(){return e.fn.typeahead=i,this},e(document).on("focus.typeahead.data-api",'[data-provide="typeahead"]',function(){var t=e(this);t.data("typeahead")||t.typeahead(t.data())})}(window.jQuery),/* ==========================================================
 * bootstrap-affix.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#affix
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){"use strict";var t=function(t,i){this.options=e.extend({},e.fn.affix.defaults,i),this.$window=e(window).on("scroll.affix.data-api",e.proxy(this.checkPosition,this)).on("click.affix.data-api",e.proxy(function(){setTimeout(e.proxy(this.checkPosition,this),1)},this)),this.$element=e(t),this.checkPosition()};t.prototype.checkPosition=function(){if(this.$element.is(":visible")){var t,i=e(document).height(),n=this.$window.scrollTop(),s=this.$element.offset(),a=this.options.offset,o=a.bottom,r=a.top,l="affix affix-top affix-bottom";"object"!=typeof a&&(o=r=a),"function"==typeof r&&(r=a.top()),"function"==typeof o&&(o=a.bottom()),t=null!=this.unpin&&n+this.unpin<=s.top?!1:null!=o&&s.top+this.$element.height()>=i-o?"bottom":null!=r&&r>=n?"top":!1,this.affixed!==t&&(this.affixed=t,this.unpin="bottom"==t?s.top-n:null,this.$element.removeClass(l).addClass("affix"+(t?"-"+t:"")))}};var i=e.fn.affix;e.fn.affix=function(i){return this.each(function(){var n=e(this),s=n.data("affix"),a="object"==typeof i&&i;s||n.data("affix",s=new t(this,a)),"string"==typeof i&&s[i]()})},e.fn.affix.Constructor=t,e.fn.affix.defaults={offset:0},e.fn.affix.noConflict=function(){return e.fn.affix=i,this},e(window).on("load",function(){e('[data-spy="affix"]').each(function(){var t=e(this),i=t.data();i.offset=i.offset||{},i.offsetBottom&&(i.offset.bottom=i.offsetBottom),i.offsetTop&&(i.offset.top=i.offsetTop),t.affix(i)})})}(window.jQuery);