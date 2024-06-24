sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        translate_func: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
