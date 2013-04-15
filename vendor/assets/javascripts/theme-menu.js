/* ----------------------------------->>>>>>>>> MENU <<<<<<<<<<<-----------------------------------*/

/* -------------------------- TOGGLE THE MENUS ON MOBILE/TABLETS UNDER 979PX (BOOTSTRAP'S SIZING) ------------------------*/
$(document).ready(function () {
	$(".mobile_nav a").click(function () {
		$('.primary-menu, .secondary-menu')
			.slideToggle(100);
		$(this).toggleClass("active");
		return false
	})
});

/* -------------------------- GET HOVERS TO WORK AS CLICKS ON IPAD VERSIONS THAT DON'T SUPPORT HOVER  ------------------------*/

$(document).ready(function () {
	if (navigator.platform == "iPad") {
		$(".primary-menu ul ul a").each(function () {
			var onClick; // this will be a function
			var firstClick = function () {
				onClick = secondClick;
				return false;
			};
			var secondClick = function () {
				onClick = firstClick;
				return true;
			};
			onClick = firstClick;
			$(this).click(function () {
				return onClick();
			});
		});
	}
});


/* -------------------------- TURN MENUS TO MULTI LEVEL ACCORDION MENUS AT 979 PX AND BELOW------------------------*/

/* DC jQuery Vertical Accordion Menu - jQuery vertical accordion menu plugin Copyright (c) 2011 Design Chemical Dual licensed under the MIT and GPL licenses: http://www.opensource.org/licenses/mit-license.php http://www.gnu.org/licenses/gpl.html*/
if (document.documentElement.clientWidth < 979) {
	(function ($) {
		$.fn.dcAccordion = function (options) {
			var defaults = {
				classParent: "dcjq-parent",
				classActive: "active",
				classArrow: "dcjq-icon",
				classCount: "dcjq-count",
				classExpand: "dcjq-current-parent",
				eventType: "click",
				hoverDelay: 300,
				menuClose: true,
				autoClose: true,
				autoExpand: false,
				speed: "slow",
				saveState: true,
				disableLink: true,
				showCount: false,
				cookie: "dcjq-accordion"
			};
			var options = $.extend(defaults, options);
			this.each(function (options) {
				var obj = this;
				setUpAccordion();
				if (defaults.saveState == true) {
					checkCookie(defaults.cookie, obj)
				}
				if (defaults.autoExpand == true) {
					$("li." + defaults.classExpand + " > a").addClass(defaults.classActive)
				}
				resetAccordion();
				if (defaults.eventType == "hover") {
					var config = {
						sensitivity: 2,
						interval: defaults.hoverDelay,
						over: linkOver,
						timeout: defaults.hoverDelay,
						out: linkOut
					};
					$("li a", obj).hoverIntent(config);
					var configMenu = {
						sensitivity: 2,
						interval: 1000,
						over: menuOver,
						timeout: 1000,
						out: menuOut
					};
					$(obj).hoverIntent(configMenu);
					if (defaults.disableLink == true) {
						$("li a", obj).click(function (e) {
							if ($(this).siblings("ul").length > 0) {
								e.preventDefault()
							}
						})
					}
				} else {
					$("li a", obj).click(function (e) {
						$activeLi = $(this).parent("li");
						$parentsLi = $activeLi.parents("li");
						$parentsUl = $activeLi.parents("ul");
						if (defaults.disableLink == true) {
							if ($(this).siblings("ul").length > 0) {
								e.preventDefault()
							}
						}
						if (defaults.autoClose == true) {
							autoCloseAccordion($parentsLi, $parentsUl)
						}
						if ($("> ul", $activeLi).is(":visible")) {
							$("ul", $activeLi).slideUp(defaults.speed);
							$("a", $activeLi).removeClass(defaults.classActive)
						} else {
							$(this).siblings("ul").slideToggle(defaults.speed);
							$("> a", $activeLi).addClass(defaults.classActive)
						}
						if (defaults.saveState == true) {
							createCookie(defaults.cookie, obj)
						}
					})
				}
				function setUpAccordion() {
					$arrow = '<span class="' + defaults.classArrow + '"></span>';
					var classParentLi = defaults.classParent + "-li";
					$("> ul", obj).show();
					$("li", obj).each(function () {
						if ($("> ul", this).length > 0) {
							$(this).addClass(classParentLi);
							$("> a", this).addClass(defaults.classParent).append($arrow)
						}
					});
					$("> ul", obj).hide();
					if (defaults.showCount == true) {
						$("li." + classParentLi, obj).each(function () {
							if (defaults.disableLink == true) {
								var getCount = parseInt($("ul a:not(." + defaults.classParent + ")", this).length)
							} else {
								var getCount = parseInt($("ul a", this).length)
							}
							$("> a", this).append(' <span class="' + defaults.classCount + '">(' + getCount + ")</span>")
						})
					}
				}
				function linkOver() {
					$activeLi = $(this).parent("li");
					$parentsLi = $activeLi.parents("li");
					$parentsUl = $activeLi.parents("ul");
					if (defaults.autoClose == true) {
						autoCloseAccordion($parentsLi, $parentsUl)
					}
					if ($("> ul", $activeLi).is(":visible")) {
						$("ul", $activeLi).slideUp(defaults.speed);
						$("a", $activeLi).removeClass(defaults.classActive)
					} else {
						$(this).siblings("ul").slideToggle(defaults.speed);
						$("> a", $activeLi).addClass(defaults.classActive)
					}
					if (defaults.saveState == true) {
						createCookie(defaults.cookie, obj)
					}
				}
				function linkOut() {}
				function menuOver() {}
				function menuOut() {
					if (defaults.menuClose == true) {
						$("ul", obj).slideUp(defaults.speed);
						$("a", obj).removeClass(defaults.classActive);
						createCookie(defaults.cookie, obj)
					}
				}
				function autoCloseAccordion($parentsLi, $parentsUl) {
					$("ul", obj).not($parentsUl).slideUp(defaults.speed);
					$("a", obj).removeClass(defaults.classActive);
					$("> a", $parentsLi).addClass(defaults.classActive)
				}
				function resetAccordion() {
					$("ul", obj).hide();
					$allActiveLi = $("a." + defaults.classActive, obj);
					$allActiveLi.siblings("ul").show()
				}
			});

			function checkCookie(cookieId, obj) {
				var cookieVal = $.cookie(cookieId);
				if (cookieVal != null) {
					var activeArray = cookieVal.split(",");
					$.each(activeArray, function (index, value) {
						var $cookieLi = $("li:eq(" + value + ")", obj);
						$("> a", $cookieLi).addClass(defaults.classActive);
						var $parentsLi = $cookieLi.parents("li");
						$("> a", $parentsLi).addClass(defaults.classActive)
					})
				}
			}
			function createCookie(cookieId, obj) {
				var activeIndex = [];
				$("li a." + defaults.classActive, obj).each(function (i) {
					var $arrayItem = $(this).parent("li");
					var itemIndex = $("li", obj).index($arrayItem);
					activeIndex.push(itemIndex)
				});
				$.cookie(cookieId, activeIndex, {
					path: "/"
				})
			}
		}
	})(jQuery);
}

if (document.documentElement.clientWidth < 979) {
	$(document).ready(function () {
		$(".accordmobile").dcAccordion({
			eventType: "click",
			saveState: false,
			autoClose: true,
			disableLink: true,
			speed: "fast",
			showCount: false,
			autoExpand: false,
			classExpand: "parent"
		})
	})
}


/* -------------------------- WRAP BOOTSTRAP DROPDOWN IN GREATER THAN 979PX TO ONLY USE THEM ON DESKTOP = THEY DON'T WORK WITH MULTIPLE LEVELS AT ALL------------------------*/

/* ============================================================
 * bootstrap-dropdown.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#dropdowns
 * ============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */


!function ($) {

  "use strict"; // jshint ;_;


 /* DROPDOWN CLASS DEFINITION
  * ========================= */

  var toggle = '[data-toggle=dropdown]'
    , Dropdown = function (element) {
        var $el = $(element).on('click.dropdown.data-api', this.toggle)
        $('html').on('click.dropdown.data-api', function () {
          $el.parent().removeClass('open')
        })
      }

  Dropdown.prototype = {

    constructor: Dropdown

  , toggle: function (e) {
      var $this = $(this)
        , $parent
        , isActive

      if ($this.is('.disabled, :disabled')) return

      $parent = getParent($this)

      isActive = $parent.hasClass('open')

      clearMenus()

      if (!isActive) {
        $parent.toggleClass('open')
      }

      $this.focus()

      return false
    }

  , keydown: function (e) {
      var $this
        , $items
        , $active
        , $parent
        , isActive
        , index

      if (!/(38|40|27)/.test(e.keyCode)) return

      $this = $(this)

      e.preventDefault()
      e.stopPropagation()

      if ($this.is('.disabled, :disabled')) return

      $parent = getParent($this)

      isActive = $parent.hasClass('open')

      if (!isActive || (isActive && e.keyCode == 27)) {
        if (e.which == 27) $parent.find(toggle).focus()
        return $this.click()
      }

      $items = $('[role=menu] li:not(.divider):visible a', $parent)

      if (!$items.length) return

      index = $items.index($items.filter(':focus'))

      if (e.keyCode == 38 && index > 0) index--                                        // up
      if (e.keyCode == 40 && index < $items.length - 1) index++                        // down
      if (!~index) index = 0

      $items
        .eq(index)
        .focus()
    }

  }

  function clearMenus() {
    $(toggle).each(function () {
      getParent($(this)).removeClass('open')
    })
  }

  function getParent($this) {
    var selector = $this.attr('data-target')
      , $parent

    if (!selector) {
      selector = $this.attr('href')
      selector = selector && /#/.test(selector) && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
    }

    $parent = selector && $(selector)

    if (!$parent || !$parent.length) $parent = $this.parent()

    return $parent
  }


  /* DROPDOWN PLUGIN DEFINITION
   * ========================== */

  var old = $.fn.dropdown

  $.fn.dropdown = function (option) {
    return this.each(function () {
      var $this = $(this)
        , data = $this.data('dropdown')
      if (!data) $this.data('dropdown', (data = new Dropdown(this)))
      if (typeof option == 'string') data[option].call($this)
    })
  }

  $.fn.dropdown.Constructor = Dropdown


 /* DROPDOWN NO CONFLICT
  * ==================== */

  $.fn.dropdown.noConflict = function () {
    $.fn.dropdown = old
    return this
  }


  /* APPLY TO STANDARD DROPDOWN ELEMENTS
   * =================================== */

  $(document)
    .on('click.dropdown.data-api', clearMenus)
    .on('click.dropdown.data-api', '.dropdown form', function (e) { e.stopPropagation() })
    .on('click.dropdown-menu', function (e) { e.stopPropagation() })
    .on('click.dropdown.data-api'  , toggle, Dropdown.prototype.toggle)
    .on('keydown.dropdown.data-api', toggle + ', [role=menu]' , Dropdown.prototype.keydown)

}(window.jQuery);

if (document.documentElement.clientWidth > 979) {

	$(function () {
		// Setup drop down menu
		$('.dropdown-toggle').dropdown();

		// Fix input element click problem
		$('.dropdown input, .dropdown label, .dropdown div, .dropdown ul').click(function (e) {
			e.stopPropagation();
		});
	});



	$(document).ready(function () {
		$('.dropdown input').focus(function () {
			window.scrollTo(0, 0);
		});
	});


} /* end bootstrap dropdown */
