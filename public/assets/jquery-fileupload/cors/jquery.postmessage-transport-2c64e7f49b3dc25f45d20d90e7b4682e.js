/*
 * jQuery postMessage Transport Plugin 1.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
!function(t){"use strict";"function"==typeof define&&define.amd?define(["jquery"],t):t(window.jQuery)}(function(t){"use strict";var e=0,i=["accepts","cache","contents","contentType","crossDomain","data","dataType","headers","ifModified","mimeType","password","processData","timeout","traditional","type","url","username"],n=function(t){return t};t.ajaxSetup({converters:{"postmessage text":n,"postmessage json":n,"postmessage html":n}}),t.ajaxTransport("postmessage",function(n){if(n.postMessage&&window.postMessage){var s,o=t("<a>").prop("href",n.postMessage)[0],a=o.protocol+"//"+o.host,r=n.xhr().upload;return{send:function(o,l){var c={id:"postmessage-transport-"+(e+=1)},u="message."+c.id;s=t('<iframe style="display:none;" src="'+n.postMessage+'" name="'+c.id+'"></iframe>').bind("load",function(){t.each(i,function(t,e){c[e]=n[e]}),c.dataType=c.dataType.replace("postmessage ",""),t(window).bind(u,function(e){e=e.originalEvent;var i,n=e.data;e.origin===a&&n.id===c.id&&("progress"===n.type?(i=document.createEvent("Event"),i.initEvent(n.type,!1,!0),t.extend(i,n),r.dispatchEvent(i)):(l(n.status,n.statusText,{postmessage:n.result},n.headers),s.remove(),t(window).unbind(u)))}),s[0].contentWindow.postMessage(c,a)}).appendTo(document.body)},abort:function(){s&&s.remove()}}}})});