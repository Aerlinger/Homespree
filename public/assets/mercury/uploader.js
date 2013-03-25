(function(){var e={}.hasOwnProperty;this.Mercury.uploader=function(e,t){return Mercury.config.uploading.enabled&&Mercury.uploader.show(e,t),Mercury.uploader},jQuery.extend(Mercury.uploader,{show:function(e,t){this.options=t!=null?t:{},this.file=new Mercury.uploader.File(e);if(this.file.errors){alert("Error: "+this.file.errors);return}if(!this.supported())return;return Mercury.trigger("focus:window"),this.initialize(),this.appear()},initialize:function(){if(this.initialized)return;return this.build(),this.bindEvents(),this.initialized=!0},supported:function(){var e;return e=new XMLHttpRequest,window.Uint8Array&&window.ArrayBuffer&&!XMLHttpRequest.prototype.sendAsBinary&&(XMLHttpRequest.prototype.sendAsBinary=function(e){var t,n,r,i,s;r=new Uint8Array(e.length);for(n=i=0,s=e.length;i<s;n=++i)t=e[n],r[n]=e.charCodeAt(n)&255;return this.send(r.buffer)}),!(!e.upload||!e.sendAsBinary||!Mercury.uploader.fileReaderSupported()&&!Mercury.uploader.formDataSupported())},fileReaderSupported:function(){return!!window.FileReader},formDataSupported:function(){return!!window.FormData},build:function(){var e,t;return this.element=jQuery("<div>",{"class":"mercury-uploader",style:"display:none"}),this.element.append('<div class="mercury-uploader-preview"><b><img/></b></div>'),this.element.append('<div class="mercury-uploader-details"></div>'),this.element.append('<div class="mercury-uploader-progress"><span></span><div class="mercury-uploader-indicator"><div><b>0%</b></div></div></div>'),this.updateStatus("Processing..."),this.overlay=jQuery("<div>",{"class":"mercury-uploader-overlay",style:"display:none"}),this.element.appendTo((e=jQuery(this.options.appendTo).get(0))!=null?e:"body"),this.overlay.appendTo((t=jQuery(this.options.appendTo).get(0))!=null?t:"body")},bindEvents:function(){var e=this;return Mercury.on("resize",function(){return e.position()})},appear:function(){var e=this;return this.fillDisplay(),this.position(),this.overlay.show(),this.overlay.animate({opacity:1},200,"easeInOutSine",function(){return e.element.show(),e.element.animate({opacity:1},200,"easeInOutSine",function(){return e.visible=!0,e.loadImage()})})},position:function(){var e,t;return t=this.element.outerWidth(),e=this.element.outerHeight(),this.element.css({top:(Mercury.displayRect.height-e)/2,left:(Mercury.displayRect.width-t)/2})},fillDisplay:function(){var e;return e=[Mercury.I18n("Name: %s",this.file.name),Mercury.I18n("Size: %s",this.file.readableSize),Mercury.I18n("Type: %s",this.file.type)],this.element.find(".mercury-uploader-details").html(e.join("<br/>"))},loadImage:function(){var e=this;return Mercury.uploader.fileReaderSupported()?this.file.readAsDataURL(function(t){return e.element.find(".mercury-uploader-preview b").html(jQuery("<img>",{src:t})),e.upload()}):this.upload()},upload:function(){var e,t,n=this;return t=new XMLHttpRequest,jQuery.each(["onloadstart","onprogress","onload","onabort","onerror"],function(e,r){return t.upload[r]=function(e){return n.uploaderEvents[r].call(n,e)}}),t.onload=function(e){var t,r,i;if(e.currentTarget.status>=400)return n.updateStatus("Error: Unable to upload the file"),Mercury.notify("Unable to process response: %s",e.currentTarget.status),n.hide();try{r=Mercury.config.uploading.handler?Mercury.config.uploading.handler(e.target.responseText):jQuery.parseJSON(e.target.responseText),i=r.url||r.image.url;if(!i)throw"Malformed response from server.";return Mercury.trigger("action",{action:"insertImage",value:{src:i}}),n.hide()}catch(s){return t=s,n.updateStatus("Error: Unable to upload the file"),Mercury.notify("Unable to process response: %s",t),n.hide()}},t.open("post",Mercury.config.uploading.url,!0),t.setRequestHeader("Accept","application/json, text/javascript, text/html, application/xml, text/xml, */*"),t.setRequestHeader("X-Requested-With","XMLHttpRequest"),t.setRequestHeader(Mercury.config.csrfHeader,Mercury.csrfToken),Mercury.uploader.fileReaderSupported()?this.file.readAsBinaryString(function(e){var r;return r=new Mercury.uploader.MultiPartPost(Mercury.config.uploading.inputName,n.file,e),n.file.updateSize(r.delta),t.setRequestHeader("Content-Type","multipart/form-data; boundary="+r.boundary),t.sendAsBinary(r.body)}):(e=new FormData,e.append(Mercury.config.uploading.inputName,this.file.file,this.file.file.name),t.send(e))},updateStatus:function(e,t){var n;this.element.find(".mercury-uploader-progress span").html(Mercury.I18n(e).toString());if(t)return n=Math.floor(t*100/this.file.size)+"%",this.element.find(".mercury-uploader-indicator div").css({width:n}),this.element.find(".mercury-uploader-indicator b").html(n).show()},hide:function(e){var t=this;return e==null&&(e=0),setTimeout(function(){return t.element.animate({opacity:0},200,"easeInOutSine",function(){return t.overlay.animate({opacity:0},200,"easeInOutSine",function(){return t.overlay.hide(),t.element.hide(),t.reset(),t.visible=!1,Mercury.trigger("focus:frame")})})},e*1e3)},reset:function(){return this.element.find(".mercury-uploader-preview b").html(""),this.element.find(".mercury-uploader-indicator div").css({width:0}),this.element.find(".mercury-uploader-indicator b").html("0%").hide(),this.updateStatus("Processing...")},uploaderEvents:{onloadstart:function(){return this.updateStatus("Uploading...")},onprogress:function(e){return this.updateStatus("Uploading...",e.loaded)},onabort:function(){return this.updateStatus("Aborted"),this.hide(1)},onload:function(){return this.updateStatus("Successfully uploaded...",this.file.size)},onerror:function(){return this.updateStatus("Error: Unable to upload the file"),this.hide(3)}}}),Mercury.uploader.File=function(){function e(e){var t;this.file=e,this.fullSize=this.size=this.file.size||this.file.fileSize,this.readableSize=this.size.toBytes(),this.name=this.file.name||this.file.fileName,this.type=this.file.type||this.file.fileType,t=[],this.size>=Mercury.config.uploading.maxFileSize&&t.push(Mercury.I18n("Too large")),Mercury.config.uploading.allowedMimeTypes.indexOf(this.type)>-1||t.push(Mercury.I18n("Unsupported format")),t.length&&(this.errors=t.join(" / "))}return e.prototype.readAsDataURL=function(e){var t,n=this;return e==null&&(e=null),t=new FileReader,t.readAsDataURL(this.file),t.onload=function(){if(e)return e(t.result)}},e.prototype.readAsBinaryString=function(e){var t,n=this;return e==null&&(e=null),t=new FileReader,t.readAsBinaryString(this.file),t.onload=function(){if(e)return e(t.result)}},e.prototype.updateSize=function(e){return this.fullSize=this.size+e},e}(),Mercury.uploader.MultiPartPost=function(){function t(e,t,n,r){this.inputName=e,this.file=t,this.contents=n,this.formInputs=r!=null?r:{},this.boundary="Boundaryx20072377098235644401115438165x",this.body="",this.buildBody(),this.delta=this.body.length-this.file.size}return t.prototype.buildBody=function(){var t,n,r,i;t="--"+this.boundary,i=this.formInputs;for(n in i){if(!e.call(i,n))continue;r=i[n],this.body+=""+t+'\r\nContent-Disposition: form-data; name="'+n+'"\r\n\r\n'+unescape(encodeURIComponent(r))+"\r\n"}return this.body+=""+t+'\r\nContent-Disposition: form-data; name="'+this.inputName+'"; filename="'+this.file.name+'"\r\nContent-Type: '+this.file.type+"\r\nContent-Transfer-Encoding: binary\r\n\r\n"+this.contents+"\r\n"+t+"--"},t}()}).call(this);