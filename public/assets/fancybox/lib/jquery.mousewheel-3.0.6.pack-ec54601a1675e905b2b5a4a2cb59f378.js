/*! Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.0.6
 * 
 * Requires: 1.2.2+
 */
!function(t){function e(e){var i=e||window.event,n=[].slice.call(arguments,1),s=0,o=0,a=0,e=t.event.fix(i);return e.type="mousewheel",i.wheelDelta&&(s=i.wheelDelta/120),i.detail&&(s=-i.detail/3),a=s,void 0!==i.axis&&i.axis===i.HORIZONTAL_AXIS&&(a=0,o=-1*s),void 0!==i.wheelDeltaY&&(a=i.wheelDeltaY/120),void 0!==i.wheelDeltaX&&(o=-1*i.wheelDeltaX/120),n.unshift(e,s,o,a),(t.event.dispatch||t.event.handle).apply(this,n)}var i=["DOMMouseScroll","mousewheel"];if(t.event.fixHooks)for(var n=i.length;n;)t.event.fixHooks[i[--n]]=t.event.mouseHooks;t.event.special.mousewheel={setup:function(){if(this.addEventListener)for(var t=i.length;t;)this.addEventListener(i[--t],e,!1);else this.onmousewheel=e},teardown:function(){if(this.removeEventListener)for(var t=i.length;t;)this.removeEventListener(i[--t],e,!1);else this.onmousewheel=null}},t.fn.extend({mousewheel:function(t){return t?this.bind("mousewheel",t):this.trigger("mousewheel")},unmousewheel:function(t){return this.unbind("mousewheel",t)}})}(jQuery);