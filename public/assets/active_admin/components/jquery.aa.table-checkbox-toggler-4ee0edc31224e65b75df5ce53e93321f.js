(function(){var e,t={}.hasOwnProperty,n=function(e,n){function i(){this.constructor=e}for(var r in n)t.call(n,r)&&(e[r]=n[r]);return i.prototype=n.prototype,e.prototype=new i,e.__super__=n.prototype,e};window.AA.TableCheckboxToggler=AA.TableCheckboxToggler=function(t){function r(){return e=r.__super__.constructor.apply(this,arguments),e}return n(r,t),r.prototype._init=function(){return r.__super__._init.apply(this,arguments)},r.prototype._bind=function(){var e=this;return r.__super__._bind.apply(this,arguments),this.$container.find("tbody").find("td").bind("click",function(t){if(t.target.type!=="checkbox")return e._didClickCell(t.target)})},r.prototype._didChangeCheckbox=function(e){var t;return r.__super__._didChangeCheckbox.apply(this,arguments),t=$(e).parents("tr"),e.checked?t.addClass("selected"):t.removeClass("selected")},r.prototype._didClickCell=function(e){return $(e).parent("tr").find(":checkbox").click()},r}(AA.CheckboxToggler),function(e){return e.widget.bridge("tableCheckboxToggler",AA.TableCheckboxToggler)}(jQuery)}).call(this);