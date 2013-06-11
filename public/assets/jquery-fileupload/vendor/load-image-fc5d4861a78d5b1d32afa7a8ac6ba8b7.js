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
!function(e){"use strict";var t=function(e,i,n){var s,o,a=document.createElement("img");return a.onerror=i,a.onload=function(){!o||n&&n.noRevoke||t.revokeObjectURL(o),i(t.scale(a,n))},s=window.Blob&&e instanceof Blob||window.File&&e instanceof File?o=t.createObjectURL(e):e,s?(a.src=s,a):t.readFile(e,function(e){a.src=e})},i=window.createObjectURL&&window||window.URL&&URL.revokeObjectURL&&URL||window.webkitURL&&webkitURL;t.scale=function(e,t){t=t||{};var i=document.createElement("canvas"),n=e.width,s=e.height,o=Math.max((t.minWidth||n)/n,(t.minHeight||s)/s);return o>1&&(n=parseInt(n*o,10),s=parseInt(s*o,10)),o=Math.min((t.maxWidth||n)/n,(t.maxHeight||s)/s),1>o&&(n=parseInt(n*o,10),s=parseInt(s*o,10)),e.getContext||t.canvas&&i.getContext?(i.width=n,i.height=s,i.getContext("2d").drawImage(e,0,0,n,s),i):(e.width=n,e.height=s,e)},t.createObjectURL=function(e){return i?i.createObjectURL(e):!1},t.revokeObjectURL=function(e){return i?i.revokeObjectURL(e):!1},t.readFile=function(e,t){if(window.FileReader&&FileReader.prototype.readAsDataURL){var i=new FileReader;return i.onload=function(e){t(e.target.result)},i.readAsDataURL(e),i}return!1},"function"==typeof define&&define.amd?define(function(){return t}):e.loadImage=t}(this);