/*
 * JavaScript Canvas to Blob 2.0.3
 * https://github.com/blueimp/JavaScript-Canvas-to-Blob
 *
 * Copyright 2012, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 *
 * Based on stackoverflow user Stoive's code snippet:
 * http://stackoverflow.com/q/4998908
 */
!function(e){"use strict";var t=e.HTMLCanvasElement&&e.HTMLCanvasElement.prototype,i=e.Blob&&function(){try{return Boolean(new Blob)}catch(e){return!1}}(),n=i&&e.Uint8Array&&function(){try{return 100===new Blob([new Uint8Array(100)]).size}catch(e){return!1}}(),s=e.BlobBuilder||e.WebKitBlobBuilder||e.MozBlobBuilder||e.MSBlobBuilder,o=(i||s)&&e.atob&&e.ArrayBuffer&&e.Uint8Array&&function(e){var t,o,a,r,l,c;for(t=e.split(",")[0].indexOf("base64")>=0?atob(e.split(",")[1]):decodeURIComponent(e.split(",")[1]),o=new ArrayBuffer(t.length),a=new Uint8Array(o),r=0;r<t.length;r+=1)a[r]=t.charCodeAt(r);return l=e.split(",")[0].split(":")[1].split(";")[0],i?new Blob([n?a:o],{type:l}):(c=new s,c.append(o),c.getBlob(l))};e.HTMLCanvasElement&&!t.toBlob&&(t.mozGetAsFile?t.toBlob=function(e,t){e(this.mozGetAsFile("blob",t))}:t.toDataURL&&o&&(t.toBlob=function(e,t){e(o(this.toDataURL(t)))})),"function"==typeof define&&define.amd?define(function(){return o}):e.dataURLtoBlob=o}(this);