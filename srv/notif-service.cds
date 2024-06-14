using { sap.ui.notification as my } from '../db/schema';

@path: 'service/notification'
service Notification {
  entity Templates as projection on my.Templates;
    annotate Templates with @odata.draft.enabled;
  entity Translations as projection on my.Translations;
    annotate Translations with @odata.draft.enabled;
}