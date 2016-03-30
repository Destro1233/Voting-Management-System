/* Copyright 2008 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2008/04/15 19:39:59 gmurray71 Exp $
*/

dojo.require("dijit.Dialog");

jmaki.namespace("jmaki.widgets.dojo.dijit.dialog");

/**
 * @constructor
*/
jmaki.widgets.dojo.dijit.dialog.Widget = function(wargs) {
    
    var _widget = this;
    _widget.index = 0;
    _widget.container = document.getElementById(wargs.uuid);

    var publish = "/dojo/dijit/dialog";
    var subscribe = ["/dojo/dijit/dialog", "/dialog"];
    
    var startHeight;
    var startWidth;
    var overflow = "hidden";
    var useIframe = false;
    var autosize = false;
    var overflowY = "hidden";
    var overflowX = "hidden"
    var show = false;

    /**
     *  Set the content of the dialog.
     *
     *
     * @param o - The targetId of the item to remove or an object containing a
                  message.targetId property like:
                  { messsage : {value : 'Some new content'}}
     *
     */
    this.setContent = function(o) {
        var content;
        if (o.message) o = o.message;
        if (o.value)content = o.value;
        else content = o;        
        if (content) {
            _widget.dcontainer.setContent(content);
        }
    };

    /**
     * Set the included page of the dialog
     *
     * @param o - The value (url) to include
                  message.targetId property like:
                  { messsage : {value : 'foo.jsp'}}
     *
     */
    this.setInclude = function(o) {
        var include;
        if (o.message) o = o.message;
        if (o.value)include = o.value;
        else include = o;
        
        if (include) {
            -widget.dcontainer.loadURL(include);
        } 
    };
    
    /**
     *  Show the dialog.
     *
     */
    this.show = function(){
        _widget.wrapper.show();
    };
    
    /**
     *  Show the dialog.
     *
     */
    this.hide = function(){
        _widget.wrapper.hide();        
    };
    
    /**
     *  Initialize after the widget has loaded.
     *
     */    
    this.init = function() {
        var _m = _widget.model;      
        var _title = _m.label;
        var _content = _m.content;
        var _include = _m.include;

        // take the model or default to args properties
        var _overflow = (_m.overflow) ? _m.overflow : overflow;
        var _overflowY = (_m.overflowY) ? _m.overflowY : overflowY;
        var _overflowX = (_m.overflowX) ? _m.overflowX : overflowX;
        var _startHeight = (_m.startHeight) ?  _m.startHeight : startHeight;
        var _startWidth =(_m.startWidth) ? _m.startWidth : startWidth;
        var _autosize = (_m.autosize) ? _m.autosize : autosize;   

        var _pane = document.getElementById( wargs.uuid + "_content");
        _widget.dcontainer = new jmaki.DContainer(
            {target:  wargs.uuid + "_content",
             useIframe : _widget.model.iframe,
             overflow : _overflow,
             overflowY : _overflowY,
             overflowX : _overflowX,
             content : _content,
             startHeight : _startHeight,
             startWidth : _startWidth,
             autosize : _autosize}); 
         var _contentPane = document.getElementById(wargs.uuid + "_wrapper");
        if (_include)_widget.dcontainer.loadURL(_include);
        
        _widget.wrapper = new dijit.Dialog({
                                           title : _title}, _contentPane);
                             
        // reparent the domNode 
        // this allows us to not have to set style on the body.
        _widget.container.appendChild(_widget.wrapper.domNode);

        if (show)_widget.wrapper.show();

    };
    
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
        if (wargs.publish ) {
                publish = wargs.publish;
        }
        
        if (wargs.args){
            if (wargs.args.height){
                startHeight = wargs.args.height;
            }
            if (typeof wargs.args.width != 'undefined'){
                startWidth = wargs.args.width;
            }   
            if (wargs.args.overflow){
                overflow = wargs.args.overflow;
            }   
            if (wargs.args.iframe){
                useIframe = (wargs.args.iframe == true);
            }

            if (wargs.args.autosize) {
                autosize = wargs.args.autosize;
            }

            if (wargs.args.overflowX) {
                overflowX = wargs.args.overflowX;
                if (!overflow) overflow = 'auto';
            }
            if (wargs.args.overflowY) {
                overflowY = wargs.args.overflowY;
                if (!overflow) overflow = 'auto';
            }
            if (wargs.args.show) {
                show = wargs.args.show;
            }         
        }

        if (wargs.subscribe){
            if (typeof wargs.subscribe == "string") {
                subscribe = [];
                subscribe.push(wargs.subscribe);
            } else {
                subscribe = wargs.subscribe;
            }
        }        
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i]  + "/setContent", _widget.setContent);
            doSubscribe(subscribe[_i]  + "/setInclude", _widget.setInclude);
            doSubscribe(subscribe[_i]  + "/show", _widget.show);
            doSubscribe(subscribe[_i]  + "/hide", _widget.hide);            
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