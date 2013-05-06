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
var LiquidMetal=function(){function t(t,e){var i=t.charAt(e);return i>="A"&&"Z">=i}function e(t,e){var i=t.charAt(e-1);return" "==i||"	"==i}function i(t,e,i,n){i=Math.max(i||0,0),n=Math.min(n||t.length,t.length);for(var s=i;n>s;s++)t[s]=e;return t}var n=0,s=1,o=.8,r=.9,a=.85;return{score:function(t,e){if(0==e.length)return o;if(e.length>t.length)return n;for(var i=this.buildScoreArray(t,e),s=0,r=0;i.length>r;r++)s+=i[r];return s/i.length},buildScoreArray:function(l,c){for(var h=new Array(l.length),u=l.toLowerCase(),d=c.toLowerCase().split(""),p=-1,f=!1,m=0;d.length>m;m++){var g=d[m],v=u.indexOf(g,p+1);if(0>v)return i(h,n);0==v&&(f=!0),e(l,v)?(h[v-1]=1,i(h,a,p+1,v-1)):t(l,v)?i(h,a,p+1,v):i(h,n,p+1,v),h[v]=s,p=v}var y=f?r:o;return i(h,y,p+1),h}}}();