sap.ui.define([
  "sap/ui/richtexteditor/RichTextEditor"
], function (RichTextEditor) {
  'use strict';

  return {
    translate: async function (oEvent) {


      const oEditFlow = this.editFlow
      const translatedTemplateContent = await oEditFlow.invokeAction("Notification.translator", {
        contexts: this.editFlow.getView().byId("ns.translations::TranslationsObjectPage--fe::CustomSubSection::ContentEditor--idVerticalLayout").getBindingContext(),
        skipParameterDialog: true
      });

      const oRichTextEditor = this.editFlow.getView().byId("ns.translations::TranslationsObjectPage--fe::CustomSubSection::ContentEditor--idVerticalLayout").getContent()[0]
      oRichTextEditor.setValue(translatedTemplateContent.getObject().value);
      const oRTE = this.editFlow.getView().byId("ns.translations::TranslationsObjectPage--fe::CustomSubSection::ContentEditor--idVerticalLayout")
      oRTE.addContent(oRichTextEditor);
    }
  };
});
