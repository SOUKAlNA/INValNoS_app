namespace sap.ui.notification;
using { managed, sap.common.CodeList } from '@sap/cds/common';

  entity LanguageTypes : CodeList {
    key code    : String;
  }

  entity Translations : managed {
    key ID      : String @title : 'Email ID';
    name        : String @title : 'Email Type';
    lang        : Association to LanguageTypes @title : 'Email Template Language';
    subject     : String @title : 'Email Template Subject' @UI.MultiLineText;
    content     : String @title : 'Email Template Content' @UI.MultiLineText;
    translang   : Association to LanguageTypes @title : 'Translation Language';
    translation : String @title : 'Translation Email' @UI.MultiLineText;
  }

  entity Templates : managed {
    key ID       : String @title : 'Template ID';
    name         : String @title : 'Email Name';
    description  : String @title : 'Description';
  }

  entity Contracts : managed {
    key contractID : String; /**Insurance Contract ID*/
    insurerID      : String;
    insurer        : String;
    clientID       : String;
    client         : String;
    clientEmail    : String;
    status         : String;
    components     : Composition of many Components on components.contract = $self;
  }

  entity Components : managed {
    key component  : String;
    contract       : Association to Contracts;
    descr          : String;
    valueType      : String;
    provisional    : Integer;
    final          : Integer;
    reportStart    : Timestamp;
    reportEnd      : Timestamp;
    finalReport    : Timestamp;
  }
