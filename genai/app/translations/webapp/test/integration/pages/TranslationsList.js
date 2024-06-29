"use strict";

sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    const TranslationsList = new ListReport(
        {
            appId: 'ns.translations',
            componentId: 'TranslationsList',
            entitySet: "Translations",
            contextPath: ""
        },
    );
    var __exports = {
        __esModule: true
    };
    __exports.TranslationsList = TranslationsList;
    return __exports;
});