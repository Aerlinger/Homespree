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
/*jslint browser: true */
var Placeholders=function(){"use strict";function o(e){var t;e.createTextRange?(t=e.createTextRange(),t.move("character",0),t.select()):e.selectionStart&&(e.focus(),e.setSelectionRange(0,0))}function u(){var e;this.value===this.getAttribute("placeholder")&&(t.hideOnFocus?(this.className=this.className.replace(s,""),this.value="",e=this.getAttribute("data-placeholdertype"),e&&(this.type=e)):o(this))}function a(){var e;this.value===""&&(this.className=this.className+" "+t.className,this.value=this.getAttribute("placeholder"),e=this.getAttribute("data-placeholdertype"),e&&(this.type="text"))}function f(){var e=this.getElementsByTagName("input"),t=this.getElementsByTagName("textarea"),n=e.length,r=n+t.length,i,s,o;for(o=0;o<r;o+=1)i=o<n?e[o]:t[o-n],s=i.getAttribute("placeholder"),i.value===s&&(i.value="")}function l(e){return i=this.value,!(i===this.getAttribute("placeholder")&&n.indexOf(e.keyCode)>-1)}function c(){var e;this.value!==i&&(this.className=this.className.replace(s,""),this.value=this.value.replace(this.getAttribute("placeholder"),""),e=this.getAttribute("data-placeholdertype"),e&&(this.type=e)),this.value===""&&(a.call(this),o(this))}function h(e,t,n){if(e.addEventListener)return e.addEventListener(t,n.bind(e),!1);if(e.attachEvent)return e.attachEvent("on"+t,n.bind(e))}function p(e){t.hideOnFocus||(h(e,"keydown",l),h(e,"keyup",c)),h(e,"focus",u),h(e,"blur",a)}function d(){var n=document.getElementsByTagName("input"),r=document.getElementsByTagName("textarea"),i=n.length,s=i+r.length,o,u,a,l,c;for(o=0;o<s;o+=1){a=o<i?n[o]:r[o-i],c=a.getAttribute("placeholder");if(e.indexOf(a.type)>-1&&c){l=a.getAttribute("data-currentplaceholder");if(c!==l){if(a.value===l||a.value===c||!a.value)a.value=c,a.className=a.className+" "+t.className;l||(a.form&&(u=a.form,u.getAttribute("data-placeholdersubmit")||(h(u,"submit",f),u.setAttribute("data-placeholdersubmit","true"))),p(a)),a.setAttribute("data-currentplaceholder",c)}}}}function v(){var n=document.getElementsByTagName("input"),r=document.getElementsByTagName("textarea"),i=n.length,s=i+r.length,o,u,a,l;for(o=0;o<s;o+=1){u=o<i?n[o]:r[o-i],l=u.getAttribute("placeholder");if(e.indexOf(u.type)>-1&&l){if(u.type==="password")try{u.type="text",u.setAttribute("data-placeholdertype","password")}catch(c){}u.setAttribute("data-currentplaceholder",l);if(u.value===""||u.value===l)u.className=u.className+" "+t.className,u.value=l;u.form&&(a=u.form,a.getAttribute("data-placeholdersubmit")||(h(a,"submit",f),a.setAttribute("data-placeholdersubmit","true"))),p(u)}}}function m(e){var n=document.createElement("input"),i,s,o,u,a;if(typeof n.placeholder=="undefined"){for(i in e)e.hasOwnProperty(i)&&(t[i]=e[i]);s=document.createElement("style"),s.type="text/css";var f=t.styleImportant?"!important":"";return o=document.createTextNode("."+t.className+" { color:"+t.textColor+f+"; }"),s.styleSheet?s.styleSheet.cssText=o.nodeValue:s.appendChild(o),document.getElementsByTagName("head")[0].appendChild(s),Array.prototype.indexOf||(Array.prototype.indexOf=function(e,t){for(u=t||0,a=this.length;u<a;u+=1)if(this[u]===e)return u;return-1}),Function.prototype.bind||(Function.prototype.bind=function(e){if(typeof this!="function")throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");var t=Array.prototype.slice.call(arguments,1),n=this,r=function(){},i=function(){return n.apply(this instanceof r?this:e,t.concat(Array.prototype.slice.call(arguments)))};return r.prototype=this.prototype,i.prototype=new r,i}),v(),t.live&&(r=setInterval(d,100)),!0}return!1}var e=["text","search","url","tel","email","password","number","textarea"],t={live:!1,hideOnFocus:!1,className:"placeholderspolyfill",textColor:"#999",styleImportant:!0},n=[37,38,39,40],r,i,s=new RegExp("\\b"+t.className+"\\b");return{init:m,refresh:d}}();