/*!
 * jQuery UI Position 1.10.0
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/position/
 */
(function(t,e){function i(t,e,i){return[parseInt(t[0],10)*(p.test(t[0])?e/100:1),parseInt(t[1],10)*(p.test(t[1])?i/100:1)]}function n(e,i){return parseInt(t.css(e,i),10)||0}function s(e){var i=e[0];return 9===i.nodeType?{width:e.width(),height:e.height(),offset:{top:0,left:0}}:t.isWindow(i)?{width:e.width(),height:e.height(),offset:{top:e.scrollTop(),left:e.scrollLeft()}}:i.preventDefault?{width:0,height:0,offset:{top:i.pageY,left:i.pageX}}:{width:e.outerWidth(),height:e.outerHeight(),offset:e.offset()}}t.ui=t.ui||{};var o,a=Math.max,r=Math.abs,l=Math.round,c=/left|center|right/,h=/top|center|bottom/,u=/[\+\-]\d+%?/,d=/^\w+/,p=/%$/,f=t.fn.position;t.position={scrollbarWidth:function(){if(o!==e)return o;var i,n,s=t("<div style='display:block;width:50px;height:50px;overflow:hidden;'><div style='height:100px;width:auto;'></div></div>"),a=s.children()[0];return t("body").append(s),i=a.offsetWidth,s.css("overflow","scroll"),n=a.offsetWidth,i===n&&(n=s[0].clientWidth),s.remove(),o=i-n},getScrollInfo:function(e){var i=e.isWindow?"":e.element.css("overflow-x"),n=e.isWindow?"":e.element.css("overflow-y"),s="scroll"===i||"auto"===i&&e.width<e.element[0].scrollWidth,o="scroll"===n||"auto"===n&&e.height<e.element[0].scrollHeight;return{width:s?t.position.scrollbarWidth():0,height:o?t.position.scrollbarWidth():0}},getWithinInfo:function(e){var i=t(e||window),n=t.isWindow(i[0]);return{element:i,isWindow:n,offset:i.offset()||{left:0,top:0},scrollLeft:i.scrollLeft(),scrollTop:i.scrollTop(),width:n?i.width():i.outerWidth(),height:n?i.height():i.outerHeight()}}},t.fn.position=function(e){if(!e||!e.of)return f.apply(this,arguments);e=t.extend({},e);var o,p,m,g,v,y,b=t(e.of),_=t.position.getWithinInfo(e.within),w=t.position.getScrollInfo(_),x=(e.collision||"flip").split(" "),k={};return y=s(b),b[0].preventDefault&&(e.at="left top"),p=y.width,m=y.height,g=y.offset,v=t.extend({},g),t.each(["my","at"],function(){var t,i,n=(e[this]||"").split(" ");1===n.length&&(n=c.test(n[0])?n.concat(["center"]):h.test(n[0])?["center"].concat(n):["center","center"]),n[0]=c.test(n[0])?n[0]:"center",n[1]=h.test(n[1])?n[1]:"center",t=u.exec(n[0]),i=u.exec(n[1]),k[this]=[t?t[0]:0,i?i[0]:0],e[this]=[d.exec(n[0])[0],d.exec(n[1])[0]]}),1===x.length&&(x[1]=x[0]),"right"===e.at[0]?v.left+=p:"center"===e.at[0]&&(v.left+=p/2),"bottom"===e.at[1]?v.top+=m:"center"===e.at[1]&&(v.top+=m/2),o=i(k.at,p,m),v.left+=o[0],v.top+=o[1],this.each(function(){var s,c,h=t(this),u=h.outerWidth(),d=h.outerHeight(),f=n(this,"marginLeft"),y=n(this,"marginTop"),C=u+f+n(this,"marginRight")+w.width,T=d+y+n(this,"marginBottom")+w.height,D=t.extend({},v),S=i(k.my,h.outerWidth(),h.outerHeight());"right"===e.my[0]?D.left-=u:"center"===e.my[0]&&(D.left-=u/2),"bottom"===e.my[1]?D.top-=d:"center"===e.my[1]&&(D.top-=d/2),D.left+=S[0],D.top+=S[1],t.support.offsetFractions||(D.left=l(D.left),D.top=l(D.top)),s={marginLeft:f,marginTop:y},t.each(["left","top"],function(i,n){t.ui.position[x[i]]&&t.ui.position[x[i]][n](D,{targetWidth:p,targetHeight:m,elemWidth:u,elemHeight:d,collisionPosition:s,collisionWidth:C,collisionHeight:T,offset:[o[0]+S[0],o[1]+S[1]],my:e.my,at:e.at,within:_,elem:h})}),e.using&&(c=function(t){var i=g.left-D.left,n=i+p-u,s=g.top-D.top,o=s+m-d,l={target:{element:b,left:g.left,top:g.top,width:p,height:m},element:{element:h,left:D.left,top:D.top,width:u,height:d},horizontal:0>n?"left":i>0?"right":"center",vertical:0>o?"top":s>0?"bottom":"middle"};u>p&&p>r(i+n)&&(l.horizontal="center"),d>m&&m>r(s+o)&&(l.vertical="middle"),l.important=a(r(i),r(n))>a(r(s),r(o))?"horizontal":"vertical",e.using.call(this,t,l)}),h.offset(t.extend(D,{using:c}))})},t.ui.position={fit:{left:function(t,e){var i,n=e.within,s=n.isWindow?n.scrollLeft:n.offset.left,o=n.width,r=t.left-e.collisionPosition.marginLeft,l=s-r,c=r+e.collisionWidth-o-s;e.collisionWidth>o?l>0&&0>=c?(i=t.left+l+e.collisionWidth-o-s,t.left+=l-i):t.left=c>0&&0>=l?s:l>c?s+o-e.collisionWidth:s:l>0?t.left+=l:c>0?t.left-=c:t.left=a(t.left-r,t.left)},top:function(t,e){var i,n=e.within,s=n.isWindow?n.scrollTop:n.offset.top,o=e.within.height,r=t.top-e.collisionPosition.marginTop,l=s-r,c=r+e.collisionHeight-o-s;e.collisionHeight>o?l>0&&0>=c?(i=t.top+l+e.collisionHeight-o-s,t.top+=l-i):t.top=c>0&&0>=l?s:l>c?s+o-e.collisionHeight:s:l>0?t.top+=l:c>0?t.top-=c:t.top=a(t.top-r,t.top)}},flip:{left:function(t,e){var i,n,s=e.within,o=s.offset.left+s.scrollLeft,a=s.width,l=s.isWindow?s.scrollLeft:s.offset.left,c=t.left-e.collisionPosition.marginLeft,h=c-l,u=c+e.collisionWidth-a-l,d="left"===e.my[0]?-e.elemWidth:"right"===e.my[0]?e.elemWidth:0,p="left"===e.at[0]?e.targetWidth:"right"===e.at[0]?-e.targetWidth:0,f=-2*e.offset[0];0>h?(i=t.left+d+p+f+e.collisionWidth-a-o,(0>i||r(h)>i)&&(t.left+=d+p+f)):u>0&&(n=t.left-e.collisionPosition.marginLeft+d+p+f-l,(n>0||u>r(n))&&(t.left+=d+p+f))},top:function(t,e){var i,n,s=e.within,o=s.offset.top+s.scrollTop,a=s.height,l=s.isWindow?s.scrollTop:s.offset.top,c=t.top-e.collisionPosition.marginTop,h=c-l,u=c+e.collisionHeight-a-l,d="top"===e.my[1],p=d?-e.elemHeight:"bottom"===e.my[1]?e.elemHeight:0,f="top"===e.at[1]?e.targetHeight:"bottom"===e.at[1]?-e.targetHeight:0,m=-2*e.offset[1];0>h?(n=t.top+p+f+m+e.collisionHeight-a-o,t.top+p+f+m>h&&(0>n||r(h)>n)&&(t.top+=p+f+m)):u>0&&(i=t.top-e.collisionPosition.marginTop+p+f+m-l,t.top+p+f+m>u&&(i>0||u>r(i))&&(t.top+=p+f+m))}},flipfit:{left:function(){t.ui.position.flip.left.apply(this,arguments),t.ui.position.fit.left.apply(this,arguments)},top:function(){t.ui.position.flip.top.apply(this,arguments),t.ui.position.fit.top.apply(this,arguments)}}},function(){var e,i,n,s,o,a=document.getElementsByTagName("body")[0],r=document.createElement("div");e=document.createElement(a?"div":"body"),n={visibility:"hidden",width:0,height:0,border:0,margin:0,background:"none"},a&&t.extend(n,{position:"absolute",left:"-1000px",top:"-1000px"});for(o in n)e.style[o]=n[o];e.appendChild(r),i=a||document.documentElement,i.insertBefore(e,i.firstChild),r.style.cssText="position: absolute; left: 10.7432222px;",s=t(r).offset().left,t.support.offsetFractions=s>10&&11>s,e.innerHTML="",i.removeChild(e)}()})(jQuery);