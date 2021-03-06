/* Copyright 2007 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2008/04/15 19:39:59 gmurray71 Exp $
*/

jmaki.namespace("jmaki.widgets.jmaki.feedreader");

jmaki.widgets.jmaki.feedreader.Widget = function(wargs) {

    var _widget = this;   
    var list;
    var items = [];
    var index = 0;
    var count = 3;
    
    var maxPages = 5;

    var topic = "/jmaki/feedreader";
    var subscribe = ["/jmaki/feedreader"];    
    var filter = "jmaki.widgets.jmaki.feedreader.RSSFilter";
    
    var tagService = "https://api.feedburner.com/format/1.0/JSONP?uri=";
    
    var next;
    var prev;
    var shownav = true;
    _widget.container = document.getElementById(wargs.uuid);    
    var nav  = document.getElementById(wargs.uuid + "_nav");
    var navPages  = document.getElementById(wargs.uuid + "_mid");
    var template;
    
    jmaki.MSIE6 = /MSIE ([6])/.test(navigator.userAgent);  
    var blockHeight;
    var maxLength = 1024;

    var feed ="https://api.feedburner.com/format/1.0/JSONP?uri=TheAquarium_en";
 
    if (!jmaki.getExtension("jmaki.wait")) {
        jmaki.loadExtension({ name : "jmaki.wait", extensionDir : wargs.widgetDir});
    } 
    var themes = {
  	   ocean : 'ocean',
  	   kame : 'kame'
  	};
    var currentTheme = themes['ocean'];
    if (jmaki.config && jmaki.config.globalTheme) {
        if (themes[jmaki.config.globalTheme])
    	    currentTheme = jmaki.config.globalTheme;
    }
    nav.className += " jmk-feedreader-nav-" + currentTheme;
    _widget.container.className += " jmk-feedreader-" + currentTheme;
    // JSONP callback
    this.processJSONFeed = function(obj) {
        _widget.model = jmaki.filter(obj, jmaki.widgets.jmaki.feedreader.FeedburnerFilter);
        _widget.clearList();
        init();
    };
    
    this.loadTag = function(obj) {
    	var _tag;
    	// for action processing
    	if (obj.message) obj = obj.message;
    	if (obj.value) {  		
    		_tag = obj.value;
    		if (obj.value.value) _tag = obj.value.value;
    		else _tag = obj.value;
    	} else if (obj.label){
    		 _tag = obj.label
    	} else _tag = obj;
    	if (_tag) {  		
    		_widget.clearList();
    		items = [];
    		index = 0;
    		_widget.render();
    		_widget.getJSONFeed(tagService + _tag);
    	}
    };
    
    this.getJSONFeed = function(_url) {
       jmaki.publish("/showWait", {targetId : wargs.uuid, message : "Loading..."});    
        var _jfeed = _url + "&callback=jmaki.getWidget('" + wargs.uuid + "').processJSONFeed"; 
        jmaki.addLibraries([_jfeed], undefined,undefined, true);
    };

    this.addItem = function(text) {
        var li = document.createElement("li");
        if (blockHeight) li.style.height = blockHeight + "px";
        li.className = "jmk-feedreader-item-" + currentTheme;  
        li.innerHTML = text;
        list.appendChild(li);
    };
    
    this.destroy = function() {
        delete list;
        delete next;
        delete prev;
        _widget.container.parentNode.removeChild(_widget.container);
    };
    
    this.resize = function() {
        var _h = _widget.dim.h -2;
        if (_h > 0) _widget.container.style.height = _h + "px";  
    };

    this.render = function() {
        // remove the innerHTML
        list.innerHTML = "";
        for (var _i=index; _i < items.length && _i < (index + count); _i++) {
          _widget.addItem(items[_i]);
        }
        if ((index + count) >= _widget.model.length) {
            next.style.visibility = "hidden";
        } else {
            next.style.visibility= "visible";
        }
        if (index == 0) {
            prev.style.visibility = "hidden";
        } else {
            prev.style.visibility= "visible";
        }
        // update numbers at the bottom
        if (items.length > count) {
           navPages.innerHTML = "";
           var wroteJump = false;
           var pages =  Math.round(items.length / count);
           // round up
           if (items.length % count != 0) pages +=1;           
           var pageIndex = (index / count);
           var start = 1;         
           var stop =  maxPages + 1;
           // check if we are browsing the end of the set
           addLink(0, count, navPages); 
           if (pageIndex >= maxPages + 1) {
                   addJump(navPages);               
               if (maxPages + pageIndex >= pages) {
                   start = pages - maxPages;
                   stop = pages-1;               
               } else {             
                   start = pageIndex;
                   stop = maxPages + pageIndex;                   
               }
           } else if (maxPages > pages) {
               stop = pages -1;
           }    
            for (var i=start; i < stop && i < pages; i++) {
                addLink(i, count, navPages);
            }
            if (stop < pages - 1) addJump(navPages);  
            addLink(pages -1, count, navPages); 
        }
        _widget.resize();         
    };
    
    function addJump(_target) {
      var d = document.createElement("span");
      d.appendChild(document.createTextNode("..."));
      d.className = "jump";
      navPages.appendChild(d);        
    }    
    
    function addLink(c, count, _target) {
      // we want to be one indexed
      var g = c + 1;
      var a = document.createElement("a");
      a.pageNum = g;
      a.appendChild(document.createTextNode(g));
      a.title = "Page " + g;
      a.onclick = function(e) {            
          var _t;
          if (!e) _t = window.event.srcElement;
          else _t = e.target;               
          if (typeof _t.pageNum != 'undefined') {          
              _widget.showPage(_t.pageNum);
              
          }
      }
      if ((index / count) == c) {
          a.className = "mid-selected";
      }
      navPages.appendChild(a);        
    }
    
    this.applyTemplate = function(obj, _t) {
        for (var i in obj) {
            var token = "@{" + i + "}";
            while (_t.indexOf(token) != -1) {
                _t = _t.replace(token, obj[i]);
            }
        }
        return _t;
    };
    
    this.getNext = function() {
        if (index + count < _widget.model.length) index += count;
        _widget.clearList();        
        _widget.render();
    };
    
    this.getPrevious = function() {
        if (index > 0){
            index -= count;
            prev.enabled = "true";
        } else {
            prev.enabled = "false";
            index = 0;
        }
        _widget.clearList();        
        _widget.render();
    };
    
    this.showPage = function(num) {
        if ((num -1) * count < items.length) index = (num -1) * count;
        _widget.clearList();
        _widget.render();
    };
    
    this.clearList = function() {
        if (!list) return;
        for (var i= list.childNodes.length - 1; i > 0 ; i--) {
           list.removeChild(list.childNodes[i]);
        }  
    };

    function init() {
       list = document.getElementById(wargs.uuid + "_list");       
       if (!jmaki.MSIE6) list.style.width = "100%";         
       for (var _i=index; _i < _widget.model.length; _i++) {
         items.push(_widget.applyTemplate(_widget.model[_i], template));
       }
       var dim = jmaki.getDimensions(_widget.container, 52);
       var content = document.getElementById(wargs.uuid + "_content");
       content.style.height = dim.h - 50 + "px";
       
       if (!blockHeight && dim.h > 100) {
    	   // padding is 24 x 2 + 5 * 2
    	   var _th = dim.h - 50 - (count * 58);
    	   blockHeight = _th / count;	   
       }
       
       next = document.getElementById(wargs.uuid + "_next");
       prev = document.getElementById(wargs.uuid + "_previous");
       next.onclick = _widget.getNext;
       prev.onclick = _widget.getPrevious;
       _widget.render();
       if (shownav) nav.style.display = "block";
       jmaki.publish("/hideWait", {targetId : wargs.uuid});
    }
    
    this.destroy = function() {
        for (var i=0; _widget.subs && i < _widget.subs.length; i++) {
            jmaki.unsubscribe(_widget.subs[i]);
        }
    };       
    
    function doSubscribe(topic, handler) {
        var i = jmaki.subscribe(topic, handler);
        _widget.subs.push(i);     
    }
    
    this.clear = function() {
        items = [];
    
    };
    
    this.postLoad = function() {
        _widget.dim =jmaki.getDimensions(_widget.container);
       _widget.resize();
        if (wargs.args) {
            if (wargs.args.count) {
                count = Number(wargs.args.count);
            }
            if (wargs.args.entryMaxLength) {
                maxLength = Number(wargs.args.entryMaxLength);
            }            
            if (wargs.args.blockHeight) {
                blockHeight = Number(wargs.args.blockHeight);
            }
            if (typeof wargs.args.shownavigation != 'undefined') {        
                shownav = wargs.args.shownavigation;  
                if (nav && shownav == false) nav.style.display = "none";
            }
           if (wargs.args.filter) {
               filter = wargs.args.filter;
           }
           if (wargs.args.feed) {
               feed = wargs.args.feed;
           }
           if (wargs.args.navpages) {
               if (wargs.args.navpages >2) maxPages = wargs.args.navpages - 1;
           } 
        }
        
        if (wargs.publish){
            topic = wargs.publish;
        }       
        template = unescape(document.getElementById(wargs.uuid + "_template").innerHTML + "");
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
        	doSubscribe(subscribe[_i] + '/loadTag', _widget.loadTag);
        }
        if (wargs.value) {      	
            if (wargs.args && wargs.args.filter){
                _widget.model = jmaki.filter(wargs.value, wargs.args.filter);
            } else  _widget.model = wargs.value;
            init();
        } else if (wargs.service) {
            jmaki.publish("/showWait", {targetId : wargs.uuid, message : "Loading..."});
            jmaki.doAjax({url: wargs.service, callback: function(req) {
                        
                        var _in = eval('(' + req.responseText + ')');
                        if (_in.dataType) {
                            if (_in.dataType == "jmakiRSS") {
                              _widget.model = jmaki.filter(_in, filter);
                            }  else {
                              _widget.model = _in;
                            }
                        } else {
                            _widget.model = _in;
                        }
                        init();
            }});
        } else if (feed) {        	
            _widget.getJSONFeed(feed);
        }        
    };
    
    jmaki.widgets.jmaki.feedreader.RSSFilter = function(_in) {
    var _rows = [];

    for (var _i=0; _i < _in.channel.items.length;_i++) {
      var _des = _in.channel.items[_i].content;
      
        var rex = new RegExp("\\\\n", "g");
        _des =  _des.replace(rex," ");

        rex = new RegExp("\\\\\"","g");
        _des =  _des.replace(rex,"\"");
        var rex2 = new RegExp("<p>.*?</p>");
//      var content = _des.match(rex2)[0];
	    var content = _des;

        if (content.length > maxLength) {
          content = content.substring(0, maxLength) + "... ";
        }
        var row = {      
          title : _in.channel.items[_i].title,
          link : _in.channel.items[_i].link,
          date : _in.channel.items[_i].date,
          body : _des,
          shortContent : content
       };
      _rows.push(row);
    }
    return _rows;    
  }
  
  jmaki.widgets.jmaki.feedreader.FeedburnerFilter = function(_in) {
    var _rows = [];

    for (var _i=0; _i < _in.feed.items.length;_i++) {
      var _des = _in.feed.items[_i].body;
      
        var rex = new RegExp("\\\\n", "g");
        _des =  _des.replace(rex," ");

        rex = new RegExp("\\\\\"","g");
        _des =  _des.replace(rex,"\"");
        var rex2 = new RegExp("<p>.*?</p>");
//      var content = _des.match(rex2)[0];
	    var content = _des;

        if (content.length > maxLength) {
          content = content.substring(0, maxLength) + "... ";
        }
        var row = {      
          title : _in.feed.items[_i].title,
          link : _in.feed.items[_i].link,
          date : _in.feed.items[_i].date,
          body : _des,
          shortContent : content
       };
      _rows.push(row);
    }
    return _rows;  
} 
};

jmaki.namespace("jmaki.extensions.jmaki.wait");

jmaki.extensions.jmaki.wait.Extension = function(eargs) { 
 this.showWait = function(args) {     
   if (args.targetId) {   
       var target = document.getElementById(args.targetId);        
       if (target) {
          var loc = jmaki.getPosition(target);
          var dim = jmaki.getDimensions(target);        
          var cw = target.clientWidth;
          var ch = target.clientHeight;
          if (ch==0) {
               ch = dim.h;
               cw = dim.w;
          }
          var splashW = 150;
          var splashH = 150;
          var iconW = 128;
          var iconH = 128;
          // resize the loader to be poportioinal
          if (ch < iconH && ch) {
              splashH = ch -10;
              splashW = splashH;
              iconH = splashH - 15;
              iconW = iconH;
          }
          var splash = document.createElement("div");
          splash.id = args.targetId + "_splash";
          splash.style.position = "absolute";
          splash.style.zIndex = 9998;

          document.body.appendChild(splash);

          splash.style.opacity = .65;
          // TODO : Need this for IE
          var icon = document.createElement("img");
          icon.style.position = "relative";
          icon.src = eargs.extensionDir + "/images/loading.gif";
       
          splash.appendChild(icon);
          icon.style.width = iconW + "px";
          icon.style.height = iconH + "px";
          icon.style.top = (splash.clientHeight / 2) - (iconH / 2)  +  "px";
                    
          if (args.message) {       
              var message = document.createElement("div");
              message.innerHTML = args.message;
              message.style.color = "#000";             
              message.style.position = "absolute";
              message.style.width = "97%";
              message.style.textAlign = "center";
              message.style.fontSize = "12px"; 
              message.style.top = iconH + 10 + "px";
              message.style.left = '5px';
              splash.appendChild(message);

              splashH += 25;
              splashW += 25;      
          }                    
       }
       if (typeof args.modal !='undefined' && args.modal == true) {
             splash.style.width = cw + "px";
             splash.style.height = ch + "px";
             splash.style.top = loc.y + "px";
             splash.style.left = loc.x + "px";              
         } else {
             splash.style.width = splashW + "px";
             splash.style.height = splashH + "px";
             splash.style.left = loc.x + (cw / 2) - (splashW / 2) +  "px";
             splash.style.top = loc.y  + (ch / 2) - (splashH / 2) +  "px";                            
         }
         icon.style.left = (splash.clientWidth / 2) - (iconW / 2)  +  "px";
     }

   };
  jmaki.subscribe("/showWait", this.showWait);
 
   this.hideWait = function(args) {
     if (args.targetId) { 
         var target = document.getElementById(args.targetId + "_splash");
         if (target) {
             target.parentNode.removeChild(target);
         }
     }
   };
   jmaki.subscribe("/hideWait", this.hideWait); 
};
