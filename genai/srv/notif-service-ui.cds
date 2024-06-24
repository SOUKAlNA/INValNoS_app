using Notification from './notif-service';

// For Insurance Contracts App*
annotate Notification.Contracts with {
	contractID	@title : 'Insurance Contract / Policy';
	insurerID   @title : 'ID Insurer';
	insurer     @title : 'Name Insurer';
	clientID    @title : 'ID Client';
	client      @title : 'Name Client';
	clientEmail @title : 'E-mail Client' @Communication.IsEmailAddress;
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