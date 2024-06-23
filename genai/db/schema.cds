namespace sap.ui.notification;
using { managed } from '@sap/cds/common';

  entity Translations : managed {
    key ID      : String;
    type        : String(100);
    lang        : String(10);
  }

  entity Templates : managed {
    key ID       : String;
    name         : String(10);
    description  : String;
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
