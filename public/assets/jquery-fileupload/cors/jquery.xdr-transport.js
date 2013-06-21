/*
 * jQuery XDomainRequest Transport Plugin 1.1.3
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 *
 * Based on Julian Aubourg's ajaxHooks xdr.js:
 * https://github.com/jaubourg/ajaxHooks/
 */
!function(t){"use strict";"function"==typeof define&&define.amd?define(["jquery"],t):t(window.jQuery)}(function(t){"use strict";window.XDomainRequest&&!t.support.cors&&t.ajaxTransport(function(e){if(e.crossDomain&&e.async){e.timeout&&(e.xdrTimeout=e.timeout,delete e.timeout);var i;return{send:function(n,s){function o(e,n,o,a){i.onload=i.onerror=i.ontimeout=t.noop,i=null,s(e,n,o,a)}var a=/\?/.test(e.url)?"&":"?";i=new XDomainRequest,"DELETE"===e.type?(e.url=e.url+a+"_method=DELETE",e.type="POST"):"PUT"===e.type?(e.url=e.url+a+"_method=PUT",e.type="POST"):"PATCH"===e.type&&(e.url=e.url+a+"_method=PATCH",e.type="POST"),i.open(e.type,e.url),i.onload=function(){o(200,"OK",{text:i.responseText},"Content-Type: "+i.contentType)},i.onerror=function(){o(404,"Not Found")},e.xdrTimeout&&(i.ontimeout=function(){o(0,"timeout")},i.timeout=e.xdrTimeout),i.send(e.hasContent&&e.data||null)},abort:function(){i&&(i.onerror=t.noop(),i.abort())}}}})});