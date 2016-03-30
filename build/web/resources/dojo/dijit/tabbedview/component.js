dojo.require("dijit.layout.ContentPane");
dojo.require("dijit.layout.TabContainer");

jmaki.namespace("jmaki.widgets.dojo.dijit.tabbedview");

/**
 * Dojo Dijit Tabbed View
 * 
 * @author Greg Murray
 * 
 * @constructor
*/
jmaki.widgets.dojo.dijit.tabbedview.Widget = function(wargs) {
    
    var _widget = this;
    

    var container = document.getElementById(wargs.uuid);
    var tabs = [];
    var publish = "/dojo/tabbedview";
    var subscribe = ["/dojo/tabbedview", "/tabbedview"]; 
    
    var tabMappings = {};
    var select_tab;
    var firstTab;
    
    var showedModelWarning = false;
    
    function showModelDeprecation() {
        if (!showedModelWarning) {
             jmaki.log("Dojo tabbed view  widget with id " + wargs.uuid + " uses the incorrect data format. Please see " +
                       "<a href='http://wiki.java.net/bin/view/Projects/jMakiTabbedViewDataModel'>" +
                       "http://wiki.java.net/bin/view/Projects/jMakiTabbedViewDataModel</a> " +
                       "for the proper format.");
             showedModelWarning = true;
        }
    }    

    // pull in the arguments
    if (wargs.args && wargs.args.topic ) {
            publish = wargs.args.topic;
            jmaki.log("Dojo tabbed view: widget uses deprecated topic property. Use publish instead. ");
    }
    if (wargs.publish) topic = wargs.publish;
    if (wargs.subscribe){
        if (typeof wargs.subscribe == "string") {
            subscribe = [];
            subscribe.push(wargs.subscribe);
        } else {
            subscribe = wargs.subscribe;
        }
    }
        
   this.selectTab = function(e) {   
	   if (!e) return;
        var tabId;
        if (e.message)e = e.message;
        if (e.targetId) tabId = e.targetId;
        else tabId = e;
        
        if (tabMappings[tabId]) {      	
            var tab = tabMappings[tabId];
            tab.style.display = 'block';
            _widget.wrapper.selectChild(tab);
            
            if (tab.url && tab.contentLoad == false){       	
                tab.dcontainer.loadURL(tab.url);
                tab.contentLoaded = true;
            }
        }
    }
            
    this.setContent = function(e, c) {
        var tabId;
        var content;
        if (e.message)e = e.message;
        if (e.targetId) tabId = e.targetId;
        else tabId = e;
        if (e.value) content = e.value;
        else content = c;
        if (tabMappings[tabId]) {
            var tab = tabMappings[tabId];
            if (content){
                tab.dcontainer.setContent(content);
                tab.contentLoaded = true;
            }
        }
    }
       
    this.setInclude = function(e, c) {
        var tabId;
        var include;
        if (e.message)e = e.message;
        if (e.targetId) tabId = e.targetId;
        else tabId = e;
        if (e.value) include = e.value;
        else include = c;
        if (tabMappings[tabId]) {
            var tab = tabMappings[tabId];
            if (include){
                tab.dcontainer.loadURL(include);
                tab.contentLoaded = true;
            }
        }
    } 
    
    function clone(t) {
       var obj = {};
       for (var i in t) {
            obj[i] = t[i];
       }
       return obj;
    }

    function processActions(_t, _pid, _type, _value) {
        if (_t) {
            var _topic = publish;
            var _m = {widgetId : wargs.uuid, type : _type, targetId : _pid};
            if (typeof _value != "undefined") _m.value = _value;
            var action = _t.action;
            if (!action) _topic = _topic + "/" + _type;
            if (action && action instanceof Array) {
              for (var _a=0; _a < action.length; _a++) {
                  var payload = clone(_m);
                  if (action[_a].topic) payload.topic = action[_a].topic;
                  else payload.topic = publish;
                  if (action[_a].message) payload.message = action[_a].message;
                  jmaki.publish(payload.topic,payload);
              }
            } else {
              if (action && action.topic) {
                  _topic = _m.topic = action.topic;
              }
              if (action && action.message) _m.message = action.message;                
              jmaki.publish(_topic,_m);
            } 
        }
    }
    
    function doSubscribe(topic, handler) {
        var i = jmaki.subscribe(topic, handler);
        _widget.subs.push(i);
    }
    
    this.destroy = function() {
        for (var i=0; _widget.subs && i < _widget.subs.length; i++) {
            jmaki.unsubscribe(_widget.subs[i]);
        }
    }
   
   function init() {
	    
       var _dim = jmaki.getDimensions(container, 50);

       container.style.height = _dim.h + "px";
       var _panes = [];
       var startHeight = _dim.h - 50;
       
       var _insertionPoint = document.getElementById(wargs.uuid + "_container");
       
       _widget.wrapper= new dijit.layout.TabContainer({parseOnLoad: false, doLayout : false}, _insertionPoint);

       for(var _i=0;  tabs[_i] && tabs[_i].label && _i < tabs.length; ++ _i) {
            var _row = tabs[ _i];

            var divId = wargs.uuid + "_tab_div_" +  _i;
            var tabId = _row.id;
            if (!tabId) {
                tabId = wargs.uuid + "_tab_" +  _i;
            }
             var cp = new dijit.layout.ContentPane({parseOnLoad: false, doLayout : false, title : _row.label, tabId : tabId, id: _row.tabId});
            _widget.wrapper.addChild(cp);           

            cp.domNode.innerHTML  = "<div id='" + tabId + "' style='height:" + startHeight + "px;display:block'>Loading Tab " + _i + "</div>";
            cp.tid = tabId;
            _panes.push(cp);
      }

      for(var _i=0;  tabs[_i] && tabs[_i].label && _i < tabs.length; ++ _i) {
          var _row = tabs[ _i];
          if ( typeof _row.selected != 'undefined' && _row.selected == true)  select_tab = tabId;          
          if (_row.action) _c.action = _row.action;
    	   var _cp = _panes[_i]; 
    	   var _tabId = _cp.tid;
            var of = 'hidden';
            if (_row.overflow) of = _row.overflow;
            var iframe = _row.iframe;
            var _iurl = undefined;
            if (_row.lazyLoad && _row.lazyLoad == true) {
                _cp.url = _row.include;                
                _cp.contentLoaded = false; 
                if (_row.include){
                    _cp.url = _row.include;                
                    _cp.contentLoaded = false; 
                }    
            } else if (_row.include){
                 _iurl = _row.include;
                _cp.contentLoaded = true;
            }
            if (!_row.content && _row.include) _row.content = "Loading...";  
          
            var _div = document.getElementById(_tabId);

            var _dc = new jmaki.DContainer(
                {target: _div,
                  startHeight : _dim.h -44,
                  startWidth : _dim.w - 24,
                  content : _row.content,
                  useIframe : iframe,
                  overflow: of,
                   url :  _iurl}); 
                tabMappings[tabId] = _cp;
               // if (!firstTab) firstTab = _cp;
                if (!firstTab) firstTab = _cp.tabId;
                _cp.dcontainer = _dc;  
                             

                if (_iurl) {
                	_cp.dcontainer.loadURL(_iurl);
                	_cp.contentLoaded = true;	
                }
                
        }

       dojo.connect(_widget.wrapper, "selectChild",function(row){
          if (row) {
             processActions(row,row.id, 'onSelect');
             if (row.url && row.contentLoaded == false){
                row.dcontainer.loadURL(row.url);
                row.contentLoaded = true;
            }
         }
       } );
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i]  + "/select", _widget.selectTab);
            doSubscribe(subscribe[_i] + "/setContent", _widget.setContent);
            doSubscribe(subscribe[_i] + "/setInclude", _widget.setInclude);
        }
    }
   
    if (wargs.value) {     
        if (wargs.value.tabs) {
            showModelDeprecation();
            tabs = wargs.value.tabs;
        } else if (wargs.value.items) {
            tabs = wargs.value.items;
        } else {
            showModelDeprecation();
            return;
        }
    } else if (wargs.service){
        var  _s = wargs.service;
        var callback = function(req) {
            if (req.responseText == '') {  
                container.innerHTML = "Error loading widget data. No data.";
                return;
            }
            var obj = eval("(" + req.responseText + ")");
            
            if (obj.tabs) {
                showModelDeprecation();
                tabs = obj.tabs;
            } else if (obj.items){
                tabs = obj.items;
            } else {
               showModelDeprecation();
               return;
            }
        }
       
        jmaki.doAjax({url : _s,
            callback : callback,
            synchronous : true,
            onerror : function() {
                container.innerHTML = "Error loading widget data.";
            }
        });       
    } else {
        var  _s = wargs.widgetDir + "/widget.json";
        var callback = function(req) {
            var obj = eval("(" + req.responseText + ")");
            tabs = obj.value.defaultValue.items;
        }
       
        jmaki.doAjax({url : _s,
            callback : callback,
            synchronous : true,
            onerror : function() {
                container.innerHTML = "Error loading widget data.";
            }
        });
    };
    
    this.postLoad = function() {
	
        if (jmaki.loaded) {
			init();
			// get the outer container and resize to it's height'
			var oc = document.getElementById(wargs.uuid + "_container");
			var t = {
				w :"100%",
				h :oc.clientHeight
			}
			_widget.wrapper.resize(t);
			_widget.wrapper.startup();
			_widget.wrapper.layout();

			if (select_tab)
				_widget.selectTab(select_tab);
			else
				_widget.selectTab(firstTab);
		} else {
	        dojo.addOnLoad(function(){
	            init();
	            // get the outer container and resize to it's height'
	            var oc = document.getElementById(wargs.uuid + "_container");
	            var t = {
			w: "100%",
			h: oc.clientHeight
		    }
	            _widget.wrapper.resize(t);         
	            _widget.wrapper.startup();   
	            _widget.wrapper.layout();   
	            
	            if (select_tab) _widget.selectTab(select_tab);
	            else _widget.selectTab(firstTab);
	        });
        }
    }
};