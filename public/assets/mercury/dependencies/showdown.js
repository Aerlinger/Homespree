//
// showdown.js -- A javascript port of Markdown.
//
// Copyright (c) 2007 John Fraser.
//
// Original Markdown Copyright (c) 2004-2005 John Gruber
//   <http://daringfireball.net/projects/markdown/>
//
// Redistributable under a BSD-style open source license.
// See license.txt for more information.
//
// The full source distribution is at:
//
//				A A L
//				T C A
//				T K B
//
//   <http://www.attacklab.net/>
//
//
// Wherever possible, Showdown is a straight, line-by-line port
// of the Perl version of Markdown.
//
// This is not a normal parser design; it's basically just a
// series of string substitutions.  It's hard to read and
// maintain this way,  but keeping Showdown close to the original
// design makes it easier to port new features.
//
// More importantly, Showdown behaves like markdown.pl in most
// edge cases.  So web applications can do client-side preview
// in Javascript, and then build identical HTML on the server.
//
// This port needs the new RegExp functionality of ECMA 262,
// 3rd Edition (i.e. Javascript 1.5).  Most modern web browsers
// should do fine.  Even with the new regular expression features,
// We do a lot of work to emulate Perl's regex functionality.
// The tricky changes in this file mostly have the "attacklab:"
// label.  Major or self-explanatory changes don't.
//
// Smart diff tools like Araxis Merge will be able to match up
// this file with markdown.pl in a useful way.  A little tweaking
// helps: in a copy of markdown.pl, replace "#" with "//" and
// replace "$text" with "text".  Be sure to ignore whitespace
// and line endings.
//
//
// Showdown usage:
//
//   var text = "Markdown *rocks*.";
//
//   var converter = new Showdown.converter();
//   var html = converter.makeHtml(text);
//
//   alert(html);
//
// Note: move the sample code to the bottom of this
// file before uncommenting it.
//
// **************************************************
// GitHub Flavored Markdown modifications by Tekkub
// http://github.github.com/github-flavored-markdown/
//
// Modifications are tagged with "GFM"
// **************************************************
//
// Showdown namespace
//
var Showdown={};Showdown.converter=function(){var e,t,n,r=0;this.makeHtml=function(r){return e=new Array,t=new Array,n=new Array,r=r.replace(/~/g,"~T"),r=r.replace(/\$/g,"~D"),r=r.replace(/\r\n/g,"\n"),r=r.replace(/\r/g,"\n"),r="\n\n"+r+"\n\n",r=M(r),r=r.replace(/^[ \t]+$/mg,""),r=o(r),r=s(r),r=a(r),r=A(r),r=r.replace(/~D/g,"$$"),r=r.replace(/~T/g,"~"),r=r.replace(/https?\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!]/g,function(e,t){var n=r.slice(0,t),i=r.slice(t);if(n.match(/<[^>]+$/)&&i.match(/^[^>]*>/))return e;var s=e.replace(/^http:\/\/github.com\//,"https://github.com/");return"<a href='"+s+"'>"+e+"</a>"}),r=r.replace(/[a-z0-9_\-+=.]+@[a-z0-9\-]+(\.[a-z0-9-]+)+/ig,function(e){return"<a href='mailto:"+e+"'>"+e+"</a>"}),r=r.replace(/[a-f0-9]{40}/ig,function(e,t){if(typeof GitHub=="undefined"||typeof GitHub.nameWithOwner=="undefined")return e;var n=r.slice(0,t),i=r.slice(t);return n.match(/@$/)||n.match(/<[^>]+$/)&&i.match(/^[^>]*>/)?e:"<a href='http://github.com/"+GitHub.nameWithOwner+"/commit/"+e+"'>"+e.substring(0,7)+"</a>"}),r=r.replace(/([a-z0-9_\-+=.]+)@([a-f0-9]{40})/ig,function(e,t,n,s){if(typeof GitHub=="undefined"||typeof GitHub.nameWithOwner=="undefined")return e;GitHub.repoName=GitHub.repoName||i();var o=r.slice(0,s),u=r.slice(s);return o.match(/\/$/)||o.match(/<[^>]+$/)&&u.match(/^[^>]*>/)?e:"<a href='http://github.com/"+t+"/"+GitHub.repoName+"/commit/"+n+"'>"+t+"@"+n.substring(0,7)+"</a>"}),r=r.replace(/([a-z0-9_\-+=.]+\/[a-z0-9_\-+=.]+)@([a-f0-9]{40})/ig,function(e,t,n){return"<a href='http://github.com/"+t+"/commit/"+n+"'>"+t+"@"+n.substring(0,7)+"</a>"}),r=r.replace(/#([0-9]+)/ig,function(e,t,n){if(typeof GitHub=="undefined"||typeof GitHub.nameWithOwner=="undefined")return e;var i=r.slice(0,n),s=r.slice(n);return i==""||i.match(/[a-z0-9_\-+=.]$/)||i.match(/<[^>]+$/)&&s.match(/^[^>]*>/)?e:"<a href='http://github.com/"+GitHub.nameWithOwner+"/issues/#issue/"+t+"'>"+e+"</a>"}),r=r.replace(/([a-z0-9_\-+=.]+)#([0-9]+)/ig,function(e,t,n,s){if(typeof GitHub=="undefined"||typeof GitHub.nameWithOwner=="undefined")return e;GitHub.repoName=GitHub.repoName||i();var o=r.slice(0,s),u=r.slice(s);return o.match(/\/$/)||o.match(/<[^>]+$/)&&u.match(/^[^>]*>/)?e:"<a href='http://github.com/"+t+"/"+GitHub.repoName+"/issues/#issue/"+n+"'>"+e+"</a>"}),r=r.replace(/([a-z0-9_\-+=.]+\/[a-z0-9_\-+=.]+)#([0-9]+)/ig,function(e,t,n){return"<a href='http://github.com/"+t+"/issues/#issue/"+n+"'>"+e+"</a>"}),r};var i=function(){return GitHub.nameWithOwner.match(/^.+\/(.+)$/)[1]},s=function(n){var n=n.replace(/^[ ]{0,3}\[(.+)\]:[ \t]*\n?[ \t]*<?(\S+?)>?[ \t]*\n?[ \t]*(?:(\n*)["(](.+?)[")][ \t]*)?(?:\n+|\Z)/gm,function(n,r,i,s,o){return r=r.toLowerCase(),e[r]=N(i),s?s+o:(o&&(t[r]=o.replace(/"/g,"&quot;")),"")});return n},o=function(e){e=e.replace(/\n/g,"\n\n");var t="p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del",n="p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math";return e=e.replace(/^(<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del)\b[^\r]*?\n<\/\2>[ \t]*(?=\n+))/gm,u),e=e.replace(/^(<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math)\b[^\r]*?.*<\/\2>[ \t]*(?=\n+)\n)/gm,u),e=e.replace(/(\n[ ]{0,3}(<(hr)\b([^<>])*?\/?>)[ \t]*(?=\n{2,}))/g,u),e=e.replace(/(\n\n[ ]{0,3}<!(--[^\r]*?--\s*)+>[ \t]*(?=\n{2,}))/g,u),e=e.replace(/(?:\n\n)([ ]{0,3}(?:<([?%])[^\r]*?\2>)[ \t]*(?=\n{2,}))/g,u),e=e.replace(/\n\n/g,"\n"),e},u=function(e,t){var r=t;return r=r.replace(/\n\n/g,"\n"),r=r.replace(/^\n/,""),r=r.replace(/\n+$/g,""),r="\n\n~K"+(n.push(r)-1)+"K\n\n",r},a=function(e){e=v(e);var t=b("<hr />");return e=e.replace(/^[ ]{0,2}([ ]?\*[ ]?){3,}[ \t]*$/gm,t),e=e.replace(/^[ ]{0,2}([ ]?\-[ ]?){3,}[ \t]*$/gm,t),e=e.replace(/^[ ]{0,2}([ ]?\_[ ]?){3,}[ \t]*$/gm,t),e=g(e),e=y(e),e=x(e),e=o(e),e=T(e),e},f=function(e){return e=w(e),e=l(e),e=C(e),e=p(e),e=c(e),e=k(e),e=N(e),e=S(e),e=e.replace(/  +\n/g," <br />\n"),e},l=function(e){var t=/(<[a-z\/!$]("[^"]*"|'[^']*'|[^'">])*>|<!(--.*?--\s*)+>)/gi;return e=e.replace(t,function(e){var t=e.replace(/(.)<\/?code>(?=.)/g,"$1`");return t=_(t,"\\`*_"),t}),e},c=function(e){return e=e.replace(/(\[((?:\[[^\]]*\]|[^\[\]])*)\][ ]?(?:\n[ ]*)?\[(.*?)\])()()()()/g,h),e=e.replace(/(\[((?:\[[^\]]*\]|[^\[\]])*)\]\([ \t]*()<?(.*?)>?[ \t]*((['"])(.*?)\6[ \t]*)?\))/g,h),e=e.replace(/(\[([^\[\]]+)\])()()()()()/g,h),e},h=function(n,r,i,s,o,u,a,f){f==undefined&&(f="");var l=r,c=i,h=s.toLowerCase(),p=o,d=f;if(p==""){h==""&&(h=c.toLowerCase().replace(/ ?\n/g," ")),p="#"+h;if(e[h]!=undefined)p=e[h],t[h]!=undefined&&(d=t[h]);else{if(!(l.search(/\(\s*\)$/m)>-1))return l;p=""}}p=_(p,"*_");var v='<a href="'+p+'"';return d!=""&&(d=d.replace(/"/g,"&quot;"),d=_(d,"*_"),v+=' title="'+d+'"'),v+=">"+c+"</a>",v},p=function(e){return e=e.replace(/(!\[(.*?)\][ ]?(?:\n[ ]*)?\[(.*?)\])()()()()/g,d),e=e.replace(/(!\[(.*?)\]\s?\([ \t]*()<?(\S+?)>?[ \t]*((['"])(.*?)\6[ \t]*)?\))/g,d),e},d=function(n,r,i,s,o,u,a,f){var l=r,c=i,h=s.toLowerCase(),p=o,d=f;d||(d="");if(p==""){h==""&&(h=c.toLowerCase().replace(/ ?\n/g," ")),p="#"+h;if(e[h]==undefined)return l;p=e[h],t[h]!=undefined&&(d=t[h])}c=c.replace(/"/g,"&quot;"),p=_(p,"*_");var v='<img src="'+p+'" alt="'+c+'"';return d=d.replace(/"/g,"&quot;"),d=_(d,"*_"),v+=' title="'+d+'"',v+=" />",v},v=function(e){return e=e.replace(/^(.+)[ \t]*\n=+[ \t]*\n+/gm,function(e,t){return b("<h1>"+f(t)+"</h1>")}),e=e.replace(/^(.+)[ \t]*\n-+[ \t]*\n+/gm,function(e,t){return b("<h2>"+f(t)+"</h2>")}),e=e.replace(/^(\#{1,6})[ \t]*(.+?)[ \t]*\#*\n+/gm,function(e,t,n){var r=t.length;return b("<h"+r+">"+f(n)+"</h"+r+">")}),e},m,g=function(e){e+="~0";var t=/^(([ ]{0,3}([*+-]|\d+[.])[ \t]+)[^\r]+?(~0|\n{2,}(?=\S)(?![ \t]*(?:[*+-]|\d+[.])[ \t]+)))/gm;return r?e=e.replace(t,function(e,t,n){var r=t,i=n.search(/[*+-]/g)>-1?"ul":"ol";r=r.replace(/\n{2,}/g,"\n\n\n");var s=m(r);return s=s.replace(/\s+$/,""),s="<"+i+">"+s+"</"+i+">\n",s}):(t=/(\n\n|^\n?)(([ ]{0,3}([*+-]|\d+[.])[ \t]+)[^\r]+?(~0|\n{2,}(?=\S)(?![ \t]*(?:[*+-]|\d+[.])[ \t]+)))/g,e=e.replace(t,function(e,t,n,r){var i=t,s=n,o=r.search(/[*+-]/g)>-1?"ul":"ol",s=s.replace(/\n{2,}/g,"\n\n\n"),u=m(s);return u=i+"<"+o+">\n"+u+"</"+o+">\n",u})),e=e.replace(/~0/,""),e};m=function(e){return r++,e=e.replace(/\n{2,}$/,"\n"),e+="~0",e=e.replace(/(\n)?(^[ \t]*)([*+-]|\d+[.])[ \t]+([^\r]+?(\n{1,2}))(?=\n*(~0|\2([*+-]|\d+[.])[ \t]+))/gm,function(e,t,n,r,i){var s=i,o=t,u=n;return o||s.search(/\n{2,}/)>-1?s=a(O(s)):(s=g(O(s)),s=s.replace(/\n$/,""),s=f(s)),"<li>"+s+"</li>\n"}),e=e.replace(/~0/g,""),r--,e};var y=function(e){return e+="~0",e=e.replace(/(?:\n\n|^)((?:(?:[ ]{4}|\t).*\n+)+)(\n*[ ]{0,3}[^ \t\n]|(?=~0))/g,function(e,t,n){var r=t,i=n;return r=E(O(r)),r=M(r),r=r.replace(/^\n+/g,""),r=r.replace(/\n+$/g,""),r="<pre><code>"+r+"\n</code></pre>",b(r)+i}),e=e.replace(/~0/,""),e},b=function(e){return e=e.replace(/(^\n+|\n+$)/g,""),"\n\n~K"+(n.push(e)-1)+"K\n\n"},w=function(e){return e=e.replace(/(^|[^\\])(`+)([^\r]*?[^`])\2(?!`)/gm,function(e,t,n,r,i){var s=r;return s=s.replace(/^([ \t]*)/g,""),s=s.replace(/[ \t]*$/g,""),s=E(s),t+"<code>"+s+"</code>"}),e},E=function(e){return e=e.replace(/&/g,"&amp;"),e=e.replace(/</g,"&lt;"),e=e.replace(/>/g,"&gt;"),e=_(e,"*_{}[]\\",!1),e},S=function(e){return e=e.replace(/(\*\*|__)(?=\S)([^\r]*?\S[*_]*)\1/g,"<strong>$2</strong>"),e=e.replace(/(\w)_(\w)/g,"$1~E95E$2"),e=e.replace(/(\*|_)(?=\S)([^\r]*?\S)\1/g,"<em>$2</em>"),e},x=function(e){return e=e.replace(/((^[ \t]*>[ \t]?.+\n(.+\n)*\n*)+)/gm,function(e,t){var n=t;return n=n.replace(/^[ \t]*>[ \t]?/gm,"~0"),n=n.replace(/~0/g,""),n=n.replace(/^[ \t]+$/gm,""),n=a(n),n=n.replace(/(^|\n)/g,"$1  "),n=n.replace(/(\s*<pre>[^\r]+?<\/pre>)/gm,function(e,t){var n=t;return n=n.replace(/^  /mg,"~0"),n=n.replace(/~0/g,""),n}),b("<blockquote>\n"+n+"\n</blockquote>")}),e},T=function(e){e=e.replace(/^\n+/g,""),e=e.replace(/\n+$/g,"");var t=e.split(/\n{2,}/g),r=new Array,i=t.length;for(var s=0;s<i;s++){var o=t[s];o.search(/~K(\d+)K/g)>=0?r.push(o):o.search(/\S/)>=0&&(o=f(o),o=o.replace(/\n/g,"<br />"),o=o.replace(/^([ \t]*)/g,"<p>"),o+="</p>",r.push(o))}i=r.length;for(var s=0;s<i;s++)while(r[s].search(/~K(\d+)K/)>=0){var u=n[RegExp.$1];u=u.replace(/\$/g,"$$$$"),r[s]=r[s].replace(/~K\d+K/,u)}return r.join("\n\n")},N=function(e){return e=e.replace(/&(?!#?[xX]?(?:[0-9a-fA-F]+|\w+);)/g,"&amp;"),e=e.replace(/<(?![a-z\/?\$!])/gi,"&lt;"),e},C=function(e){return e=e.replace(/\\(\\)/g,D),e=e.replace(/\\([`*_{}\[\]()>#+-.!])/g,D),e},k=function(e){return e=e.replace(/<((https?|ftp|dict):[^'">\s]+)>/gi,'<a href="$1">$1</a>'),e=e.replace(/<(?:mailto:)?([-.\w]+\@[-a-z0-9]+(\.[-a-z0-9]+)*\.[a-z]+)>/gi,function(e,t){return L(A(t))}),e},L=function(e){function t(e){var t="0123456789ABCDEF",n=e.charCodeAt(0);return t.charAt(n>>4)+t.charAt(n&15)}var n=[function(e){return"&#"+e.charCodeAt(0)+";"},function(e){return"&#x"+t(e)+";"},function(e){return e}];return e="mailto:"+e,e=e.replace(/./g,function(e){if(e=="@")e=n[Math.floor(Math.random()*2)](e);else if(e!=":"){var t=Math.random();e=t>.9?n[2](e):t>.45?n[1](e):n[0](e)}return e}),e='<a href="'+e+'">'+e+"</a>",e=e.replace(/">.+:/g,'">'),e},A=function(e){return e=e.replace(/~E(\d+)E/g,function(e,t){var n=parseInt(t);return String.fromCharCode(n)}),e},O=function(e){return e=e.replace(/^(\t|[ ]{1,4})/gm,"~0"),e=e.replace(/~0/g,""),e},M=function(e){return e=e.replace(/\t(?=\t)/g,"    "),e=e.replace(/\t/g,"~A~B"),e=e.replace(/~B(.+?)~A/g,function(e,t,n){var r=t,i=4-r.length%4;for(var s=0;s<i;s++)r+=" ";return r}),e=e.replace(/~A/g,"    "),e=e.replace(/~B/g,""),e},_=function(e,t,n){var r="(["+t.replace(/([\[\]\\])/g,"\\$1")+"])";n&&(r="\\\\"+r);var i=new RegExp(r,"g");return e=e.replace(i,D),e},D=function(e,t){var n=t.charCodeAt(0);return"~E"+n+"E"}};