dojo.require("dijit._Calendar");

jmaki.namespace("jmaki.widgets.dojo.dijit.calendar");

jmaki.widgets.dojo.dijit.calendar.Widget = function(wargs) {

    var _widget = this;
    _widget.container = document.getElementById(wargs.uuid);
    
    _widget.wrapper = new dijit._Calendar({}, _widget.container);
  
    var publish = "/dojo/dijit/calendar";	

    if (wargs.value) {
        var date = new Date(wargs.value);
	    _widget.wrapper._setValueAttr(date);
    }
    
    if ( wargs.publish) {
        publish = wargs.publish;
    }
     
    this.setValue = function(_date) {
        if (typeof _date == 'string') _date = new Date(_date);
        _widget.wrapper._setValueAttr(_date);
    } 
     
    this.getValue = function() {
        var _date = _widget.wrapper.value;
        var _dString =  + (_date.getMonth() + 1) + "/" + _date.getDate() + "/" + _date.getFullYear();
        return  _dString;
    }

   this.datepickerEvent = function(date) {
        jmaki.publish(publish, {id: wargs.uuid, wargs: wargs, value: _widget.getValue()});
    }

    dojo.connect(_widget.wrapper, "onValueSelected", _widget, "datepickerEvent" );    

};
