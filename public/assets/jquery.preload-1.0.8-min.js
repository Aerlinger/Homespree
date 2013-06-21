/**
 * jQuery.Preload - Multifunctional preloader
 * Copyright (c) 2008 Ariel Flesler - aflesler(at)gmail(dot)com
 * Dual licensed under MIT and GPL.
 * Date: 3/25/2009
 * @author Ariel Flesler
 * @version 1.0.8
 */
!function(t){var e=t.preload=function(i,n){function s(s){l.element=this,l.found="load"==s.type,l.image=this.src,l.index=this.index;var r=l.original=i[this.index];l[l.found?"loaded":"failed"]++,l.done++,n.enforceCache&&e.cache.push(t("<img/>").attr("src",l.image)[0]),n.placeholder&&r.src&&(r.src=l.found?l.image:n.notFound||r.src),n.onComplete&&n.onComplete(l),l.done<l.total?o(0,this):(c&&c.unbind&&c.unbind("load").unbind("error").unbind("abort"),c=null,a())}function o(t,s,a){return s.attachEvent&&l.next&&0==l.next%e.gap&&!a?(setTimeout(function(){o(t,s,1)},0),!1):l.next==l.total?!1:(s.index=l.next,s.src=r[l.next++],n.onRequest&&(l.index=s.index,l.element=s,l.image=s.src,l.original=i[l.next-1],n.onRequest(l)),void 0)}function a(){n.onFinish&&n.onFinish(l)}i.split&&(i=t(i)),n=t.extend({},e.defaults,n);var r=t.map(i,function(t){if(t){if(t.split)return n.base+t+n.ext;var e=t.src||t.href;return"string"==typeof n.placeholder&&t.src&&(t.src=n.placeholder),e&&n.find&&(e=e.replace(n.find,n.replace)),e||null}}),l={loaded:0,failed:0,next:0,done:0,total:r.length};if(!l.total)return a();var c=t(Array(n.threshold+1).join("<img/>")).load(s).error(s).bind("abort",s).each(o)};e.gap=14,e.cache=[],e.defaults={threshold:2,base:"",ext:"",replace:""},t.fn.preload=function(t){return e(this,t),this}}(jQuery);