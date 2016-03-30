/* Copyright 2007 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2007/04/15 19:39:59 gmurray71 Exp $
*/
dojo.require("dojox.widget.FisheyeList");

// define the namespaces
jmaki.namespace("jmaki.widgets.dojo.dijit.fisheye");

/**
 * @constructor
*/
jmaki.widgets.dojo.dijit.fisheye.Widget = function(wargs) {

    // default topic
    var _widget = this;
    var publish = "/dojo/digit/fisheye";
    var orientation = "horizontal";
    var labelEdge = "bottom";
    var items = ["item1","item2","item3"];
    // create the top level widget
    var container = document.getElementById(wargs.uuid);
    var data;

    var counter = 0;

    function genId() {
        return wargs.uuid + "_item_" + counter++;
    }

    var showedDeprecation = false;
    
    function showDeprecationMessage() {
        if (showedDeprecation == false) {
            jmaki.log("FishEye with id : " + wargs.uuid + " uses a deprecated model. Please see " +
                  "<a href='http://wiki.java.net/bin/view/Projects/jMakiFisheyeModel'>"+
                  "http://wiki.java.net/bin/view/Projects/jMakiFisheyeModel</a> " +
                  "for more on the model.");
            showedDeprecation = true;
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
   /**
    *  init  private function to initialize after widget has loaded
    */       
    function init() {
       _widget.wrapper =  new dojox.widget.FisheyeList(
          { orientation : orientation, 
            itemWidth:50,
            itemHeight:50,
            itemMaxWidth:200,
            itemMaxHeight:200,
            effectUnits:2,
            itemPadding:10,
            attachEdge:"top",
            labelEdge:labelEdge
         }, container);
         if (wargs.args && wargs.args.items) {
            showDeprecationMessage();
            for (var ii=0; ii < wargs.args.items.length; ii++) {
                var i = wargs.args.items[ii];
                var icon = new dojox.widget.FisheyeListItem();
                if (i.id) icon.targetId = i.id;
                icon.onClick = function () {
                    jmaki.publish(topic + "/onSelect", {widgetId : wargs.uuid, target:this, targetId : this.targetId});
                }
                _widget.wrapper.addChild(icon);
            }
            return;
         }   

         for (var i=0; i < data.length; i++) {
            var t = data[i];
            var fi = { iconSrc : t.iconSrc, caption : t.label};
            var icon = new dojox.widget.FisheyeListItem(fi);
            if (t.id)icon.targetId = t.id;
            else icon.targetId = genId();
            
            if (t.action) {
                icon.action = t.action;
                icon.onClick = function() {
                    processActions(this, this.targetId, 'onSelect');
                }
            } else if (t.href) {
                icon.onClick = function() {
                   window.location.href = t.href;
                }
            } else {
                icon.onClick = function() {
                   processActions(this, this.targetId, 'onSelect');     
                }
            }
            icon.postCreate();
            _widget.wrapper.addChild(icon);
            _widget.wrapper.startup();
            icon.startup();
        }
   }     
 
 
   this.destroy = function() {
   };
   /**
    *  postLoad  read the args if any and initialize the widget.
    */
   this.postLoad = function() {
       if (wargs.args) {
            if (wargs.args.orientation){
               orientation = wargs.args.orientation;
               if (orientation == "vertical") {
                   labelEdge = "right";
               }
            }
            if (wargs.args.labelEdge){
                   labelEdge = wargs.args.labelEdge;
            }

            if (wargs.args.topic) {
                publish = wargs.args.topic;
                jmaki.log("Dojo fisheye: widget uses deprecated topic property. Use publish instead. ");
            }        
        }

        if (wargs.publish ) {
                publish = wargs.publish; 
         } 
         
       if (wargs.value) {
            data = wargs.value;
            if (data instanceof Array) {
              init();  
            } else {
                showDeprecationMessage();
            }    
        } else if (wargs.service) {
            jmaki.doAjax(
                {url: wargs.service, 
                    callback: function(req) {
                        if (req.responseText == "") {
                            container.innerHTML = "No data provided by: " + wargs.service;
                            return;
                        }
                        var _in = eval('(' + req.responseText + ')');
                        //new format if using the data store need to provide followin properties
                        data = _in;
                        init();
                    },
                    onerror : function (message) {
                        container.innerHTML = "Failed to load data: " + message;
                    }
                }
            );
        }
   };
}

