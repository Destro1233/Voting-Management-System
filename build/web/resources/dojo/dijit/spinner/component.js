/* Copyright 2008 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2008/04/15 19:39:59 gmurray71 Exp $
*/

dojo.require("dijit.form._Spinner");
dojo.require("dojo.data.ItemFileWriteStore");

jmaki.namespace("jmaki.widgets.dojo.dijit.spinner");

/**
 * @constructor
*/
jmaki.widgets.dojo.dijit.spinner.Widget = function(wargs) {
    
    var _widget = this;
    _widget.index = 0;
    var container = document.getElementById(wargs.uuid);

    var publish = "/dojo/dijit/spinner";
    var subscribe = ["/dojo/dijit/spinner", "/spinner"];
    
    if (wargs.publish ) {
	    publish = wargs.publish;
    }
     
    if (wargs.subscribe){
        if (typeof wargs.subscribe == "string") {
            subscribe = [];
            subscribe.push(wargs.subscribe);
        } else {
            subscribe = wargs.subscribe;
        }
    }
    
    var vmappings = {};
    var counter = 0;
    
    function genId(){
        return wargs.uuid + "_item_" + counter++;
    }

    /**
     *  Get an item.
     *
     * @param targetId - The id of the item to look up;
     */
    this.getItem = function(targetId) {
        if (!vmappings[targetId]) return null;
        else return vmappings[targetId];
    }

    /**
     *  Remove an item from the completion fields.
     *
     * @param o - The targetId of the item to remove or an object containing a
                  message.targetId property like:
                  { messsage : {targetId : 'foo'}}
     *
     */
    this.removeItem = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId)targetId = o.targetId;
        else targetId = o;
        
        if (targetId) {
            var _index = vmappings[targetId].index;
            if (_index >0 && _index < _widget.model.length) {
                _widget.model.splice(_index, 1);
            }
            delete vmappings[targetId];           
        } 
    };
    
    /**
     *  Clears all the entries from the spinner and sets the value to blank.
     *
     */    
    this.clear = function(){         
        _widget.model = [];
        _widget.wrapper.setValue("");
        vmappings = {};
    };
    
    /*
     * This private function is fired when a change event fires from the spinner.
     *
     */
    function adjust(value, delta) {
        if (delta < 0) {
            if (_widget.index + delta >= 1) _widget.index += delta;
            else _widget.index = 0;
        } else {
            if (_widget.index + delta < _widget.model.length) _widget.index += delta;
            else _widget.index = _widget.model.length -1;
        }
        if (_widget.model[_widget.index]) {
            var label = _widget.model[_widget.index].label;
            _widget.setValue(label);
            processActions(publish,
                           _widget.model[_widget.index],
                           _widget.model[_widget.index].id, 'onChange',
                           _widget.model[_widget.index].value); 
        } 
    }
    
    /**
     *  Initialize after the widget has loaded.
     *
     */    
    this.init = function() {
        // make sure everything has an id

        for (var i=0; i < _widget.model.length; i++) {
          _widget.model[i].index = i;
          if (!_widget.model[i].id) _widget.model[i].id = genId();
          // set a mapping so we can look it up later
          vmappings[_widget.model[i].id] = _widget.model[i];
          if (typeof _widget.model[i].selected == "boolean" &&
              _widget.model[i].selected == true ) {
                  _widget.index = i;
                  _widget.selected = _widget.model[i].label;
              }
        }
        // if no value was select the first value
        if (!_widget.selected && _widget.model.length > 0) {
            _widget.selected = _widget.model[0].label;
        }
        _widget.wrapper = new dijit.form._Spinner({
                                            value: _widget.selected}, container);
        // map to out local handler.
        _widget.wrapper.adjust = adjust;    
    };
    
    
    /**
     *  Set the value of the text field regardless of whether the value is 
     *  in the list or not. Generally using select is a better solution.
     *
     * @param o - The value to add or an object containing a
                  message.value property like:
                  { messsage : {value : 'some text'}}
     *
     */
    this.setValue = function(o) {
        var _value;
        if (o.message) o = o.message;
        else _value = o;
        if (_value.value) value = _value.value;
        _widget.wrapper.setValue(_value);
    };

    /**
     * Returns the currently selected value
     */
    this.getValue = function() {
        return _widget.wrapper.getValue();
    }; 
    
    /**
     *  Select an item from the list. The Label of the item will be
     *  set as the value of the text field.
     *
     * @param o - The targetId to select or an object containing a
                  message.targetId property like:
                  { messsage : {targetId : 'foo'}}
     *
     */
    this.select = function(e){
        var targetId;
        var _target;
        if (e.message)e = e.message;
        if (e.value)e = e.value;

        if (e.action && e.action.targetId) {
           targetId = e.action.targetId;
        } else {
           targetId = e.targetId;
        }
        var _val = _widget.getItem(targetId);  
        if (_val) {
            processActions(publish, _val, _val.id, 'onSelect', _val);     
            _widget.wrapper.setValue(_val.label);
            _widget.index = _val.index;
        }
    };
    
    /**
     *  Add an item from the list.
     *
     * @param o - An item like:
                  { id : 'foo', label : 'My label', value : 'v1'}
                  or an object containg a message.value property
                  which is used as the value like:
                  { messsage : {value :  { id : 'foo', label : 'My label', value : 'v1'}}}
       @param selectOnEmpty - Whether to automatically select the item is the 
                              list is empty.
     *
     */
    this.addItem = function(e, select) {
        var _item;
        if (e.message && e.message.value) _item = e.message.value;
        else _item = e;
        var nid;
        if (typeof _item.id != 'undefined') nid= _item.id;
        else nid = genId();
        _item.nid = nid;
        // give current length because we are going to add it
        _item.index = _widget.model.length;
        _widget.model.push(_item);
        vmappings[nid] = _item;
        // if a blank list selected the value
        if ((_widget.model.length ==1 &&
             typeof select == 'undefined') ||
            (typeof select == 'boolean' && 
             select == true)
        ) {
            _widget.setValue(_item.label);
            index=1;
            processActions(publish, _item, _val.id, 'onSelect', _item); 
        }
        return _item;
    };

    /**
     * Clears the list and set the values to the list provided.
     *
     * @param o - An array of items like:
                  [
                  { id : 'foo', label : 'My label', value : 'v1'},
                  { id : 'bar', label : 'My label 2', value : 'v2'}
                  ]
                  or an object containg a message.value property
                  which is used as the value like:
                  { messsage : {value : [ values ]}}
     *
     */
    this.setValues = function(e){
        _widget.clear();
        var _v;
        if (e.message && e.message.value) _v = e.message.value;
        else _v = e;
        var _selected;

        
        if (_v) {
           for (var i=0;_v && i < _v.length; i++){
               if (!_v[i].id) _v[i].id = genId();
               if (_v[i].selected) _selected = _widget[i];
               // add item without selecting
               _widget.addItem(_v[i], _v[i].selected);
           }
        }
    }; 
    
    function clone(t) {
       var obj = {};
       for (var i in t) {
            obj[i] = t[i];
       }
       return obj;
    }    
    
    function processActions(_publish, _t, _pid, _type, _value) {
        if (_t) {
            var _topic = _publish;
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
    };

    this.postLoad = function() {
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i]  + "/select", _widget.select);
            doSubscribe(subscribe[_i]  + "/clear", _widget.clear);
            doSubscribe(subscribe[_i]  + "/remove", _widget.removeItem);
            doSubscribe(subscribe[_i]  + "/addItem", _widget.addItem);
            doSubscribe(subscribe[_i]  + "/setValues", _widget.setValues);
        }
        if (wargs.value){ 
            _widget.model = wargs.value;
            _widget.init();

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
                        _widget.model = _in;
                        _widget.init();
                    },
                    onerror : function (message) {
                        container.innerHTML = "Failed to load data: " + message;
                    }
                }
            );
        }        
    };
}