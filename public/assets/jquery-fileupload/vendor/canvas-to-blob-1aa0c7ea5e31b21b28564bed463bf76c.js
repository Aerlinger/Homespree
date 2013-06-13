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
!function(t){"use strict";var e=t.HTMLCanvasElement&&t.HTMLCanvasElement.prototype,i=t.Blob&&function(){try{return Boolean(new Blob)}catch(t){return!1}}(),n=i&&t.Uint8Array&&function(){try{return 100===new Blob([new Uint8Array(100)]).size}catch(t){return!1}}(),s=t.BlobBuilder||t.WebKitBlobBuilder||t.MozBlobBuilder||t.MSBlobBuilder,o=(i||s)&&t.atob&&t.ArrayBuffer&&t.Uint8Array&&function(t){var e,o,a,r,l,c;for(e=t.split(",")[0].indexOf("base64")>=0?atob(t.split(",")[1]):decodeURIComponent(t.split(",")[1]),o=new ArrayBuffer(e.length),a=new Uint8Array(o),r=0;r<e.length;r+=1)a[r]=e.charCodeAt(r);return l=t.split(",")[0].split(":")[1].split(";")[0],i?new Blob([n?a:o],{type:l}):(c=new s,c.append(o),c.getBlob(l))};t.HTMLCanvasElement&&!e.toBlob&&(e.mozGetAsFile?e.toBlob=function(t,e){t(this.mozGetAsFile("blob",e))}:e.toDataURL&&o&&(e.toBlob=function(t,e){t(o(this.toDataURL(e)))})),"function"==typeof define&&define.amd?define(function(){return o}):t.dataURLtoBlob=o}(this);