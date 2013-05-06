/* ==========================================================
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