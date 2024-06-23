using Notification as service from '../../srv/notif-service';
using from '../../srv/notif-service-ui';



annotate service.Translations with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Detail',
            Target : '@UI.FieldGroup#Main',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Translate',
            ID : 'Translate',
            Target : '@UI.FieldGroup#Translate',
        },
    ],
);
/**
annotate service.Translations with {
    lang @Common.FieldControl : #ReadOnly
};
annotate service.Translations with {
    type @Common.FieldControl : #ReadOnly
};
*/
