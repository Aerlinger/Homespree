(function(){var t,e,i,n,s,r,o,a,l,c,u,h,d,p,f,m,g,v,y,b,w,_,x,C,k,T,M,S,D,E,P,A,I,N,H,j,z,O,F,L,R,W,$,B,Q,U,q,Y={}.hasOwnProperty,V=[].indexOf||function(t){for(var e=0,i=this.length;i>e;e++)if(e in this&&this[e]===t)return e;return-1};_=!1,h=null,A=document.location.href,T=null,E={},c=null,L=(null!=(q=document.cookie.match(/request_method=(\w+)/))?q[1].toUpperCase():void 0)||"",U=null,Q=function(t){return r&&s?(o(),I(t),v(t)):document.location.href=t},v=function(t){var e;return B("page:fetch"),e=O(t),null!=U&&U.abort(),U=new XMLHttpRequest,U.open("GET",e,!0),U.setRequestHeader("Accept","text/html, application/xhtml+xml, application/xml"),U.setRequestHeader("X-XHR-Referer",A),U.onload=function(){var t;return B("page:receive"),k(U)||i(t=c(U.responseText))?document.location.reload():(a.apply(null,f(t)),N(U),document.location.hash?document.location.href=document.location.href:W(),B("page:load"))},U.onloadend=function(){return U=null},U.onabort=function(){return j()},U.onerror=function(){return document.location.href=t},U.send()},g=function(t){var e;return o(),(e=E[t.position])?(null!=U&&U.abort(),a(e.title,e.body),P(e),B("page:restore")):v(document.location.href)},o=function(){return z(),E[h.position]={url:document.location.href,body:document.body,title:document.title,positionY:window.pageYOffset,positionX:window.pageXOffset},l(10)},l=function(t){var e,i;for(e in E)Y.call(E,e)&&(i=E[e],h.position-t>=e&&(E[e]=null))},a=function(e,i,n,s){return document.title=e,document.documentElement.replaceChild(i,document.body),null!=n&&t.update(n),F(),s&&d(),h=window.history.state,B("page:change")},d=function(){var t,e,i,n,s,r,o,a,l,c,u,h;for(r=Array.prototype.slice.call(document.body.getElementsByTagName("script")),o=0,l=r.length;l>o;o++)if(s=r[o],""===(u=s.type)||"text/javascript"===u){for(e=document.createElement("script"),h=s.attributes,a=0,c=h.length;c>a;a++)t=h[a],e.setAttribute(t.name,t.value);e.appendChild(document.createTextNode(s.innerHTML)),n=s.parentNode,i=s.nextSibling,n.removeChild(s),n.insertBefore(e,i)}},F=function(){var t,e,i,n;for(e=Array.prototype.slice.call(document.body.getElementsByTagName("noscript")),i=0,n=e.length;n>i;i++)t=e[i],t.parentNode.removeChild(t)},I=function(t){return t!==document.location.href?(A=document.location.href,window.history.pushState({turbolinks:!0,position:h.position+1},"",t)):void 0},N=function(t){var e;return(e=t.getResponseHeader("X-XHR-Current-Location"))&&e!==document.location.pathname+document.location.search?window.history.replaceState(h,"",e+document.location.hash):void 0},j=function(){return window.history.replaceState({turbolinks:!0,position:Date.now()},"",document.location.href)},H=function(){return h=window.history.state},z=function(){return _?void 0:(j(),H(),c=n(),_=!0)},P=function(t){return window.scrollTo(t.positionX,t.positionY)},W=function(){return window.scrollTo(0,0)},O=function(t){var e;return e=t,null==t.href&&(e=document.createElement("A"),e.href=t),e.href.replace(e.hash,"")},B=function(t){var e;return e=document.createEvent("Events"),e.initEvent(t,!0,!0),document.dispatchEvent(e)},k=function(t){return!t.getResponseHeader("Content-Type").match(/^(?:text\/html|application\/xhtml\+xml|application\/xml)(?:;|$)/)},m=function(t){var e,i,n,s,r;for(s=t.head.childNodes,r=[],i=0,n=s.length;n>i;i++)e=s[i],null!=("function"==typeof e.getAttribute?e.getAttribute("data-turbolinks-track"):void 0)&&r.push(e.src||e.href);return r},i=function(t){var e;return T||(T=m(document)),e=m(t),e.length!==T.length||C(e,T).length!==T.length},C=function(t,e){var i,n,s,r,o;for(t.length>e.length&&(r=[e,t],t=r[0],e=r[1]),o=[],n=0,s=t.length;s>n;n++)i=t[n],V.call(e,i)>=0&&o.push(i);return o},f=function(e){var i;return i=e.querySelector("title"),[null!=i?i.textContent:void 0,e.body,t.get(e).token,"runScripts"]},t={get:function(t){var e;return null==t&&(t=document),{node:e=t.querySelector('meta[name="csrf-token"]'),token:null!=e?"function"==typeof e.getAttribute?e.getAttribute("content"):void 0:void 0}},update:function(t){var e;return e=this.get(),null!=e.token&&null!=t&&e.token!==t?e.node.setAttribute("content",t):void 0}},n=function(){var t,e,i,n,s,r;e=function(t){return(new DOMParser).parseFromString(t,"text/html")},t=function(t){var e;return e=document.implementation.createHTMLDocument(""),e.documentElement.innerHTML=t,e},i=function(t){var e;return e=document.implementation.createHTMLDocument(""),e.open("replace"),e.write(t),e.close(),e};try{if(window.DOMParser)return s=e("<html><body><p>test"),e}catch(o){return n=o,s=t("<html><body><p>test"),t}finally{if(1!==(null!=s?null!=(r=s.body)?r.childNodes.length:void 0:void 0))return i}},x=function(t){return t.defaultPrevented?void 0:(document.removeEventListener("click",y,!1),document.addEventListener("click",y,!1))},y=function(t){var e;return t.defaultPrevented||(e=p(t),"A"!==e.nodeName||b(t,e))?void 0:(Q(e.href),t.preventDefault())},p=function(t){var e;for(e=t.target;e.parentNode&&"A"!==e.nodeName;)e=e.parentNode;return e},u=function(t){return location.protocol!==t.protocol||location.host!==t.host},e=function(t){return(t.hash&&O(t))===O(location)||t.href===location.href+"#"},S=function(t){var e;return e=O(t),e.match(/\.[a-z]+(\?.*)?$/g)&&!e.match(/\.html?(\?.*)?$/g)},M=function(t){for(var e;!e&&t!==document;)e=null!=t.getAttribute("data-no-turbolink"),t=t.parentNode;return e},$=function(t){return 0!==t.target.length},D=function(t){return t.which>1||t.metaKey||t.ctrlKey||t.shiftKey||t.altKey},b=function(t,i){return u(i)||e(i)||S(i)||M(i)||$(i)||D(t)},w=function(){return document.addEventListener("click",x,!0),window.addEventListener("popstate",function(t){var e;return(null!=(e=t.state)?e.turbolinks:void 0)?g(t.state):void 0},!1)},r=window.history&&window.history.pushState&&window.history.replaceState&&void 0!==window.history.state,s=!navigator.userAgent.match(/CriOS\//),R="GET"===L||""===L,r&&s&&R&&w(),this.Turbolinks={visit:Q}}).call(this);