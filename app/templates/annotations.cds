using Notification as service from '../../srv/notif-service';

annotate service.Templates with @(
    odata.draft.enabled : true,
    UI: {
        HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Template',
            TypeNamePlural : 'Templates',
            Title : {
                $Type :'UI.DataField',
                Value : name
                },
            Description : {
                $Type : 'UI.DataField',
                Value : ID
            }
        },
        SelectionFields : [
            name
        ],
        LineItem : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                ![@UI.Importance]: #High
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                ![@UI.Importance]: #High
            },
            {
                $Type : 'UI.DataField',
                Value : lang_code,
                ![@UI.Importance]: #High
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
                ![@UI.Importance]: #High
            }
        ],
        FieldGroup #General : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
					$Type: 'UI.DataField',
					Value: name,
                    ![@Common.FieldControl] : #ReadOnly
				},
				{
					$Type: 'UI.DataField',
					Value: lang_code,
                    ![@Common.FieldControl] : #ReadOnly
				},
                {
                    $Type: 'UI.DataField',
					Value: subject,
				},
				{
					$Type: 'UI.DataField',
					Value: content,
				}
            ]
        },
        Facets : [
            {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            ID : 'General',
            Target : '@UI.FieldGroup#General',
            }
        ],
    }
);

annotate service.Templates with {
    lang @(
		Common : {
			Text: lang.name,
			TextArrangement : #TextOnly,
			ValueListWithFixedValues : true,
			ValueList : {
				$Type : 'Common.ValueListType',
				CollectionPath : 'LanguageTypes',
				Parameters : [
					{
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : lang_code,
						ValueListProperty : 'name'
                    },
				]
			}
        }
	)
};
