namespace INValNoS_app;
using { cuid, managed } from '@sap/cds/common';

//TODO:
//refine association emailtemplates <-> placeholders
//add annotations

entity EmailTemplates : cuid, managed {
    key ID : UUID;
    key Language: UUID;
    name  : Association to EmailType;
    subject : String(255);
    content  : String(2048);
    placeholders : Composition of many Placeholders;
}

entity EmailType : cuid {
    key code : Types;
    name   : String(255);
    descr  : String(255);
}

type Types : String enum {
    NOTIFICATION;
    REMINDER;
    UPDATE_CHANGE;
    UPDATE_CHANGE_INSURANCE_CONTRACT;
    REVERSED_INSURANCE_CONTRACT;
    REVERSE_CONTRACT_DETAIL;
    REVERSE_ALL_CONTRACT_DETAILS;
    REINSTATE_INSURANCE_CONTRACT;
    REINSTATE_CONTRACT_DETAIL;
    SUMMARY;
}

entity Placeholders : cuid{
    //key ID : UUID;
    name   : String(255);
    value : String(255);
}
