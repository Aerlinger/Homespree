(function(){var t,e={}.hasOwnProperty,i=function(t,i){function n(){this.constructor=t}for(var s in i)e.call(i,s)&&(t[s]=i[s]);return n.prototype=i.prototype,t.prototype=new n,t.__super__=i.prototype,t};Mercury.PageEditor=function(e){function n(){return t=n.__super__.constructor.apply(this,arguments)}return i(n,e),n.prototype.save=function(){var t,e,i,n;e=null!=(i=null!=(n=this.saveUrl)?n:Mercury.saveUrl)?i:this.iframeSrc(),t=this.serializeAsXml(),console.log("saving",t)},n.prototype.serializeAsXml=function(){var t,e,i,n,s,r,o,a;t=this.serialize(),i=[];for(e in t){n=t[e],r=[],a=n.snippets;for(s in a)o=a[s],r.push("<"+s+' name="'+o.name+'"><![CDATA['+jQuery.toJSON(o.options)+"]]></"+s+">");i.push('<region name="'+e+'" type="'+n.type+'"><value>\n<![CDATA['+n.value+"]]>\n</value><snippets>"+r.join("")+"</snippets></region>")}return"<regions>"+i.join("")+"</regions>"},n}(Mercury.PageEditor)}).call(this);