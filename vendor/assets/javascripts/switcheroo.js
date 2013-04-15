
// --------------------------- COOKIE
/**
 * jQuery Cookie plugin
 *
 * Copyright (c) 2010 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
// TODO JsDoc 
/**
 * Create a cookie with the given key and value and other optional parameters.
 *
 * @example $.cookie('the_cookie', 'the_value');
 * @desc Set the value of a cookie.

 * @example $.cookie('the_cookie', 'the_value', { expires: 7, path: '/', domain: 'jquery.com', secure: true });
 * @desc Create a cookie with all available options.

 * @example $.cookie('the_cookie', 'the_value');
 * @desc Create a session cookie.

 * @example $.cookie('the_cookie', null);
 * @desc Delete a cookie by passing null as value. Keep in mind that you have to use the same path and domain
 *       used when the cookie was set.

 *
 * @param String key The key of the cookie.
 * @param String value The value of the cookie.
 * @param Object options An object literal containing key/value pairs to provide optional cookie attributes.
 * @option Number|Date expires Either an integer specifying the expiration date from now on in days or a Date object.
 *                             If a negative value is specified (e.g. a date in the past), the cookie will be deleted.
 *                             If set to null or omitted, the cookie will be a session cookie and will not be retained
 *                             when the the browser exits.
 * @option String path The value of the path atribute of the cookie (default: path of page that created the cookie).
 * @option String domain The value of the domain attribute of the cookie (default: domain of page that created the cookie).
 * @option Boolean secure If true, the secure attribute of the cookie will be set and the cookie transmission will
 *                        require a secure protocol (like HTTPS).
 * @type undefined
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */
/**
 * Get the value of a cookie with the given key.
 *
 * @example $.cookie('the_cookie');
 * @desc Get the value of a cookie.
 *
 * @param String key The key of the cookie.
 * @return The value of the cookie.
 * @type String
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */
jQuery.cookie = function (key, value, options) {

	// key and at least value given, set cookie...
	if (arguments.length > 1 && String(value) !== "[object Object]") {
		options = jQuery.extend({}, options);

		if (value === null || value === undefined) {
			options.expires = -1;
		}

		if (typeof options.expires === 'number') {
			var days = options.expires,
				t = options.expires = new Date();
			t.setDate(t.getDate() + days);
		}

		value = String(value);

		return (document.cookie = [
		encodeURIComponent(key), '=',
		options.raw ? value : encodeURIComponent(value),
		options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
		options.path ? '; path=' + options.path : '',
		options.domain ? '; domain=' + options.domain : '',
		options.secure ? '; secure' : ''].join(''));
	}

	// key and possibly options given, get cookie...
	options = value || {};
	var result, decode = options.raw ? function (s) {
			return s;
		} : decodeURIComponent;
	return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};


// --------------------------- SWITCHER WIDGET


$(document).ready(function () {
 $("#switcher-wrapper").on("click", ".toggle", function (e) {
       var selected = $(this).hasClass("selected");
       $(e.delegateTarget).stop().animate({
          left: selected? "-242px" : "-1px"
       });
       $(this).toggleClass("selected", !selected);
    });
});




// This is a custom switcher licensed under the DWTFYW by me (christina)


// --------------------------- SWITCHER FUNCTIONS

$(window).load(function () {

	//If Cookie isn't blank (i.e. do we have a cookie set at all?)
	if ($.cookie('color') != '') {
		$('body').addClass($.cookie('color')); //set the body to the cookie color
	}	
	
	if ($.cookie('font') != '') {
		$('body').addClass($.cookie('font')); //set the body to the cookie pattern
	}
	
	$('#switcher-wrapper a').each(function (index) {
		$(this).click(function (e) {
			e.preventDefault();

			switch (index) {
				//reset to base
				case 0:
					$('body').removeClass($.cookie('color'));
					$('body').addClass('corblue');
					$.cookie('color', null);
					$.cookie('color', 'corblue', {
						expires: 7,
						path: '/'
					});
					break;

					//gray
				case 1:
					$('body').removeClass($.cookie('color'));
					$('body').addClass('gray');
					$.cookie('color', null);
					$.cookie('color', 'gray', {
						expires: 7,
						path: '/'
					});
					break;

					//softgreen
				case 2:
					$('body').removeClass($.cookie('color'));
					$('body').addClass('softgreen');
					$.cookie('color', null);
					$.cookie('color', 'softgreen', {
						expires: 7,
						path: '/'
					});
					break;
					
					//softrustbrown
				case 3:
					$('body').removeClass($.cookie('color'));
					$('body').addClass('srbrown');
					$.cookie('color', null);
					$.cookie('color', 'srbrown', {
						expires: 7,
						path: '/'
					});
					break;

					//mutedteal
				case 4:
					$('body').removeClass($.cookie('color'));
					$('body').addClass('mteal');
					$.cookie('color', null);
					$.cookie('color', 'mteal', {
						expires: 7,
						path: '/'
					});
					break;
					

				case 5:
					$('body').removeClass($.cookie('color'));
					$('body').addClass('reset');
					$.cookie('color', null);
					$.cookie('color', 'reset', {
						expires: 7,
						path: '/'
					});
					break;	

				//font 
				case 6:
					$('body').removeClass($.cookie('font'));
					$('body').addClass('font0');
					$.cookie('font', null);
					$.cookie('font', 'font0', {
						expires: 7,
						path: '/'
					});
					break;	
					
				//font 
				case 7:
					$('body').removeClass($.cookie('font'));
					$('body').addClass('font1');
					$.cookie('font', null);
					$.cookie('font', 'font1', {
						expires: 7,
						path: '/'
					});
					break;	

				//font 
				case 8:
					$('body').removeClass($.cookie('font'));
					$('body').addClass('font2');
					$.cookie('font', null);
					$.cookie('font', 'font2', {
						expires: 7,
						path: '/'
					});
					break;	
					
				//font 
				case 9:
					$('body').removeClass($.cookie('font'));
					$('body').addClass('font3');
					$.cookie('font', null);
					$.cookie('font', 'font3', {
						expires: 7,
						path: '/'
					});
					break;	
					
				//font 
				case 10:
					$('body').removeClass($.cookie('font'));
					$('body').addClass('font4');
					$.cookie('font', null);
					$.cookie('font', 'font4', {
						expires: 7,
						path: '/'
					});
					break;	

				//font reset
				case 11:
					$('body').removeClass($.cookie('font'));
					$('body').addClass('resetfont');
					$.cookie('font', null);
					$.cookie('font', 'resetfont', {
						expires: 7,
						path: '/'
					});
					break;	

			}
		});
	});
});

