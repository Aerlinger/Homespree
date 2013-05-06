(function(t,e){var i=function(){var e=t._data(document,"events");return e&&e.click&&t.grep(e.click,function(t){return"rails"===t.namespace}).length};i()&&t.error("jquery-ujs has already been loaded!");var n;t.rails=n={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote], a[data-disable-with]",inputChangeSelector:"select[data-remote], input[data-remote], textarea[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not([type])",disableSelector:"input[data-disable-with], button[data-disable-with], textarea[data-disable-with]",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled",requiredInputSelector:"input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",fileInputSelector:"input[type=file]",linkDisableSelector:"a[data-disable-with]",CSRFProtection:function(e){var i=t('meta[name="csrf-token"]').attr("content");i&&e.setRequestHeader("X-CSRF-Token",i)},fire:function(e,i,n){var s=t.Event(i);return e.trigger(s,n),s.result!==!1},confirm:function(t){return confirm(t)},ajax:function(e){return t.ajax(e)},href:function(t){return t.attr("href")},handleRemote:function(i){var s,r,o,a,l,c,u,h;if(n.fire(i,"ajax:before")){if(a=i.data("cross-domain"),l=a===e?null:a,c=i.data("with-credentials")||null,u=i.data("type")||t.ajaxSettings&&t.ajaxSettings.dataType,i.is("form")){s=i.attr("method"),r=i.attr("action"),o=i.serializeArray();var d=i.data("ujs:submit-button");d&&(o.push(d),i.data("ujs:submit-button",null))}else i.is(n.inputChangeSelector)?(s=i.data("method"),r=i.data("url"),o=i.serialize(),i.data("params")&&(o=o+"&"+i.data("params"))):(s=i.data("method"),r=n.href(i),o=i.data("params")||null);h={type:s||"GET",data:o,dataType:u,beforeSend:function(t,s){return s.dataType===e&&t.setRequestHeader("accept","*/*;q=0.5, "+s.accepts.script),n.fire(i,"ajax:beforeSend",[t,s])},success:function(t,e,n){i.trigger("ajax:success",[t,e,n])},complete:function(t,e){i.trigger("ajax:complete",[t,e])},error:function(t,e,n){i.trigger("ajax:error",[t,e,n])},crossDomain:l},c&&(h.xhrFields={withCredentials:c}),r&&(h.url=r);var p=n.ajax(h);return i.trigger("ajax:send",p),p}return!1},handleMethod:function(i){var s=n.href(i),r=i.data("method"),o=i.attr("target"),a=t("meta[name=csrf-token]").attr("content"),l=t("meta[name=csrf-param]").attr("content"),c=t('<form method="post" action="'+s+'"></form>'),u='<input name="_method" value="'+r+'" type="hidden" />';l!==e&&a!==e&&(u+='<input name="'+l+'" value="'+a+'" type="hidden" />'),o&&c.attr("target",o),c.hide().append(u).appendTo("body"),c.submit()},disableFormElements:function(e){e.find(n.disableSelector).each(function(){var e=t(this),i=e.is("button")?"html":"val";e.data("ujs:enable-with",e[i]()),e[i](e.data("disable-with")),e.prop("disabled",!0)})},enableFormElements:function(e){e.find(n.enableSelector).each(function(){var e=t(this),i=e.is("button")?"html":"val";e.data("ujs:enable-with")&&e[i](e.data("ujs:enable-with")),e.prop("disabled",!1)})},allowAction:function(t){var e,i=t.data("confirm"),s=!1;return i?(n.fire(t,"confirm")&&(s=n.confirm(i),e=n.fire(t,"confirm:complete",[s])),s&&e):!0},blankInputs:function(e,i,n){var s,r,o=t(),a=i||"input,textarea",l=e.find(a);return l.each(function(){if(s=t(this),r=s.is("input[type=checkbox],input[type=radio]")?s.is(":checked"):s.val(),!r==!n){if(s.is("input[type=radio]")&&l.filter('input[type=radio]:checked[name="'+s.attr("name")+'"]').length)return!0;o=o.add(s)}}),o.length?o:!1},nonBlankInputs:function(t,e){return n.blankInputs(t,e,!0)},stopEverything:function(e){return t(e.target).trigger("ujs:everythingStopped"),e.stopImmediatePropagation(),!1},callFormSubmitBindings:function(i,n){var s=i.data("events"),r=!0;return s!==e&&s.submit!==e&&t.each(s.submit,function(t,e){return"function"==typeof e.handler?r=e.handler(n):void 0}),r},disableElement:function(t){t.data("ujs:enable-with",t.html()),t.html(t.data("disable-with")),t.bind("click.railsDisable",function(t){return n.stopEverything(t)})},enableElement:function(t){t.data("ujs:enable-with")!==e&&(t.html(t.data("ujs:enable-with")),t.data("ujs:enable-with",!1)),t.unbind("click.railsDisable")}},n.fire(t(document),"rails:attachBindings")&&(t.ajaxPrefilter(function(t,e,i){t.crossDomain||n.CSRFProtection(i)}),t(document).delegate(n.linkDisableSelector,"ajax:complete",function(){n.enableElement(t(this))}),t(document).delegate(n.linkClickSelector,"click.rails",function(i){var s=t(this),r=s.data("method"),o=s.data("params");if(!n.allowAction(s))return n.stopEverything(i);if(s.is(n.linkDisableSelector)&&n.disableElement(s),s.data("remote")!==e){if(!(!i.metaKey&&!i.ctrlKey||r&&"GET"!==r||o))return!0;var a=n.handleRemote(s);return a===!1?n.enableElement(s):a.error(function(){n.enableElement(s)}),!1}return s.data("method")?(n.handleMethod(s),!1):void 0}),t(document).delegate(n.inputChangeSelector,"change.rails",function(e){var i=t(this);return n.allowAction(i)?(n.handleRemote(i),!1):n.stopEverything(e)}),t(document).delegate(n.formSubmitSelector,"submit.rails",function(i){var s=t(this),r=s.data("remote")!==e,o=n.blankInputs(s,n.requiredInputSelector),a=n.nonBlankInputs(s,n.fileInputSelector);if(!n.allowAction(s))return n.stopEverything(i);if(o&&s.attr("novalidate")==e&&n.fire(s,"ajax:aborted:required",[o]))return n.stopEverything(i);if(r){if(a){setTimeout(function(){n.disableFormElements(s)},13);var l=n.fire(s,"ajax:aborted:file",[a]);return l||setTimeout(function(){n.enableFormElements(s)},13),l}return!t.support.submitBubbles&&"1.7">t().jquery&&n.callFormSubmitBindings(s,i)===!1?n.stopEverything(i):(n.handleRemote(s),!1)}setTimeout(function(){n.disableFormElements(s)},13)}),t(document).delegate(n.formInputClickSelector,"click.rails",function(e){var i=t(this);if(!n.allowAction(i))return n.stopEverything(e);var s=i.attr("name"),r=s?{name:s,value:i.val()}:null;i.closest("form").data("ujs:submit-button",r)}),t(document).delegate(n.formSubmitSelector,"ajax:beforeSend.rails",function(e){this==e.target&&n.disableFormElements(t(this))}),t(document).delegate(n.formSubmitSelector,"ajax:complete.rails",function(e){this==e.target&&n.enableFormElements(t(this))}),t(function(){var e=t("meta[name=csrf-token]").attr("content"),i=t("meta[name=csrf-param]").attr("content");t('form input[name="'+i+'"]').val(e)}))})(jQuery);