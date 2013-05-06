(function(){this.Mercury.Statusbar=function(){function t(t){this.options=null!=t?t:{},this.visible=this.options.visible,this.build(),this.bindEvents()}return t.prototype.build=function(){var t;return this.element=jQuery("<div>",{"class":"mercury-statusbar"}),this.aboutElement=jQuery("<a>",{"class":"mercury-statusbar-about"}).appendTo(this.element).html("Mercury Editor v"+Mercury.version),this.pathElement=jQuery("<div>",{"class":"mercury-statusbar-path"}).appendTo(this.element),this.visible||this.element.css({visibility:"hidden"}),this.element.appendTo(null!=(t=jQuery(this.options.appendTo).get(0))?t:"body")},t.prototype.bindEvents=function(){var t=this;return Mercury.on("region:update",function(e,i){return i.region&&"function"===jQuery.type(i.region.path)?t.setPath(i.region.path()):void 0}),this.aboutElement.on("click",function(){return Mercury.lightview("/mercury/lightviews/about.html",{title:"Mercury Editor v"+Mercury.version})})},t.prototype.height=function(){return this.element.outerHeight()},t.prototype.top=function(){var t,e;return e=this.element.offset().top,t=0>parseInt(this.element.css("bottom"))?e-this.element.outerHeight():e,this.visible?t:e+this.element.outerHeight()},t.prototype.setPath=function(t){var e,i,n,s;for(i=[],n=0,s=t.length;s>n;n++)e=t[n],i.push("<a>"+e.tagName.toLowerCase()+"</a>");return this.pathElement.html("<span><strong>"+Mercury.I18n("Path:")+" </strong>"+i.reverse().join(" &raquo; ")+"</span>")},t.prototype.show=function(){return this.visible=!0,this.element.css({opacity:0,visibility:"visible"}),this.element.animate({opacity:1},200,"easeInOutSine")},t.prototype.hide=function(){return this.visible=!1,this.element.css({visibility:"hidden"})},t}()}).call(this);