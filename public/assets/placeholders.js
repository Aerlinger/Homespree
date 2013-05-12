/*
 * The MIT License
 *
 * Copyright (c) 2012 James Allardice
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * -----------------------------------------------------------------------------------------------------------------------------------------------------
 *
 * Placeholders is a simple polyfill for the HTML5 "placeholder" attribute. The placeholder attribute can be used on input elements of certain types
 * and provides a short hint (such as a sample value or a brief description) intended to aid the user with data entry. This polyfill has been tested
 * and functions correctly in Internet Explorer 6 and above, Firefox 3.6 and above, Safari 3.2 and above, Opera 9 and above and Chrome 16 and above.
 * The script will be tested in further browsers in due course and the above list edited accordingly.
 *
 * User agents should display the value of the placeholder attribute when the element's value is the empty string and the element does not
 * have focus. The user agents that have implemented support for this attribute all display the placeholder inside the element, as if it were
 * the element's value, in a light grey colour to differentiate between placeholder text and value text.
 *
 * The Placeholders polyfill attempts to replicate the functionality of compliant user agents so that non-compliant user agents will still function
 * as expected when faced with a "placeholder" attribute.
 *
 * The script is unobtrusive and will only apply if the placeholder attribute is not supported by the user agent in which it is running. To use a placeholder
 * simply add the "placeholder" attribute to a supporting input element:
 *
 * <input type="text" placeholder="Placeholder text">
 *
 * To get this placeholder to function in non-supporting user agents simply call the init method when appropriate (the DOM must be ready for manipulation,
 * unless the `live` option is true):
 *
 * Placeholders.init();
 *
 * The init method accepts one argument, `options`. It's an object that contains settings to control the behaviour of the polyfill. Currently, only 2 options
 * are available:
 *
 * `live` - If truthy, the polyfill will apply to all supported input elements now and in the future, and dynamic
 * changes to the placeholder attribute value will be reflected. If falsy, the polyfill will only apply to those elements with a placeholder attribute
 * value in the DOM at the time the method is executed. If the live option is not used, the placeholders can be refreshed manually by calling `Placeholders.refresh()`.
 *
 * `hideOnFocus` - If truthy, the placeholder text will not disappear when the field receives focus. This option is relatively new to the spec, but is
 * starting to be implemented in browsers (e.g. Safari, and now Chrome). This option is set to `true` by default, since that's where browsers seem to be heading.
 */
var Placeholders=function(){"use strict";function t(t){var e;t.createTextRange?(e=t.createTextRange(),e.move("character",0),e.select()):t.selectionStart&&(t.focus(),t.setSelectionRange(0,0))}function e(){var e;this.value===this.getAttribute("placeholder")&&(f.hideOnFocus?(this.className=this.className.replace(g,""),this.value="",e=this.getAttribute("data-placeholdertype"),e&&(this.type=e)):t(this))}function i(){var t;""===this.value&&(this.className=this.className+" "+f.className,this.value=this.getAttribute("placeholder"),t=this.getAttribute("data-placeholdertype"),t&&(this.type="text"))}function n(){var t,e,i,n=this.getElementsByTagName("input"),s=this.getElementsByTagName("textarea"),o=n.length,a=o+s.length;for(i=0;a>i;i+=1)t=o>i?n[i]:s[i-o],e=t.getAttribute("placeholder"),t.value===e&&(t.value="")}function s(t){return d=this.value,!(d===this.getAttribute("placeholder")&&m.indexOf(t.keyCode)>-1)}function o(){var e;this.value!==d&&(this.className=this.className.replace(g,""),this.value=this.value.replace(this.getAttribute("placeholder"),""),e=this.getAttribute("data-placeholdertype"),e&&(this.type=e)),""===this.value&&(i.call(this),t(this))}function a(t,e,i){return t.addEventListener?t.addEventListener(e,i.bind(t),!1):t.attachEvent?t.attachEvent("on"+e,i.bind(t)):void 0}function r(t){f.hideOnFocus||(a(t,"keydown",s),a(t,"keyup",o)),a(t,"focus",e),a(t,"blur",i)}function l(){var t,e,i,s,o,l=document.getElementsByTagName("input"),c=document.getElementsByTagName("textarea"),h=l.length,u=h+c.length;for(t=0;u>t;t+=1)i=h>t?l[t]:c[t-h],o=i.getAttribute("placeholder"),p.indexOf(i.type)>-1&&o&&(s=i.getAttribute("data-currentplaceholder"),o!==s&&(i.value!==s&&i.value!==o&&i.value||(i.value=o,i.className=i.className+" "+f.className),s||(i.form&&(e=i.form,e.getAttribute("data-placeholdersubmit")||(a(e,"submit",n),e.setAttribute("data-placeholdersubmit","true"))),r(i)),i.setAttribute("data-currentplaceholder",o)))}function c(){var t,e,i,s,o=document.getElementsByTagName("input"),l=document.getElementsByTagName("textarea"),c=o.length,h=c+l.length;for(t=0;h>t;t+=1)if(e=c>t?o[t]:l[t-c],s=e.getAttribute("placeholder"),p.indexOf(e.type)>-1&&s){if("password"===e.type)try{e.type="text",e.setAttribute("data-placeholdertype","password")}catch(u){}e.setAttribute("data-currentplaceholder",s),(""===e.value||e.value===s)&&(e.className=e.className+" "+f.className,e.value=s),e.form&&(i=e.form,i.getAttribute("data-placeholdersubmit")||(a(i,"submit",n),i.setAttribute("data-placeholdersubmit","true"))),r(e)}}function h(t){var e,i,n,s,o,a=document.createElement("input");if("undefined"==typeof a.placeholder){for(e in t)t.hasOwnProperty(e)&&(f[e]=t[e]);i=document.createElement("style"),i.type="text/css";var r=f.styleImportant?"!important":"";return n=document.createTextNode("."+f.className+" { color:"+f.textColor+r+"; }"),i.styleSheet?i.styleSheet.cssText=n.nodeValue:i.appendChild(n),document.getElementsByTagName("head")[0].appendChild(i),Array.prototype.indexOf||(Array.prototype.indexOf=function(t,e){for(s=e||0,o=this.length;o>s;s+=1)if(this[s]===t)return s;return-1}),Function.prototype.bind||(Function.prototype.bind=function(t){if("function"!=typeof this)throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");var e=Array.prototype.slice.call(arguments,1),i=this,n=function(){},s=function(){return i.apply(this instanceof n?this:t,e.concat(Array.prototype.slice.call(arguments)))};return n.prototype=this.prototype,s.prototype=new n,s}),c(),f.live&&(u=setInterval(l,100)),!0}return!1}var u,d,p=["text","search","url","tel","email","password","number","textarea"],f={live:!1,hideOnFocus:!1,className:"placeholderspolyfill",textColor:"#999",styleImportant:!0},m=[37,38,39,40],g=new RegExp("\\b"+f.className+"\\b");return{init:h,refresh:l}}();