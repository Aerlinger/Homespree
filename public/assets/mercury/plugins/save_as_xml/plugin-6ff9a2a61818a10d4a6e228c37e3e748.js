/*!
 * This is an example plugin that will serialize to XML instead of JSON before saving.  This could be useful to someone,
 * but is mostly provided as an example of how to write a simple plugin.
 *
 * This file is could be a nice place to provide configuration options for your plugin.
 *


 */
(function(){var e,t={}.hasOwnProperty,n=function(e,n){function i(){this.constructor=e}for(var r in n)t.call(n,r)&&(e[r]=n[r]);return i.prototype=n.prototype,e.prototype=new i,e.__super__=n.prototype,e};Mercury.PageEditor=function(t){function r(){return e=r.__super__.constructor.apply(this,arguments),e}return n(r,t),r.prototype.save=function(){var e,t,n,r,i,s=this;n=(r=(i=this.saveUrl)!=null?i:Mercury.saveUrl)!=null?r:this.iframeSrc(),e=this.serializeAsXml(),console.log("saving",e);return},r.prototype.serializeAsXml=function(){var e,t,n,r,i,s,o,u;e=this.serialize(),n=[];for(t in e){r=e[t],s=[],u=r.snippets;for(i in u)o=u[i],s.push("<"+i+' name="'+o.name+'"><![CDATA['+jQuery.toJSON(o.options)+"]]></"+i+">");n.push('<region name="'+t+'" type="'+r.type+'"><value>\n<![CDATA['+r.value+"]]>\n</value><snippets>"+s.join("")+"</snippets></region>")}return"<regions>"+n.join("")+"</regions>"},r}(Mercury.PageEditor)}).call(this);