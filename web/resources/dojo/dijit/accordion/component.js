dojo.require("dijit.layout.AccordionContainer");

jmaki.namespace("jmaki.widgets.dojo.dijit.accordion");

/**
 * Dojo Dijit Accordion
 * @constructor
 * 
*/
jmaki.widgets.dojo.dijit.accordion.Widget = function(wargs) {
	
    var _widget = this;
    var publish = "/dojo/accordion";
    var subscribe =  ["/dojo/accordion", "/accordion"];
    
    var container = document.getElementById(wargs.uuid);
    
    var dim = jmaki.getDimensions(container);    
    if (container && container.style && container.style.height <= 0 && container.parentNode.nodeName == "BODY") {
      container.style.height = "300px";
    } else {
    	container.style.height = dim.h - 1 + "px";
    }

    var wrapper; 
    var rowMappings = {};
    this.rows = [];
    var iframe = false;
    var of = "hidden";
   
    var selectedIndex = 0;

    this.selectRow = function(e) {
        var rowId;
        if (e.message)e = e.message;
        if (e.targetId) rowId = e.targetId;
        else rowId = e;
   
        if (rowMappings[rowId]) {
            var row = rowMappings[rowId];
            wrapper.selectChild(row);
            if (row.url && row.contentLoaded == false){
                row.dcontainer.loadURL(row.url);
                row.contentLoaded = true;
            }
        }
    }
            
    this.setContent = function(e, c) {
        var rowId;
        var content;
        if (e.message)e = e.message;
        if (e.targetId) rowId = e.targetId;
        else rowId = e;
        if (e.value) content = e.value;
        else content = c;
        if (rowMappings[rowId]) {        
            var row = rowMappings[rowId];
            if (content){
                row.dcontainer.setContent(content);
                row.contentLoaded = true;
               // row.setContent(content);
                
            }
        }
    }
       
    this.setInclude = function(e, c) {
        var rowId;
        var include;
        if (e.message)e = e.message;
        if (e.targetId) rowId = e.targetId;
        else rowId = e;
        if (e.value) include = e.value;
        else include = c;
        if (rowMappings[rowId]) {
            var row = rowMappings[rowId];
            if (include){
               row.dcontainer.loadURL(include);
                row.contentLoaded = true;

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

      function init() {  
          wrapper = new dijit.layout.AccordionContainer({}, container);
          for(var i=0; i < _widget.rows.length; ++i) {       
              var _row = _widget.rows[i];
               var rowId = _row.id;
               if (typeof rowId == 'undefined') {
                 rowId = wargs.uuid + "_tab_" + i;
               }

               var _d = document.createElement("div");
               _d.id = rowId;
               document.body.appendChild(_d);

               if (_row.overflow) of = _row.overflow;
               if ( _row.iframe )iframe = _row_iframe; 

               var _pane = new dijit.layout.AccordionPane({title: _row.label, selected: _widget.rows[i].selected},_d);
               wrapper.addChild(_pane);
               var _node=_pane.containerNode;;
               var _pdc = new jmaki.DContainer(
                     {target: _node,
                     useIframe : iframe,
                     content : _row.content,
                     overflow: of});             
               _pane.dcontainer = _pdc;
               if (_row.lazyLoad && _row.lazyLoad == true) {
                    _pane.url = _row.include;                
                    _pane.contentLoaded = false; 
               } else if (_row.include){
                      _pane.url = _row.include;
                      _pane.dcontainer.loadURL(_pane.url);
                      _pane.contentLoaded = true;
               }                  

               _pane.startup();
               rowMappings[rowId] = _pane;
 
          }
          dojo.connect(wrapper, "selectChild",function(row){
              if (row) {
                 processActions(row,row.id, 'onSelect');
                 if (row.url && row.contentLoaded == false){
                    row.dcontainer.loadURL(row.url);
                    row.contentLoaded = true;
                }
             }
           } );
          wrapper.startup();
    }

    function doSubscribe(topic, handler) {
        var i = jmaki.subscribe(topic, handler);
        _widget.subs.push(i);
    }
    /**
     *  destroy unsubscribe the event listeners.
     *
     */      
    this.destroy = function() {
        for (var i=0; _widget.subs && i < _widget.subs.length; i++) {
            jmaki.unsubscribe(_widget.subs[i]);
        }
    };
    
    this.postLoad = function(){

        if (wargs.args) {
           if (  wargs.args.selectedIndex != 'undefined') {
               selectedIndex = Number(wargs.args.selectedIndex);
	   }
            if (wargs.args.topic) {
                topic = wargs.args.topic;
                jmaki.log("Dojo dijit accordion: widget uses deprecated topic property. Use publish instead. ");
            }

        }

        if (wargs.publish ) {
            topic = wargs.publish;
         }

        if (wargs.subscribe){
            if (typeof wargs.subscribe == "string") {
                subscribe = [];
                subscribe.push(wargs.subscribe);
            } else {
                subscribe = wargs.subscribe;
            }
        }
       // track the subscribers so we can later remove them
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i] + "/setContent", _widget.setContent);
            doSubscribe(subscribe[_i] + "/setInclude", _widget.setInclude);
            doSubscribe(subscribe[_i] + "/select", _widget.selectRow);
        } 
        
        // pull in the arguments
        if (typeof wargs.value != "undefined") {
            if(wargs.value.rows)
               _widget.rows = wargs.value.rows;
            else if (wargs.value.items)
               _widget.rows = wargs.value.items;

            init();
        } 
        if (wargs.service) {
            jmaki.doAjax({url: wargs.service, callback: function(req) {
                  var data = eval('(' + req.responseText + ')');
                  _widget.rows = data.rows;
                  init();
            }
        });
        } 

  };
};
