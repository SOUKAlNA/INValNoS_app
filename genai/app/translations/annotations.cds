using Notification as service from '../../srv/notif-service';

annotate service.Translations with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Translation',
			TypeNamePlural: 'Translations',
			Title         : {Value : template.name},
			Description   : {Value : ID}
		},
		SelectionFields: [template.name, translang],
		LineItem: [//items shown in the list
			{
				$Type : 'UI.DataField',
				Value : ID
			},
			{
				$Type : 'UI.DataField',
				Label : 'Email Type',
				Value : template_ID,
			},
			{
				$Type : 'UI.DataField',
				Value : template.lang_code
			},
		    {
		        $Type : 'UI.DataField',
		        Value : translang,
				![@UI.Importance]: #High
		    }
		],
		FieldGroup #TemplateInformation : {
			$Type : 'UI.FieldGroupType',
			Data : [
				{
					$Type: 'UI.DataField',
					Value: template.lang_code,
					![@Common.FieldControl] : #ReadOnly /**all templates are in English */
				},
				{
					$Type: 'UI.DataField',
					Value: template.subject,
				},
				{
					$Type: 'UI.DataField',
					Value: template.content,
				},
				{
			        $Type : 'UI.DataFieldForAction',
			        Label : 'Translator',
					Action : 'Notification.translator',
			    },
			]
		},
		Facets  : [
			{
				$Type : 'UI.ReferenceFacet',
				Label : 'Template Information',
				ID : 'TemplateInformation',
				Target : '@UI.FieldGroup#TemplateInformation',
			},
			{
            	$Type : 'UI.ReferenceFacet',
				Label : 'Translate Email',
				ID : 'TranslateInformation',
            	Target : '@UI.FieldGroup#TranslateInformation',
			}
		],
	}
);

annotate service.Translations with @(
	odata.draft.enabled : true,
	UI: {
		FieldGroup #TranslateInformation : {
			$Type : 'UI.FieldGroupType',
			Data : [
				{
					$Type: 'UI.DataField',
					Value: translang,
				},
				{
					$Type: 'UI.DataField',
					Value: content,
				}
			]
		},
	},
);

annotate service.Translations with {
    /**
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
						ValueListProperty : 'code'
                    },
					{
						$Type : 'Common.ValueListParameterDisplayOnly',
						ValueListProperty : 'name'
					},
				]
			}
        }
	);*/

	template @(
		Common : {
			Text: template.name,
			TextArrangement : #TextOnly,
			ValueList : {
				$Type : 'Common.ValueListType',
				CollectionPath : 'Templates',
				SearchSupported : true,
				Parameters : [
					{
						$Type : 'Common.ValueListParameterInOut',
						LocalDataProperty : template_ID,
						ValueListProperty : 'ID'
					},
					{
						$Type : 'Common.ValueListParameterDisplayOnly',
						ValueListProperty : 'name'
					},
				]
			},
		}
	)
};
