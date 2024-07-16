using { sap.ui.notification as db } from '../db/schema';

@path: 'service/notification'
service Notification @(requires : 'authenticated-user'){
  @odata.draft.enabled
  
  entity Translations as projection on db.Translations actions {
      action translator() returns String;
};
  entity Templates as projection on db.Templates;

  entity LanguageTypes as projection on db.LanguageTypes;
}
