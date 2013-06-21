/*
 * jQuery UI Touch Punch 0.2.2
 *
 * Copyright 2011, Dave Furfero
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Depends:
 *  jquery.ui.widget.js
 *  jquery.ui.mouse.js
 */
!function(t){function e(t,e){if(!(t.originalEvent.touches.length>1)){t.preventDefault();var i=t.originalEvent.changedTouches[0],n=document.createEvent("MouseEvents");n.initMouseEvent(e,!0,!0,window,1,i.screenX,i.screenY,i.clientX,i.clientY,!1,!1,!1,!1,0,null),t.target.dispatchEvent(n)}}if(t.support.touch="ontouchend"in document,t.support.touch){var i,n=t.ui.mouse.prototype,s=n._mouseInit;n._touchStart=function(t){var n=this;!i&&n._mouseCapture(t.originalEvent.changedTouches[0])&&(i=!0,n._touchMoved=!1,e(t,"mouseover"),e(t,"mousemove"),e(t,"mousedown"))},n._touchMove=function(t){i&&(this._touchMoved=!0,e(t,"mousemove"))},n._touchEnd=function(t){i&&(e(t,"mouseup"),e(t,"mouseout"),this._touchMoved||e(t,"click"),i=!1)},n._mouseInit=function(){var e=this;e.element.bind("touchstart",t.proxy(e,"_touchStart")).bind("touchmove",t.proxy(e,"_touchMove")).bind("touchend",t.proxy(e,"_touchEnd")),s.call(e)}}}(jQuery);