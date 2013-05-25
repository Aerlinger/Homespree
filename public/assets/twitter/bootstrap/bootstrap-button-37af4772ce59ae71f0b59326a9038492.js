/* ============================================================
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
!function(e){"use strict";var t=function(t,i){this.$element=e(t),this.options=e.extend({},e.fn.button.defaults,i)};t.prototype.setState=function(e){var t="disabled",i=this.$element,n=i.data(),s=i.is("input")?"val":"html";e+="Text",n.resetText||i.data("resetText",i[s]()),i[s](n[e]||this.options[e]),setTimeout(function(){"loadingText"==e?i.addClass(t).attr(t,t):i.removeClass(t).removeAttr(t)},0)},t.prototype.toggle=function(){var e=this.$element.closest('[data-toggle="buttons-radio"]');e&&e.find(".active").removeClass("active"),this.$element.toggleClass("active")};var i=e.fn.button;e.fn.button=function(i){return this.each(function(){var n=e(this),s=n.data("button"),o="object"==typeof i&&i;s||n.data("button",s=new t(this,o)),"toggle"==i?s.toggle():i&&s.setState(i)})},e.fn.button.defaults={loadingText:"loading..."},e.fn.button.Constructor=t,e.fn.button.noConflict=function(){return e.fn.button=i,this},e(document).on("click.button.data-api","[data-toggle^=button]",function(t){var i=e(t.target);i.hasClass("btn")||(i=i.closest(".btn")),i.button("toggle")})}(window.jQuery);