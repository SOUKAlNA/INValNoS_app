using {sap.ui.notification as db} from '../db/schema';

@path : 'service/notification'
service Notification @(requires : 'authenticated-user') {
  @odata.draft.enabled
  entity Contracts     as projection on db.Contracts;

  entity Components    as projection on db.Components;

  entity Translations  as projection on db.Translations actions {
                      @cds.odata.bindingparameter.name : '_it'
    action translator(
                      @(UI.ParameterDefaultValue : _it.ID)
           ID : String,
        @(UI.ParameterDefaultValue : _it.translang)
      translang : String,
        @(UI.ParameterDefaultValue : _it.template_ID)
        template_ID : String, );
      };

  entity Templates     as projection on db.Templates;
  entity LanguageTypes as projection on db.LanguageTypes;
}
