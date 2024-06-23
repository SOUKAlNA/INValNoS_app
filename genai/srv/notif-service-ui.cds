using Notification from './notif-service';

annotate Notification.Translations with {
	ID          @title: 'Translation ID';
	lang        @title: 'Language';
	type        @title: 'Email Type';
}

annotate Notification.Templates with {
	ID          @title: 'Template ID';
	name        @title: 'Email Name';
	description @title: 'Description';
}

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
				Value: type
			}
		},
		SelectionFields: [type, lang],
		LineItem: [//items shown in the list
			{
				$Type : 'UI.DataField',
				Value : ID
			},
			{
				$Type : 'UI.DataField',
				Value: type
			},
			{
				$Type : 'UI.DataField',
				Value: lang
			}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
				{Value: type},
				{Value: lang}
			]
		}
	},
) {

};


// For Insurance Contracts App*
annotate Notification.Contracts with {
	contractID	@title : 'Insurance Contract / Policy';
	insurerID   @title : 'ID Insurer';
	insurer     @title : 'Name Insurer';
	clientID    @title : 'ID Client';
	client      @title : 'Name Client';
	clientEmail @title : 'E-mail Client';
	status      @title : 'Status insurance contract';
	components  @title : 'Contract Component';
}

annotate Notification.Components with {
	component   @title : 'Contract Component';
	contract    @title : 'Insurance Contract / Policy';
	descr		@title : 'Description';
	valueType	@title : 'Reporting Value Type';
	provisional @title : 'Reported Value Amount (provisional)';
	final		@title : 'Reported Value Amount (final)';
	reportStart @title : 'Reporting Period - Start';
	reportEnd   @title : 'Reporting Period - End';
	finalReport @title : 'Final Reporting Date';
} ;


annotate Notification.Contracts with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Insurance Contract / Policy',
			TypeNamePlural: 'Insurance Contracts / Policies',
			Title          : {
                $Type : 'UI.DataField',
                Value : client
            },
			Description : {/**subtitle */
				$Type: 'UI.DataField',
				Value: insurer
			}
		},
		SelectionFields: [contractID, status],
		LineItem: [//items shown in the list
			{
				$Type : 'UI.DataField',
				Value : insurerID,
				![@HTML5.CssDefaults] : {width : '15rem'}
			},
			{
				$Type : 'UI.DataField',
				Value: insurer,
				![@HTML5.CssDefaults] : {width : '18rem'}
			},
			{
				$Type : 'UI.DataField',
				Value: clientID,
				![@HTML5.CssDefaults] : {width : '15rem'}
			},
			{
				$Type : 'UI.DataField',
				Value: client
			},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'General', Target: '@UI.FieldGroup#General'},
			{
            $Type : 'UI.ReferenceFacet',
            Label : 'Detail',
            ID : 'Detail',
            Target : 'components/@UI.LineItem#Detail',
        },
		],
		FieldGroup#General: {
			Data: [
				{Value: insurerID},
				{Value: clientID},
				{Value: clientEmail},
				{Value: insurer},
				{Value: client},
				{Value: status},
				{Value: contractID}
			]
		}
	},
) {

};

annotate Notification.Components with @(
    UI.LineItem #Detail : [
        {
            $Type : 'UI.DataField',
            Value : component
        },
        {
            $Type : 'UI.DataField',
            Value : descr
        },
        {
            $Type : 'UI.DataField',
            Value : reportStart
        },
        {
            $Type : 'UI.DataField',
            Value : reportEnd
        },]
);