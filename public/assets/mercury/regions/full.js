!function(){var e={}.hasOwnProperty,t=function(t,i){function n(){this.constructor=t}for(var r in i)e.call(i,r)&&(t[r]=i[r]);return n.prototype=i.prototype,t.prototype=new n,t.__super__=i.prototype,t},i=[].indexOf||function(e){for(var t=0,i=this.length;i>t;t++)if(t in this&&this[t]===e)return t;return-1};this.Mercury.Regions.Full=function(e){function n(e,t,i){this.element=e,this.window=t,this.options=null!=i?i:{},n.__super__.constructor.apply(this,arguments)}var r;return t(n,e),n.supported=document.designMode&&!jQuery.browser.konqueror&&!jQuery.browser.msie,n.supportedText="Chrome 10+, Firefox 4+, Safari 5+, Opera 11.64+",r="full",n.prototype.type=function(){return r},n.prototype.build=function(){var e,t,i,n,r;for(jQuery.browser.mozilla&&""===this.content()&&this.content("&nbsp;"),this.element.data({originalOverflow:this.element.css("overflow")}),this.element.css({overflow:"auto"}),this.specialContainer=jQuery.browser.mozilla&&"DIV"!==this.element.get(0).tagName,this.element.get(0).contentEditable=!0,r=this.element.find("[data-snippet]"),i=0,n=r.length;n>i;i++)t=r[i],t.contentEditable=!1,jQuery(t).attr("data-version","1");if(!this.document.mercuryEditing){this.document.mercuryEditing=!0;try{return this.document.execCommand("styleWithCSS",!1,!1),this.document.execCommand("insertBROnReturn",!1,!0),this.document.execCommand("enableInlineTableEditing",!1,!1),this.document.execCommand("enableObjectResizing",!1,!1)}catch(o){e=o}}},n.prototype.bindEvents=function(){var e=this;return n.__super__.bindEvents.apply(this,arguments),Mercury.on("region:update",function(){var t,i,n;if(!e.previewing&&Mercury.region===e)return setTimeout(function(){return e.selection().forceSelection(e.element.get(0))},1),i=e.currentElement(),i.length?(n=i.closest("table",e.element),n.length&&Mercury.tableEditor(n,i.closest("tr, td"),"<br/>"),t=i.closest("a",e.element),t.length&&t.attr("href")?Mercury.tooltip(t,'<a href="'+t.attr("href")+'" target="_blank">'+t.attr("href")+"</a>",{position:"below"}):Mercury.tooltip.hide()):void 0}),this.element.on("dragenter",function(t){return e.previewing?void 0:(Mercury.snippet||t.preventDefault(),t.originalEvent.dataTransfer.dropEffect="copy")}),this.element.on("dragover",function(t){return e.previewing?void 0:(Mercury.snippet||t.preventDefault(),t.originalEvent.dataTransfer.dropEffect="copy",jQuery.browser.webkit?(clearTimeout(e.dropTimeout),e.dropTimeout=setTimeout(function(){return e.element.trigger("possible:drop")},10)):void 0)}),this.element.on("drop",function(t){return!e.previewing&&(clearTimeout(e.dropTimeout),e.dropTimeout=setTimeout(function(){return e.element.trigger("possible:drop")},1),t.originalEvent.dataTransfer.files.length)?(t.preventDefault(),e.focus(),Mercury.uploader(t.originalEvent.dataTransfer.files[0])):void 0}),this.element.on("possible:drop",function(){var t;if(!e.previewing)return(t=e.element.find("img[data-snippet]").get(0))?(e.focus(),Mercury.Snippet.displayOptionsFor(jQuery(t).data("snippet"),{},jQuery(t).data("options")),e.document.execCommand("undo",!1,null)):void 0}),this.element.on("paste",function(t){if(!e.previewing&&Mercury.region===e){if(e.specialContainer)return t.preventDefault(),void 0;if(!e.pasting)return Mercury.changes=!0,e.handlePaste(t.originalEvent)}}),this.element.on("focus",function(){return e.previewing?void 0:(Mercury.region=e,setTimeout(function(){return e.selection().forceSelection(e.element.get(0))},1),Mercury.trigger("region:focused",{region:e}))}),this.element.on("blur",function(){return e.previewing?void 0:(Mercury.trigger("region:blurred",{region:e}),Mercury.tooltip.hide())}),this.element.on("click",function(t){return e.previewing?jQuery(t.target).closest("a").attr("target","_parent"):void 0}),this.element.on("dblclick",function(t){var i;if(!e.previewing)return i=jQuery(t.target).closest("img",e.element),i.length?(e.selection().selectNode(i.get(0),!0),Mercury.trigger("button",{action:"insertMedia"})):void 0}),this.element.on("mouseup",function(){return e.previewing?void 0:(e.pushHistory(),Mercury.trigger("region:update",{region:e}))}),this.element.on("keydown",function(t){var i;if(!e.previewing){switch(t.keyCode){case 90:if(!t.metaKey)return;return t.preventDefault(),t.shiftKey?e.execCommand("redo"):e.execCommand("undo"),void 0;case 13:jQuery.browser.webkit&&0===e.selection().commonAncestor().closest("li, ul, ol",e.element).length?(t.preventDefault(),e.document.execCommand("insertParagraph",!1,null)):(e.specialContainer||jQuery.browser.opera)&&(t.preventDefault(),e.document.execCommand("insertHTML",!1,"<br/>"));break;case 9:t.preventDefault(),i=e.selection().commonAncestor(),i.closest("li",e.element).length?t.shiftKey?i.parents("ul, ol").length>1&&e.execCommand("outdent"):e.execCommand("indent"):e.execCommand("insertHTML",{value:"&nbsp;&nbsp;"})}if(t.metaKey)switch(t.keyCode){case 66:e.execCommand("bold"),t.preventDefault();break;case 73:e.execCommand("italic"),t.preventDefault();break;case 85:e.execCommand("underline"),t.preventDefault()}return e.pushHistory(t.keyCode)}}),this.element.on("keyup",function(){return e.previewing?void 0:(Mercury.trigger("region:update",{region:e}),Mercury.changes=!0)})},n.prototype.focus=function(){var e,t=this;if(Mercury.region!==this){setTimeout(function(){return t.element.focus()},10);try{this.selection().selection.collapseToStart()}catch(i){e=i}}else setTimeout(function(){return t.element.focus()},10);return Mercury.trigger("region:focused",{region:this}),Mercury.trigger("region:update",{region:this})},n.prototype.content=function(e,t,i){var n,r,o,s,a,l,c,u,h,d,p,f,m,g;if(null==e&&(e=null),null==t&&(t=!0),null==i&&(i=!1),null!==e){for(n=jQuery("<div>").appendTo(this.document.createDocumentFragment()),n.html(e),m=n.find("[data-snippet]"),h=0,p=m.length;p>h;h++)if(o=m[h],o.contentEditable=!1,o=jQuery(o),c=Mercury.Snippet.find(o.data("snippet")))if(o.data("version"))c.setVersion(o.data("version"));else try{u=parseInt(o.html().match(/\/(\d+)\]/)[1]),u&&(c.setVersion(u),o.attr({"data-version":u}),o.html(c.data))}catch(v){s=v}return this.element.html(n.html()),this.selection().selectMarker(this.element)}if(this.element.find("meta").remove(),i&&(l=this.selection(),l.placeMarker()),n=jQuery("<div>").appendTo(this.document.createDocumentFragment()),n.html(this.element.html().replace(/^\s+|\s+$/g,"")),t)for(g=n.find("[data-snippet]"),a=d=0,f=g.length;f>d;a=++d)o=g[a],o=jQuery(o),(c=Mercury.Snippet.find(o.data("snippet")))&&(c.data=o.html()),o.html("["+o.data("snippet")+"/"+o.data("version")+"]"),o.attr({contenteditable:null,"data-version":null});return r=n.html(),i&&l.removeMarker(),r},n.prototype.togglePreview=function(){return this.previewing?(this.element.get(0).contentEditable=!0,this.element.css({overflow:"auto"})):(this.content(this.content()),this.element.get(0).contentEditable=!1,this.element.css({overflow:this.element.data("originalOverflow")}),this.element.blur()),n.__super__.togglePreview.apply(this,arguments)},n.prototype.execCommand=function(e,t){var i,r,o;if(null==t&&(t={}),n.__super__.execCommand.apply(this,arguments),r=Mercury.config.behaviors[e]||Mercury.Regions.Full.actions[e])r.call(this,this.selection(),t);else{"indent"===e&&(o=this.element.get(0).previousSibling),"insertHTML"===e&&t.value&&t.value.get&&(t.value=jQuery("<div>").html(t.value).html());try{this.document.execCommand(e,!1,t.value)}catch(s){i=s,"indent"===e&&this.element.prev()!==o&&this.element.prev().remove()}}return this.element.find("img").one("error",function(){return jQuery(this).attr({src:"/assets/mercury/missing-image.png",title:"Image not found"})})},n.prototype.pushHistory=function(e){var t,i,n,r=this;return t=[13,46,8],n=2.5,e&&(i=t.indexOf(e)),clearTimeout(this.historyTimeout),i>=0&&i!==this.lastKnownKeyCode?this.history.push(this.content(null,!1,!0)):e?this.historyTimeout=setTimeout(function(){return r.history.push(r.content(null,!1,!0))},1e3*n):this.history.push(this.content(null,!1,!0)),this.lastKnownKeyCode=i},n.prototype.selection=function(){return new Mercury.Regions.Full.Selection(this.window.getSelection(),this.document)},n.prototype.path=function(){var e;return e=this.selection().commonAncestor(),e?e.get(0)===this.element.get(0)?[]:e.parentsUntil(this.element):[]},n.prototype.currentElement=function(){var e,t;return e=[],t=this.selection(),t.range&&(e=t.commonAncestor(),3===e.get(0).nodeType&&(e=e.parent())),e},n.prototype.handlePaste=function(e){var t,i,n=this;return"text"===Mercury.config.pasting.sanitize&&e.clipboardData?(this.execCommand("insertHTML",{value:e.clipboardData.getData("text/plain")}),e.preventDefault(),void 0):(i=this.selection(),i.placeMarker(),t=jQuery("#mercury_sanitizer",this.document).focus(),setTimeout(function(){var e;return e=n.sanitize(t),i.selectMarker(n.element),i.removeMarker(),n.element.focus(),n.execCommand("insertHTML",{value:e})},1))},n.prototype.sanitize=function(e){var t,n,r,o,s,a,l,c,u,h,d,p,f,m;if(e.find("["+Mercury.config.regions.attribute+"]").remove(),e.find('[src*="webkit-fake-url://"]').remove(),Mercury.config.pasting.sanitize)switch(Mercury.config.pasting.sanitize){case"blacklist":e.find("[style]").removeAttr("style"),e.find('[class="Apple-style-span"]').removeClass("Apple-style-span"),s=e.html();break;case"whitelist":for(d=e.find("*"),l=0,u=d.length;u>l;l++){a=d[l],t=!1,p=Mercury.config.pasting.whitelist;for(r in p)if(n=p[r],a.tagName.toLowerCase()===r.toLowerCase()){for(t=!0,f=jQuery(a.attributes),c=0,h=f.length;h>c;c++)o=f[c],m=o.name,i.call(n,m)<0&&jQuery(a).removeAttr(o.name);break}t||jQuery(a).replaceWith(jQuery(a).contents())}s=e.html();break;default:s=e.text()}else s=e.html(),(s.indexOf("<!--StartFragment-->")>-1||s.indexOf('="mso-')>-1||s.indexOf("<o:")>-1||s.indexOf('="Mso')>-1)&&(s=e.text());return e.html(""),s},n.actions={insertRowBefore:function(){return Mercury.tableEditor.addRow("before")},insertRowAfter:function(){return Mercury.tableEditor.addRow("after")},insertColumnBefore:function(){return Mercury.tableEditor.addColumn("before")},insertColumnAfter:function(){return Mercury.tableEditor.addColumn("after")},deleteColumn:function(){return Mercury.tableEditor.removeColumn()},deleteRow:function(){return Mercury.tableEditor.removeRow()},increaseColspan:function(){return Mercury.tableEditor.increaseColspan()},decreaseColspan:function(){return Mercury.tableEditor.decreaseColspan()},increaseRowspan:function(){return Mercury.tableEditor.increaseRowspan()},decreaseRowspan:function(){return Mercury.tableEditor.decreaseRowspan()},undo:function(){return this.content(this.history.undo())},redo:function(){return this.content(this.history.redo())},horizontalRule:function(){return this.execCommand("insertHTML",{value:"<hr/>"})},removeFormatting:function(e){return e.insertTextNode(e.textContent())},backColor:function(e,t){return e.wrap('<span style="background-color:'+t.value.toHex()+'">',!0)},overline:function(e){return e.wrap('<span style="text-decoration:overline">',!0)},style:function(e,t){return e.wrap('<span class="'+t.value+'">',!0)},replaceHTML:function(e,t){return this.content(t.value)},insertImage:function(e,t){return this.execCommand("insertHTML",{value:jQuery("<img/>",t.value)})},insertTable:function(e,t){return this.execCommand("insertHTML",{value:t.value})},insertLink:function(e,t){var i;return i=jQuery("<"+t.value.tagName+">",this.document).attr(t.value.attrs).html(t.value.content),e.insertNode(i)},replaceLink:function(e,t){var i,n;return i=jQuery("<"+t.value.tagName+">",this.document).attr(t.value.attrs).html(t.value.content),e.selectNode(t.node),n=jQuery("<div>").html(e.content()).find("a").html(),e.replace(jQuery(i,e.context).html(n))},insertSnippet:function(e,t){var i,n;return n=t.value,(i=this.element.find("[data-snippet="+n.identity+"]")).length&&e.selectNode(i.get(0)),e.insertNode(n.getHTML(this.document))},editSnippet:function(){var e;if(this.snippet)return e=Mercury.Snippet.find(this.snippet.data("snippet")),e.displayOptions()},removeSnippet:function(){return this.snippet&&this.snippet.remove(),Mercury.trigger("hide:toolbar",{type:"snippet",immediately:!0})}},n}(Mercury.Region),Mercury.Regions.Full.Selection=function(){function e(e,t){this.selection=e,this.context=t,this.selection.rangeCount>=1&&(this.range=this.selection.getRangeAt(0),this.fragment=this.range.cloneContents(),this.clone=this.range.cloneRange(),this.collapsed=this.selection.isCollapsed)}return e.prototype.commonAncestor=function(e){var t;return null==e&&(e=!1),this.range?(t=this.range.commonAncestorContainer,3===t.nodeType&&e&&(t=t.parentNode),jQuery(t)):null},e.prototype.wrap=function(e,t){return null==t&&(t=!1),e=jQuery(e,this.context).html(this.fragment),t&&this.replace(e),e},e.prototype.textContent=function(){return this.content().textContent},e.prototype.htmlContent=function(){var e;return e=this.content(),jQuery("<div>").html(e).html()},e.prototype.content=function(){return this.range.cloneContents()},e.prototype.is=function(e){var t;return t=this.content(),1===jQuery(t).length&&jQuery(t.firstChild).is(e)?jQuery(t.firstChild):!1},e.prototype.forceSelection=function(e){var t,i;if(jQuery.browser.webkit)return i=this.context.createRange(),this.range?this.commonAncestor(!0).closest("[data-snippet]").length&&(t=this.context.createTextNode("\0"),e.appendChild(t)):e.lastChild&&3===e.lastChild.nodeType&&""===e.lastChild.textContent.replace(/^[\s+|\n+]|[\s+|\n+]$/,"")?(t=e.lastChild,e.lastChild.textContent="\0"):(t=this.context.createTextNode("\0"),e.appendChild(t)),t?(i.setStartBefore(t),i.setEndBefore(t),this.selection.addRange(i)):void 0},e.prototype.selectMarker=function(e){var t,i;return t=e.find("em.mercury-marker"),t.length?(i=this.context.createRange(),i.setStartBefore(t.get(0)),t.length>=2&&i.setEndBefore(t.get(1)),t.remove(),this.selection.removeAllRanges(),this.selection.addRange(i)):void 0},e.prototype.placeMarker=function(){var e,t;if(this.range)return this.startMarker=jQuery('<em class="mercury-marker"/>',this.context).get(0),this.endMarker=jQuery('<em class="mercury-marker"/>',this.context).get(0),e=this.range.cloneRange(),e.collapse(!1),e.insertNode(this.endMarker),this.range.collapsed||(t=this.range.cloneRange(),t.collapse(!0),t.insertNode(this.startMarker)),this.selection.removeAllRanges(),this.selection.addRange(this.range)},e.prototype.removeMarker=function(){return jQuery(this.startMarker).remove(),jQuery(this.endMarker).remove()},e.prototype.insertTextNode=function(e){var t;return t=this.context.createTextNode(e),this.range.extractContents(),this.range.insertNode(t),this.range.selectNodeContents(t),this.selection.addRange(this.range)},e.prototype.insertNode=function(e){return e.get&&(e=e.get(0)),"string"===jQuery.type(e)&&(e=jQuery(e,this.context).get(0)),this.range.deleteContents(),this.range.insertNode(e),this.range.selectNodeContents(e),this.selection.addRange(this.range)},e.prototype.selectNode=function(e,t){return null==t&&(t=!1),this.range.selectNode(e),t&&this.selection.removeAllRanges(),this.selection.addRange(this.range)},e.prototype.replace=function(e,t){return e.get&&(e=e.get(0)),"string"===jQuery.type(e)&&(e=jQuery(e,this.context).get(0)),this.range.deleteContents(),this.range.insertNode(e),this.range.selectNodeContents(e),this.selection.addRange(this.range),t?this.range.collapse(!1):void 0},e}()}.call(this);