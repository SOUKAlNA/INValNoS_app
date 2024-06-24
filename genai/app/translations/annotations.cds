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
				Value: type_code
			}
		},
		SelectionFields: [type_code],
		LineItem: [//items shown in the list
			{
				$Type : 'UI.DataField',
				Value : ID
			},
			{
				$Type : 'UI.DataField',
				Value : type_code
			},
			{
				$Type : 'UI.DataField',
				Value : lang_code
			},
		    {
		        $Type : 'UI.DataField',
		        Value : translang_code
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
		FieldGroup #Main: {
			Data: [
				{
					$Type: 'UI.DataField',
					Value: type_code,
				},
				{
					$Type: 'UI.DataField',
					Value: lang_code,
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
			    {
			        $Type : 'UI.DataField',
			        Value : translation,
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
                        ValueListProperty : 'name'
                    },
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
                    },
				]
			}
        }
	);
};

annotate service.Translations with {
    type @(
		Common : {
			Text: type.name,
			TextArrangement : #TextOnly,
			ValueListWithFixedValues : true,
			ValueList : {
				$Type : 'Common.ValueListType',
				CollectionPath : 'EmailTypes',
				Parameters : [
					{
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : type_code,
						ValueListProperty : 'name'
                    },
				]
			}
        }
	);
};
