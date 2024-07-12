namespace sap.ui.notification;
using { managed, sap.common.CodeList } from '@sap/cds/common';

/**@fiori.draft.enabled**/
  entity LanguageTypes : CodeList {
    key code    : String;
  }

  entity Translations : managed {
    key ID      : String @title : 'Email ID';
    template    : Association to Templates @Core.Immutable @title : 'Template Information'; /**Core.Immutable - not editable in EditMode */
    translang   : String @Core.Immutable @title : 'Translation Language';
    //translang   : Association to LanguageTypes @Core.Immutable @title : 'Translation Langugae';
    content     : String @title : 'Translation Content' @UI.MultiLineText;
  }

  entity Templates : managed {
    key ID        : String @title : 'Template ID';
    name          : String @title : 'Email Type';
    lang          : Association to LanguageTypes @title : 'Template Language';
    subject       : String @title : 'Template Subject' @UI.MultiLineText;
    content       : String @title : 'Template Content' @UI.MultiLineText;
    translations  : Association to many Translations on translations.template = $self;
  }

// For Insurance Contracts App*
  entity Contracts : managed {
    key contractID : String @title : 'Insurance Contract / Policy'; /**Insurance Contract ID*/
    insurerID      : String @title : 'ID Insurer';
    insurer        : String @title : 'Name Insurer';
    clientID       : String @title : 'ID Client';
    client         : String @title : 'Name Client';
    clientEmail    : String @title : 'E-mail Client' @Communication.IsEmailAddress;
    status         : String @title : 'Status insurance contract';
    components     : Composition of many Components on components.contract = $self @title : 'Contract Components';
  }

  entity Components : managed {
    key component  : String @title : 'Contract Component';
    contract       : Association to Contracts @title : 'Insurance Contract / Policy';
    descr          : String @title : 'Description';
    valueType      : String @title : 'Reporting Value Type';
    provisional    : Integer @title : 'Reported Value Amount (provisional)';
    final          : Integer @title : 'Reported Value Amount (final)';
    reportStart    : Timestamp @title : 'Reporting Period - Start';
    reportEnd      : Timestamp @title : 'Reporting Period - End';
    finalReport    : Timestamp @title : 'Final Reporting Date';
  }
