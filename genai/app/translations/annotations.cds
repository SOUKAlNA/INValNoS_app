using Notification as service from '../../srv/notif-service';

annotate service.Translations with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Translation',
			TypeNamePlural: 'Translations',
			Title          : {
                $Type : 'UI.DataField',
                Value : ID
            },
		},
		SelectionFields: [type_code, translang_code],
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
		FieldGroup #TemplateInformation: {
			$Type: 'UI.FieldGroupType',
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
					Value: translang_code,
				},
			]
		},
		FieldGroup #TranslateInformation : {
			$Type : 'UI.FieldGroupType',
			Data : [
				{
					$Type: 'UI.DataField',
					Value: subject,
				},
				{
					$Type: 'UI.DataField',
					Value: template,
				},
				{
					$Type: 'UI.DataField',
					Value: content,
				}
			]
		},
		Facets  : [
			{
            $Type : 'UI.ReferenceFacet',
			ID : 'TemplateInformation',
            Label : 'General Information',
            Target : '@UI.FieldGroup#TemplateInformation',
			},
			{
            $Type : 'UI.ReferenceFacet',
			ID : 'TranslateInformation',
            Label : 'Translate Email',
            Target : '@UI.FieldGroup#TranslateInformation',
			}
		],
	},
);


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
