/*
 * JavaScript Load Image 1.2.1
 * https://github.com/blueimp/JavaScript-Load-Image
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
!function(t){"use strict";var e=function(t,i,n){var s,o,a=document.createElement("img");return a.onerror=i,a.onload=function(){!o||n&&n.noRevoke||e.revokeObjectURL(o),i(e.scale(a,n))},s=window.Blob&&t instanceof Blob||window.File&&t instanceof File?o=e.createObjectURL(t):t,s?(a.src=s,a):e.readFile(t,function(t){a.src=t})},i=window.createObjectURL&&window||window.URL&&URL.revokeObjectURL&&URL||window.webkitURL&&webkitURL;e.scale=function(t,e){e=e||{};var i=document.createElement("canvas"),n=t.width,s=t.height,o=Math.max((e.minWidth||n)/n,(e.minHeight||s)/s);return o>1&&(n=parseInt(n*o,10),s=parseInt(s*o,10)),o=Math.min((e.maxWidth||n)/n,(e.maxHeight||s)/s),1>o&&(n=parseInt(n*o,10),s=parseInt(s*o,10)),t.getContext||e.canvas&&i.getContext?(i.width=n,i.height=s,i.getContext("2d").drawImage(t,0,0,n,s),i):(t.width=n,t.height=s,t)},e.createObjectURL=function(t){return i?i.createObjectURL(t):!1},e.revokeObjectURL=function(t){return i?i.revokeObjectURL(t):!1},e.readFile=function(t,e){if(window.FileReader&&FileReader.prototype.readAsDataURL){var i=new FileReader;return i.onload=function(t){e(t.target.result)},i.readAsDataURL(t),i}return!1},"function"==typeof define&&define.amd?define(function(){return e}):t.loadImage=e}(this);