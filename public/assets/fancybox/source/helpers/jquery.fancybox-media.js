(function(t){"use strict";var e=t.fancybox,i=function(e,i,n){return n=n||"","object"===t.type(n)&&(n=t.param(n,!0)),t.each(i,function(t,i){e=e.replace("$"+t,i||"")}),n.length&&(e+=(e.indexOf("?")>0?"&":"?")+n),e};e.helpers.media={defaults:{youtube:{matcher:/(youtube\.com|youtu\.be)\/(watch\?v=|v\/|u\/|embed\/?)?(videoseries\?list=(.*)|[\w-]{11}|\?listType=(.*)&list=(.*)).*/i,params:{autoplay:1,autohide:1,fs:1,rel:0,hd:1,wmode:"opaque",enablejsapi:1},type:"iframe",url:"//www.youtube.com/embed/$3"},vimeo:{matcher:/(?:vimeo(?:pro)?.com)\/(?:[^\d]+)?(\d+)(?:.*)/,params:{autoplay:1,hd:1,show_title:1,show_byline:1,show_portrait:0,fullscreen:1},type:"iframe",url:"//player.vimeo.com/video/$1"},metacafe:{matcher:/metacafe.com\/(?:watch|fplayer)\/([\w\-]{1,10})/,params:{autoPlay:"yes"},type:"swf",url:function(e,i,n){return n.swf.flashVars="playerVars="+t.param(i,!0),"//www.metacafe.com/fplayer/"+e[1]+"/.swf"}},dailymotion:{matcher:/dailymotion.com\/video\/(.*)\/?(.*)/,params:{additionalInfos:0,autoStart:1},type:"swf",url:"//www.dailymotion.com/swf/video/$1"},twitvid:{matcher:/twitvid\.com\/([a-zA-Z0-9_\-\?\=]+)/i,params:{autoplay:0},type:"iframe",url:"//www.twitvid.com/embed.php?guid=$1"},twitpic:{matcher:/twitpic\.com\/(?!(?:place|photos|events)\/)([a-zA-Z0-9\?\=\-]+)/i,type:"image",url:"//twitpic.com/show/full/$1/"},instagram:{matcher:/(instagr\.am|instagram\.com)\/p\/([a-zA-Z0-9_\-]+)\/?/i,type:"image",url:"//$1/p/$2/media/"},google_maps:{matcher:/maps\.google\.([a-z]{2,3}(\.[a-z]{2})?)\/(\?ll=|maps\?)(.*)/i,type:"iframe",url:function(t){return"//maps.google."+t[1]+"/"+t[3]+t[4]+"&output="+(t[4].indexOf("layer=c")>0?"svembed":"embed")}}},beforeLoad:function(e,n){var s,o,a,r,l=n.href||"",c=!1;for(s in e)if(o=e[s],a=l.match(o.matcher)){c=o.type,r=t.extend(!0,{},o.params,n[s]||(t.isPlainObject(e[s])?e[s].params:null)),l="function"===t.type(o.url)?o.url.call(this,a,r,n):i(o.url,a,r);break}c&&(n.href=l,n.type=c,n.autoHeight=!1)}}})(jQuery);