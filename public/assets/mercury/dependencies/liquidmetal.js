/*
 * LiquidMetal, version: 0.1 (2009-02-05)
 *
 * A mimetic poly-alloy of Quicksilver's scoring algorithm, essentially
 * LiquidMetal.
 *
 * For usage and examples, visit:
 * http://github.com/rmm5t/liquidmetal
 *
 * Licensed under the MIT:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright (c) 2009, Ryan McGeary (ryanonjavascript -[at]- mcgeary [*dot*] org)
 */
var LiquidMetal=function(){function s(e,t){var n=e.charAt(t);return"A"<=n&&n<="Z"}function o(e,t){var n=e.charAt(t-1);return n==" "||n=="	"}function u(e,t,n,r){n=Math.max(n||0,0),r=Math.min(r||e.length,e.length);for(var i=n;i<r;i++)e[i]=t;return e}var e=0,t=1,n=.8,r=.9,i=.85;return{score:function(t,r){if(r.length==0)return n;if(r.length>t.length)return e;var i=this.buildScoreArray(t,r),s=0;for(var o=0;o<i.length;o++)s+=i[o];return s/i.length},buildScoreArray:function(a,f){var l=new Array(a.length),c=a.toLowerCase(),h=f.toLowerCase().split(""),p=-1,d=!1;for(var v=0;v<h.length;v++){var m=h[v],g=c.indexOf(m,p+1);if(g<0)return u(l,e);g==0&&(d=!0),o(a,g)?(l[g-1]=1,u(l,i,p+1,g-1)):s(a,g)?u(l,i,p+1,g):u(l,e,p+1,g),l[g]=t,p=g}var y=d?r:n;return u(l,y,p+1),l}}}();