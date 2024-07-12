sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'con/contracts/test/integration/FirstJourney',
		'con/contracts/test/integration/pages/ContractsList',
		'con/contracts/test/integration/pages/ContractsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ContractsList, ContractsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('con/contracts') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheContractsList: ContractsList,
					onTheContractsObjectPage: ContractsObjectPage
                }
            },
            opaJourney.run
        );
    }
);