!function(t){function e(){function e(t){var s=1e12>t?s=performance.now?performance.now()+performance.timing.navigationStart:Date.now():t||(new Date).getTime();s-n>=1e3&&(h._updateTargets(),n=s),i(e)}this.regional=[],this.regional[""]={labels:["Years","Months","Weeks","Days","Hours","Minutes","Seconds"],labels1:["Year","Month","Week","Day","Hour","Minute","Second"],compactLabels:["y","m","w","d"],whichLabels:null,digits:["0","1","2","3","4","5","6","7","8","9"],timeSeparator:":",isRTL:!1},this._defaults={until:null,since:null,timezone:null,serverSync:null,format:"dHMS",layout:"",compact:!1,significant:0,description:"",expiryUrl:"",expiryText:"",alwaysExpire:!1,onExpiry:null,onTick:null,tickInterval:1},t.extend(this._defaults,this.regional[""]),this._serverSyncs=[];var i=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||null,n=0;!i||t.noRequestAnimationFrame?(t.noRequestAnimationFrame=null,setInterval(function(){h._updateTargets()},980)):(n=window.animationStartTime||window.webkitAnimationStartTime||window.mozAnimationStartTime||window.oAnimationStartTime||window.msAnimationStartTime||(new Date).getTime(),i(e))}function i(e,i){return"option"==e&&(0==i.length||1==i.length&&"string"==typeof i[0])?!0:t.inArray(e,u)>-1}var n=0,s=1,o=2,a=3,r=4,l=5,c=6;t.extend(e.prototype,{markerClassName:"hasCountdown",propertyName:"countdown",_rtlClass:"countdown_rtl",_sectionClass:"countdown_section",_amountClass:"countdown_amount",_rowClass:"countdown_row",_holdingClass:"countdown_holding",_showClass:"countdown_show",_descrClass:"countdown_descr",_timerTargets:[],setDefaults:function(e){this._resetExtraLabels(this._defaults,e),t.extend(this._defaults,e||{})},UTCDate:function(t,e,i,n,s,o,a,r){"object"==typeof e&&e.constructor==Date&&(r=e.getMilliseconds(),a=e.getSeconds(),o=e.getMinutes(),s=e.getHours(),n=e.getDate(),i=e.getMonth(),e=e.getFullYear());var l=new Date;return l.setUTCFullYear(e),l.setUTCDate(1),l.setUTCMonth(i||0),l.setUTCDate(n||1),l.setUTCHours(s||0),l.setUTCMinutes((o||0)-(Math.abs(t)<30?60*t:t)),l.setUTCSeconds(a||0),l.setUTCMilliseconds(r||0),l},periodsToSeconds:function(t){return 31557600*t[0]+2629800*t[1]+604800*t[2]+86400*t[3]+3600*t[4]+60*t[5]+t[6]},_attachPlugin:function(e,i){if(e=t(e),!e.hasClass(this.markerClassName)){var n={options:t.extend({},this._defaults),_periods:[0,0,0,0,0,0,0]};e.addClass(this.markerClassName).data(this.propertyName,n),this._optionPlugin(e,i)}},_addTarget:function(t){this._hasTarget(t)||this._timerTargets.push(t)},_hasTarget:function(e){return t.inArray(e,this._timerTargets)>-1},_removeTarget:function(e){this._timerTargets=t.map(this._timerTargets,function(t){return t==e?null:t})},_updateTargets:function(){for(var t=this._timerTargets.length-1;t>=0;t--)this._updateCountdown(this._timerTargets[t])},_optionPlugin:function(e,i,n){e=t(e);var s=e.data(this.propertyName);if(!i||"string"==typeof i&&null==n){var o=i;return i=(s||{}).options,i&&o?i[o]:i}if(e.hasClass(this.markerClassName)){if(i=i||{},"string"==typeof i){var o=i;i={},i[o]=n}this._resetExtraLabels(s.options,i),t.extend(s.options,i),this._adjustSettings(e,s);var a=new Date;(s._since&&s._since<a||s._until&&s._until>a)&&this._addTarget(e[0]),this._updateCountdown(e,s)}},_updateCountdown:function(e,i){var n=t(e);if(i=i||n.data(this.propertyName)){if(n.html(this._generateHTML(i)).toggleClass(this._rtlClass,i.options.isRTL),t.isFunction(i.options.onTick)){var s="lap"!=i._hold?i._periods:this._calculatePeriods(i,i._show,i.options.significant,new Date);(1==i.options.tickInterval||0==this.periodsToSeconds(s)%i.options.tickInterval)&&i.options.onTick.apply(e,[s])}var o="pause"!=i._hold&&(i._since?i._now.getTime()<i._since.getTime():i._now.getTime()>=i._until.getTime());if(o&&!i._expiring){if(i._expiring=!0,this._hasTarget(e)||i.options.alwaysExpire){if(this._removeTarget(e),t.isFunction(i.options.onExpiry)&&i.options.onExpiry.apply(e,[]),i.options.expiryText){var a=i.options.layout;i.options.layout=i.options.expiryText,this._updateCountdown(e,i),i.options.layout=a}i.options.expiryUrl&&(window.location=i.options.expiryUrl)}i._expiring=!1}else"pause"==i._hold&&this._removeTarget(e);n.data(this.propertyName,i)}},_resetExtraLabels:function(t,e){var i=!1;for(var n in e)if("whichLabels"!=n&&n.match(/[Ll]abels/)){i=!0;break}if(i)for(var n in t)n.match(/[Ll]abels[02-9]/)&&(t[n]=null)},_adjustSettings:function(e,i){for(var n,s=0,o=null,a=0;a<this._serverSyncs.length;a++)if(this._serverSyncs[a][0]==i.options.serverSync){o=this._serverSyncs[a][1];break}if(null!=o)s=i.options.serverSync?o:0,n=new Date;else{var r=t.isFunction(i.options.serverSync)?i.options.serverSync.apply(e,[]):null;n=new Date,s=r?n.getTime()-r.getTime():0,this._serverSyncs.push([i.options.serverSync,s])}var l=i.options.timezone;l=null==l?-n.getTimezoneOffset():l,i._since=i.options.since,null!=i._since&&(i._since=this.UTCDate(l,this._determineTime(i._since,null)),i._since&&s&&i._since.setMilliseconds(i._since.getMilliseconds()+s)),i._until=this.UTCDate(l,this._determineTime(i.options.until,n)),s&&i._until.setMilliseconds(i._until.getMilliseconds()+s),i._show=this._determineShow(i)},_destroyPlugin:function(e){e=t(e),e.hasClass(this.markerClassName)&&(this._removeTarget(e[0]),e.removeClass(this.markerClassName).empty().removeData(this.propertyName))},_pausePlugin:function(t){this._hold(t,"pause")},_lapPlugin:function(t){this._hold(t,"lap")},_resumePlugin:function(t){this._hold(t,null)},_hold:function(e,i){var n=t.data(e,this.propertyName);if(n){if("pause"==n._hold&&!i){n._periods=n._savePeriods;var s=n._since?"-":"+";n[n._since?"_since":"_until"]=this._determineTime(s+n._periods[0]+"y"+s+n._periods[1]+"o"+s+n._periods[2]+"w"+s+n._periods[3]+"d"+s+n._periods[4]+"h"+s+n._periods[5]+"m"+s+n._periods[6]+"s"),this._addTarget(e)}n._hold=i,n._savePeriods="pause"==i?n._periods:null,t.data(e,this.propertyName,n),this._updateCountdown(e,n)}},_getTimesPlugin:function(e){var i=t.data(e,this.propertyName);return i?i._hold?this._calculatePeriods(i,i._show,i.options.significant,new Date):i._periods:null},_determineTime:function(t,e){var i=function(t){var e=new Date;return e.setTime(e.getTime()+1e3*t),e},n=function(t){t=t.toLowerCase();for(var e=new Date,i=e.getFullYear(),n=e.getMonth(),s=e.getDate(),o=e.getHours(),a=e.getMinutes(),r=e.getSeconds(),l=/([+-]?[0-9]+)\s*(s|m|h|d|w|o|y)?/g,c=l.exec(t);c;){switch(c[2]||"s"){case"s":r+=parseInt(c[1],10);break;case"m":a+=parseInt(c[1],10);break;case"h":o+=parseInt(c[1],10);break;case"d":s+=parseInt(c[1],10);break;case"w":s+=7*parseInt(c[1],10);break;case"o":n+=parseInt(c[1],10),s=Math.min(s,h._getDaysInMonth(i,n));break;case"y":i+=parseInt(c[1],10),s=Math.min(s,h._getDaysInMonth(i,n))}c=l.exec(t)}return new Date(i,n,s,o,a,r,0)},s=null==t?e:"string"==typeof t?n(t):"number"==typeof t?i(t):t;return s&&s.setMilliseconds(0),s},_getDaysInMonth:function(t,e){return 32-new Date(t,e,32).getDate()},_normalLabels:function(t){return t},_generateHTML:function(e){var i=this;e._periods=e._hold?e._periods:this._calculatePeriods(e,e._show,e.options.significant,new Date);for(var u=!1,d=0,p=e.options.significant,f=t.extend({},e._show),m=n;c>=m;m++)u|="?"==e._show[m]&&e._periods[m]>0,f[m]="?"!=e._show[m]||u?e._show[m]:null,d+=f[m]?1:0,p-=e._periods[m]>0?1:0;for(var g=[!1,!1,!1,!1,!1,!1,!1],m=c;m>=n;m--)e._show[m]&&(e._periods[m]?g[m]=!0:(g[m]=p>0,p--));var v=e.options.compact?e.options.compactLabels:e.options.labels,y=e.options.whichLabels||this._normalLabels,b=function(t){var n=e.options["compactLabels"+y(e._periods[t])];return f[t]?i._translateDigits(e,e._periods[t])+(n?n[t]:v[t])+" ":""},w=function(t){var n=e.options["labels"+y(e._periods[t])];return!e.options.significant&&f[t]||e.options.significant&&g[t]?'<span class="'+h._sectionClass+'">'+'<span class="'+h._amountClass+'">'+i._translateDigits(e,e._periods[t])+"</span><br/>"+(n?n[t]:v[t])+"</span>":""};return e.options.layout?this._buildLayout(e,f,e.options.layout,e.options.compact,e.options.significant,g):(e.options.compact?'<span class="'+this._rowClass+" "+this._amountClass+(e._hold?" "+this._holdingClass:"")+'">'+b(n)+b(s)+b(o)+b(a)+(f[r]?this._minDigits(e,e._periods[r],2):"")+(f[l]?(f[r]?e.options.timeSeparator:"")+this._minDigits(e,e._periods[l],2):"")+(f[c]?(f[r]||f[l]?e.options.timeSeparator:"")+this._minDigits(e,e._periods[c],2):""):'<span class="'+this._rowClass+" "+this._showClass+(e.options.significant||d)+(e._hold?" "+this._holdingClass:"")+'">'+w(n)+w(s)+w(o)+w(a)+w(r)+w(l)+w(c))+"</span>"+(e.options.description?'<span class="'+this._rowClass+" "+this._descrClass+'">'+e.options.description+"</span>":"")},_buildLayout:function(e,i,u,h,d,p){for(var f=e.options[h?"compactLabels":"labels"],m=e.options.whichLabels||this._normalLabels,g=function(t){return(e.options[(h?"compactLabels":"labels")+m(e._periods[t])]||f)[t]},v=function(t,i){return e.options.digits[Math.floor(t/i)%10]},y={desc:e.options.description,sep:e.options.timeSeparator,yl:g(n),yn:this._minDigits(e,e._periods[n],1),ynn:this._minDigits(e,e._periods[n],2),ynnn:this._minDigits(e,e._periods[n],3),y1:v(e._periods[n],1),y10:v(e._periods[n],10),y100:v(e._periods[n],100),y1000:v(e._periods[n],1e3),ol:g(s),on:this._minDigits(e,e._periods[s],1),onn:this._minDigits(e,e._periods[s],2),onnn:this._minDigits(e,e._periods[s],3),o1:v(e._periods[s],1),o10:v(e._periods[s],10),o100:v(e._periods[s],100),o1000:v(e._periods[s],1e3),wl:g(o),wn:this._minDigits(e,e._periods[o],1),wnn:this._minDigits(e,e._periods[o],2),wnnn:this._minDigits(e,e._periods[o],3),w1:v(e._periods[o],1),w10:v(e._periods[o],10),w100:v(e._periods[o],100),w1000:v(e._periods[o],1e3),dl:g(a),dn:this._minDigits(e,e._periods[a],1),dnn:this._minDigits(e,e._periods[a],2),dnnn:this._minDigits(e,e._periods[a],3),d1:v(e._periods[a],1),d10:v(e._periods[a],10),d100:v(e._periods[a],100),d1000:v(e._periods[a],1e3),hl:g(r),hn:this._minDigits(e,e._periods[r],1),hnn:this._minDigits(e,e._periods[r],2),hnnn:this._minDigits(e,e._periods[r],3),h1:v(e._periods[r],1),h10:v(e._periods[r],10),h100:v(e._periods[r],100),h1000:v(e._periods[r],1e3),ml:g(l),mn:this._minDigits(e,e._periods[l],1),mnn:this._minDigits(e,e._periods[l],2),mnnn:this._minDigits(e,e._periods[l],3),m1:v(e._periods[l],1),m10:v(e._periods[l],10),m100:v(e._periods[l],100),m1000:v(e._periods[l],1e3),sl:g(c),sn:this._minDigits(e,e._periods[c],1),snn:this._minDigits(e,e._periods[c],2),snnn:this._minDigits(e,e._periods[c],3),s1:v(e._periods[c],1),s10:v(e._periods[c],10),s100:v(e._periods[c],100),s1000:v(e._periods[c],1e3)},b=u,w=n;c>=w;w++){var _="yowdhms".charAt(w),x=new RegExp("\\{"+_+"<\\}(.*)\\{"+_+">\\}","g");b=b.replace(x,!d&&i[w]||d&&p[w]?"$1":"")}return t.each(y,function(t,e){var i=new RegExp("\\{"+t+"\\}","g");b=b.replace(i,e)}),b},_minDigits:function(t,e,i){return e=""+e,e.length>=i?this._translateDigits(t,e):(e="0000000000"+e,this._translateDigits(t,e.substr(e.length-i)))},_translateDigits:function(t,e){return(""+e).replace(/[0-9]/g,function(e){return t.options.digits[e]})},_determineShow:function(t){var e=t.options.format,i=[];return i[n]=e.match("y")?"?":e.match("Y")?"!":null,i[s]=e.match("o")?"?":e.match("O")?"!":null,i[o]=e.match("w")?"?":e.match("W")?"!":null,i[a]=e.match("d")?"?":e.match("D")?"!":null,i[r]=e.match("h")?"?":e.match("H")?"!":null,i[l]=e.match("m")?"?":e.match("M")?"!":null,i[c]=e.match("s")?"?":e.match("S")?"!":null,i},_calculatePeriods:function(t,e,i,u){t._now=u,t._now.setMilliseconds(0);var d=new Date(t._now.getTime());t._since?u.getTime()<t._since.getTime()?t._now=u=d:u=t._since:(d.setTime(t._until.getTime()),u.getTime()>t._until.getTime()&&(t._now=u=d));var p=[0,0,0,0,0,0,0];if(e[n]||e[s]){var f=h._getDaysInMonth(u.getFullYear(),u.getMonth()),m=h._getDaysInMonth(d.getFullYear(),d.getMonth()),g=d.getDate()==u.getDate()||d.getDate()>=Math.min(f,m)&&u.getDate()>=Math.min(f,m),v=function(t){return 60*(60*t.getHours()+t.getMinutes())+t.getSeconds()},y=Math.max(0,12*(d.getFullYear()-u.getFullYear())+d.getMonth()-u.getMonth()+(d.getDate()<u.getDate()&&!g||g&&v(d)<v(u)?-1:0));p[n]=e[n]?Math.floor(y/12):0,p[s]=e[s]?y-12*p[n]:0,u=new Date(u.getTime());var b=u.getDate()==f,w=h._getDaysInMonth(u.getFullYear()+p[n],u.getMonth()+p[s]);u.getDate()>w&&u.setDate(w),u.setFullYear(u.getFullYear()+p[n]),u.setMonth(u.getMonth()+p[s]),b&&u.setDate(w)}var _=Math.floor((d.getTime()-u.getTime())/1e3),x=function(t,i){p[t]=e[t]?Math.floor(_/i):0,_-=p[t]*i};if(x(o,604800),x(a,86400),x(r,3600),x(l,60),x(c,1),_>0&&!t._since)for(var C=[1,12,4.3482,7,24,60,60],k=c,T=1,D=c;D>=n;D--)e[D]&&(p[k]>=T&&(p[k]=0,_=1),_>0&&(p[D]++,_=0,k=D,T=1)),T*=C[D];if(i)for(var D=n;c>=D;D++)i&&p[D]?i--:i||(p[D]=0);return p}});var u=["getTimes"];t.fn.countdown=function(t){var e=Array.prototype.slice.call(arguments,1);return i(t,e)?h["_"+t+"Plugin"].apply(h,[this[0]].concat(e)):this.each(function(){if("string"==typeof t){if(!h["_"+t+"Plugin"])throw"Unknown command: "+t;h["_"+t+"Plugin"].apply(h,[this].concat(e))}else h._attachPlugin(this,t||{})})};var h=t.countdown=new e}(jQuery);