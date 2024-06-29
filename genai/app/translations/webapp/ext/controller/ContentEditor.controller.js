sap.ui.define(["sap/ui/core/Element", "sap/ui/core/mvc/ControllerExtension", "sap/ui/richtexteditor/RichTextEditor"], function (Element, ControllerExtension, RichTextEditor) {
	"use strict";
  
	const TEMPLATE_CONTENT_FIELD_ID = "ns.translations::TranslationsObjectPage--fe::FormContainer::TranslateInformation::FormElement::DataField::content::Field-edit";
	const TEMPLATE_FORM_FIELD_ID = "ns.translations::TranslationsObjectPage--fe::FormContainer::TranslateInformation::FormElement::DataField::content";
	
	let oRichTextEditor;
	let oContentFormElement;
	
	/**
	 * @namespace ns.translations.ext
	 * @controller
	 */
	const ContentEditor = ControllerExtension.extend("ns.translations.ext.ContentEditor", {
	  overrides: {
		onInit() {
		  oContentFormElement = Element.getElementById(TEMPLATE_FORM_FIELD_ID);
		  oRichTextEditor = new RichTextEditor("myRTE", {
			editorType: "TinyMCE",
			value: " ",
			editable: false,
			required: true,
			customToolbar: true,
			buttonGroups: [{
			  name: "font",
			  visible: true,
			  priority: 10,
			  customToolbarPriority: 10,
			  buttons: ["fontselect", "fontsizeselect", "forecolor"]
			}, {
			  name: "font-style",
			  visible: true,
			  priority: 20,
			  customToolbarPriority: 20,
			  buttons: ["italic", "bold", "underline"]
			}],
			width: "100%",
			height: "500px",
			change: oEvent => {
			  if (!(oEvent.getSource().getBindingContext()?.getObject()).IsActiveEntity) {
				const content = oEvent.getSource().getValue();
				Element.getElementById(TEMPLATE_CONTENT_FIELD_ID).setValue(content);
			  }
			}
		  });
		},
		onPageReady() {
		  const oExtentionAPI = this.base.getExtensionAPI();
		  const oRTE = oExtentionAPI.byId("fe::CustomSubSection::ContentEditor--idVerticalLayout");
		  oContentFormElement.setVisible(true);
		  const value = Element.getElementById(TEMPLATE_CONTENT_FIELD_ID)?.getValue();
		  oContentFormElement.setVisible(false);
		  oRichTextEditor.setValue(value);
		  oRTE.addContent(oRichTextEditor);
		  if (!(oExtentionAPI.getBindingContext()?.getObject()).IsActiveEntity) {
			oRichTextEditor.setEditable(true);
		  }
		},
		editFlow: {
		  onBeforeEdit() {
			oContentFormElement.setVisible(true);
			const value = Element.getElementById(TEMPLATE_CONTENT_FIELD_ID).getValue();
			oContentFormElement.setVisible(false);
			oRichTextEditor.setValue(value);
			oRichTextEditor.setEditable(true);
		  },
		  onAfterDiscard() {
			oContentFormElement.setVisible(true);
			const value = Element.getElementById(TEMPLATE_CONTENT_FIELD_ID).getValue();
			oContentFormElement.setVisible(false);
			oRichTextEditor.setValue(value);
			oRichTextEditor.setEditable(false);
		  },
		  onBeforeSave() {
			oContentFormElement.setVisible(true);
			Element.getElementById(TEMPLATE_CONTENT_FIELD_ID).setValue(oRichTextEditor.getValue());
			oContentFormElement.setVisible(false);
			oRichTextEditor.setEditable(false);
		  }
		}
	  }
	});

	return ContentEditor;
  });