using { sap.ui.notification as db } from '../db/schema';

@path: 'service/notification'
service Notification @(requires : 'authenticated-user'){
  @odata.draft.enabled
  entity Translations as projection on db.Translations actions{
    @cds.odata.bindingparameter.name : '_it'
    action translator(
                      @(UI.ParameterDefaultValue: _it.ID )
                      ID: String,
                      @(UI.ParameterDefaultValue: _it.translang) 
                      translang : String,
                      @(UI.ParameterDefaultValue: _it.template_ID) 
                      template_ID : String,
                    );
  };
  entity Templates as projection on db.Templates;
  entity LanguageTypes as projection on db.LanguageTypes;
}
