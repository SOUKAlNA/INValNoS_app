using Notification from './notif-service';

annotate Notification.Templates with {
	ID          @title: 'Template ID';
	name        @title: 'Email Name';
	description @title: 'Description';
}

annotate Notification.Translations with {
	ID          @title: 'Translation ID';
	type        @title: 'Email Type';
	lang        @title: 'Language';
	content     @title: 'Content';
}

annotate Notification.Translations with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Translation',
			TypeNamePlural: 'Translations',
			Title          : {
                $Type : 'UI.DataField',
                Value : type
            },
			Description : {
				$Type: 'UI.DataField',
				Value: lang
			}
		},
		SelectionFields: [lang],
		LineItem: [
			{Value: type},
			{Value: temp_ID},
			{Value: lang}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
				{Value: temp_ID},
				{Value: lang}
			]
		}
	},
) {

};

annotate Notification.Translations with {
	temp @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: temp.name  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Templates',
				CollectionPath: 'Templates',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: temp_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'name'
					}
				]
			}
		}
	);
}
