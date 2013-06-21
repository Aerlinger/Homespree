/**
 * jquery.purr.js
 * Copyright (c) 2008 Net Perspective (net-perspective.com)
 * Licensed under the MIT License (http://www.opensource.org/licenses/mit-license.php)
 *
 * @author R.A. Ray
 * @projectDescription  jQuery plugin for dynamically displaying unobtrusive messages in the browser. Mimics the behavior of the MacOS program "Growl."
 * @version 0.1.0
 *
 * @requires jquery.js (tested with 1.2.6)
 *
 * @param fadeInSpeed           int - Duration of fade in animation in miliseconds
 *                          default: 500
 *  @param fadeOutSpeed         int - Duration of fade out animationin miliseconds
                            default: 500
 *  @param removeTimer          int - Timeout, in miliseconds, before notice is removed once it is the top non-sticky notice in the list
                            default: 4000
 *  @param isSticky             bool - Whether the notice should fade out on its own or wait to be manually closed
                            default: false
 *  @param usingTransparentPNG  bool - Whether or not the notice is using transparent .png images in its styling
                            default: false
 */
!function(t){t.purr=function(e,i){function n(){var n=document.createElement("a");if(t(n).attr({className:"close",href:"#close"}).appendTo(e).click(function(){return s(),!1}),t(document).keyup(function(t){27===t.keyCode&&s()}),e.appendTo(o).hide(),e.fadeIn(i.fadeInSpeed),!i.isSticky)var a=setInterval(function(){0===e.prevAll(".purr").length&&(clearInterval(a),setTimeout(function(){s()},i.removeTimer))},200)}function s(){e.animate({opacity:"0"},{duration:i.fadeOutSpeed,complete:function(){e.animate({height:"0px"},{duration:i.fadeOutSpeed,complete:function(){e.remove()}})}})}e=t(e),e.addClass("purr");var o=document.getElementById("purr-container");o||(o='<div id="purr-container"></div>'),o=t(o),t("body").append(o),n()},t.fn.purr=function(e){return e=e||{},e.fadeInSpeed=e.fadeInSpeed||500,e.fadeOutSpeed=e.fadeOutSpeed||500,e.removeTimer=e.removeTimer||4e3,e.isSticky=e.isSticky||!1,e.usingTransparentPNG=e.usingTransparentPNG||!1,this.each(function(){new t.purr(this,e)}),this}}(jQuery),jQuery(document).on("best_in_place:error",function(t,e){jQuery.each(jQuery.parseJSON(e.responseText),function(t,e){"object"==typeof e&&(e=t+" "+e.toString());var i=jQuery("<span class='flash-error'></span>").html(e);i.purr()})});