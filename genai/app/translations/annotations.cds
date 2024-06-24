using Notification as service from '../../srv/notif-service';

annotate Notification.Translations with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Translation',
			TypeNamePlural: 'Translations',
			Title          : {
                $Type : 'UI.DataField',
                Value : ID
            },
			Description : {/**subtitle */
				$Type: 'UI.DataField',
				Value: name
			}
		},
		SelectionFields: [name],
		LineItem: [//items shown in the list
			{
				$Type : 'UI.DataField',
				Value : ID
			},
			{
				$Type : 'UI.DataField',
				Value: name
			},
			{
				$Type : 'UI.DataField',
				Value: lang_code
			}
		],
		Facets  : [
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
		DeleteHidden : true,
		FieldGroup #Main: {
			Data: [
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
				}
			]
		},
		FieldGroup #Translate : {
			Data: [
			    {
			        $Type : 'UI.DataField',
			        Value : content,
			    },
			    {
			        $Type : 'UI.DataField',
			        Value : translang_code,
			    },
				]
		},
	},
) {

};

annotate service.Translations with {
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
                        ValueListProperty : 'code'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'name'
                    }
                ]
            }
        }
    );
};

annotate service.Translations with {
    translang @(
		Common : {
			Text: translang.name,
			TextArrangement : #TextOnly,
			ValueListWithFixedValues : true,
			ValueList : {
				$Type : 'Common.ValueListType',
				CollectionPath : 'LanguageTypes',
				Parameters : [
					{
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : translang_code,
                        ValueListProperty : 'name'
                    }
				]
			}
        }
	);
};
