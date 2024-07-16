namespace sap.ui.notification;
using { managed, sap.common.CodeList } from '@sap/cds/common';

/**@fiori.draft.enabled**/
  entity LanguageTypes : CodeList {
    key code    : String;
    name        : localized String;
  }

  entity Translations : managed {
    key ID      : String @title : 'Email ID';
    template    : Association to Templates @Core.Immutable @title : 'Template Information'; /**Core.Immutable - not editable in EditMode */
    //translang   : String @Core.Immutable @title : 'Translation Language';
    translang   : Association to LanguageTypes @Core.Immutable @title : 'Translation Langugae';
    content     : String @title : 'Translation Content' @UI.MultiLineText;
    modifiedAt  : Timestamp @title : 'Update Date' @cds.on.update : $now;
  }

  entity Templates : managed {
    key ID        : String @title : 'Template ID';
    name          : String @title : 'Email Type';
    lang          : Association to LanguageTypes @title : 'Template Language';
    subject       : String @title : 'Template Subject' @UI.MultiLineText;
    content       : String @title : 'Template Content' @UI.MultiLineText;
    modifiedAt    : Timestamp @title : 'Update Date' @cds.on.update : $now;
    translations  : Association to many Translations on translations.template = $self;
  }
