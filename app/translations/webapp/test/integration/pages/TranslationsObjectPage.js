"use strict";

sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    const TranslationsObjectPage = new ObjectPage(
        {
            appId: 'ns.translations',
            componentId: 'TranslationsObjectPage',
            entitySet: "Translations",
            contextPath: ""
        },
    );
    var __exports = {
        __esModule: true
    };
    __exports.TranslationsObjectPage = TranslationsObjectPage;
    return __exports;
});