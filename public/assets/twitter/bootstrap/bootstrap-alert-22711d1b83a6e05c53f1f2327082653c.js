/* ==========================================================
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
!function(e){"use strict";var t='[data-dismiss="alert"]',i=function(i){e(i).on("click",t,this.close)};i.prototype.close=function(t){function i(){n.trigger("closed").remove()}var n,s=e(this),o=s.attr("data-target");o||(o=s.attr("href"),o=o&&o.replace(/.*(?=#[^\s]*$)/,"")),n=e(o),t&&t.preventDefault(),n.length||(n=s.hasClass("alert")?s:s.parent()),n.trigger(t=e.Event("close")),t.isDefaultPrevented()||(n.removeClass("in"),e.support.transition&&n.hasClass("fade")?n.on(e.support.transition.end,i):i())};var n=e.fn.alert;e.fn.alert=function(t){return this.each(function(){var n=e(this),s=n.data("alert");s||n.data("alert",s=new i(this)),"string"==typeof t&&s[t].call(n)})},e.fn.alert.Constructor=i,e.fn.alert.noConflict=function(){return e.fn.alert=n,this},e(document).on("click.alert.data-api",t,i.prototype.close)}(window.jQuery);