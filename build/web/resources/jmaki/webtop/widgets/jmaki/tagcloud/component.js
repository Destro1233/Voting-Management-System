/* Copyright 2008 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2007/04/15 19:39:59 gmurray71 Exp $
*/
/**
 * jMaki Tag Cloud
 * 
 * version 1.1
 *
 * Author : Greg Murray
 * gmurray71 (a) dev.java.com
 * 
 * 
 */
jmaki.namespace("jmaki.widgets.jmaki.tagcloud");

jmaki.widgets.jmaki.tagcloud.Widget = function(wargs) {
    
    var _widget = this;
    _widget.model = {};
    var defaultSize = 15;
    
    var publish = "/jmaki/tagcloud";
    var publishSubType = "onSelect";
    
    if (wargs.args) {     
        if (wargs.args.publishSubType) {
            publishSubType = wargs.args.publishSubType;
        }
    }
    
    var tags = [];

    _widget.outerContainer = document.getElementById(wargs.uuid);
    _widget.container = document.getElementById(wargs.uuid + "_container");
    
    var padding = 2;
    
    this.resize = function() {
	    var dim = jmaki.getDimensions(_widget.outerContainer,55);
	    var startHeight = dim.h;    
	    _widget.outerContainer.style.height = startHeight - 2 + "px";  
	
	    startHeight -= 52;

	    _widget.container.style.height = startHeight + "px";
    };

    function collapseAll(target) {
        for (var i=0; i < tags.length; i++) {
          if (tags[i].expander && (target != tags[i])) {
              tags[i].isExpanding = false;
              
              tags[i].collapseImmediately = true;
              if (tags[i].isCollapsed == false){
                      collapse(tags[i].expander, tags[i]);
              }  
          }    
        }
    }
    
    function collapse(expander, target) {
       
        if (target.currentSize > target.initialSize) {
            target.currentSize -= 1;
            expander.style.fontSize = target.currentSize + "px";
            // keep exapanding
            setTimeout(function() {collapse(expander, target)}, 15);
        } else {
            expander.style.fontSize = target.initialSize + "px";           
            target.isCollapsed = true;
            target.style.visibility = "visible";
            target.isCollapsing = false;
            target.collapseImmediately = false;
            expander.style.display = "none";

        }
    }
    
   function bubble(expander,target) {
                
        if (target.currentSize < target.maxSize && target.isExpanding == true) {
            target.currentSize += 1;
            expander.style.fontSize = target.currentSize + "px";
            // keep exapanding
            setTimeout(function() {bubble(expander, target)}, 15);
            
        } else {
            target.isExpanding = false;

            if (target.collapseImmediately == true) {
                collapseHandler(target);
            }
        }
    }
    
    function collapseHandler(target) {
     
        if (target.isExpanding == true){ 
            target.collapseImmediately = true;
            return;
        }
        if (target.isCollapsing == true) return;

        setTimeout(function() {collapse(target.expander, target);}, 250);

    }
    
    function bubbleHandler() {
        collapseAll();
        var target = this;
        target.collapseImmediately = false;

        target.isExpanding = true;
        target.isCollapsed = false;
        if (!this.expander) {
            this.isCollapsing = false;
            this.expander = document.createElement("div");
            this.expander.className = "jmaki-tagcloud-expander";
            this.expander.innerHTML = this.innerHTML;
            // set the relative location
            var pX = 0;
            var pY = 0;
            if(target.offsetParent) {
                    pY += target.offsetTop;
                    pX += target.offsetLeft;
            } else if(target.y) {
                    pY += target.y;
                    pX += target.x;
            }            
            this.expander.style.left = pX + "px";
            this.expander.style.top = pY + "px";         
            
            this.expander.mousemove = function() {
              if (target.timeout) clearTimeout(target.timeout);  
            };
            this.expander.onmouseout = function() {
                target.isExpanding = false;         
                collapseHandler(target);
            };
            this.expander.onclick = function() {
                jmaki.processActions({ topic : publish, 
                    action : target.item.action, 
                    targetId : target.tagId,
                    type : publishSubType,
                    value : { weight : target.item.size, label : target.item.label }
                });
         
                if (target.item.href && !target.item.target) {
                    window.location.href = target.item.href;
                } else if (target.item.target) {               
                    target.target = target.item.target;                    
                    target.href= target.item.href;
                }
            };  
            _widget.container.parentNode.appendChild(this.expander);
        } else {
            this.expander.style.display = "block";
        }
        this.style.visibility = "hidden";    
        bubble(this.expander, this);
    }
    
    function init(){
        _widget.resize();
        if (_widget.model) {
            for (var i=0; i < _widget.model.items.length;i++) {
            	var t = {};
            	t.label = _widget.model.items[i].label;
            	t.href = _widget.model.items[i].href;
            	if (_widget.model.items[i].id) t.tagId = _widget.model.items[i].id;
            	t.weight = _widget.model.items[i].weight;
            	_widget.addTag(t);        
            }
        }
    }
            
    this.addTag = function(t) {
        var tag = document.createElement("div");
        tag.innerHTML = t.label;
        tag.item = t;
        tag.className = "jmaki-tagcloud-tag";
        if (!t.tagId) tag.tagId = wargs.uuid + "_tag_" + jmaki.genId();
        else tag.tagId = t.tagId;
                
        if (!t.weight) tag.weight = .50;
        else tag.weight = t.weight / 100;

        tag.initialSize = (defaultSize * tag.weight);
        tag.style.fontSize = tag.initialSize + "px";
        tag.currentSize = tag.initialSize;
        tag.expanding = false;
        // allow for 3 times growth
        tag.maxSize = tag.initialSize * 1.5;
        tag.onmouseover = bubbleHandler;

        tag.onclick = bubbleHandler;

        _widget.container.appendChild(tag);
        tags.push(tag);
    }; 
    
    this.postLoad = function() {
        if (wargs.publish) publish = wargs.publish;
        if (wargs.value) {
            _widget.model = wargs.value;
            init();
        } else if (wargs.service) {
            jmaki.doAjax({url: wargs.service, callback: function(req) {
                _widget.model = eval('(' + req.responseText + ')');
                init();
          }});
        }
    };
};