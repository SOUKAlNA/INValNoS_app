/**sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        Translate: function() {
            MessageToast.show("Custom...")
        }
    };
});
*/

sap.ui.require([
    "./Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("ns.translations.Component", {
        Translate: function () {
            this.Controller.getComponentById("Translate");
        }
    });
});