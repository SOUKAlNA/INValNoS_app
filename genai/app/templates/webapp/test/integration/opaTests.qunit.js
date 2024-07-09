sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'tp/templates/test/integration/FirstJourney',
		'tp/templates/test/integration/pages/TemplatesList',
		'tp/templates/test/integration/pages/TemplatesObjectPage'
    ],
    function(JourneyRunner, opaJourney, TemplatesList, TemplatesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('tp/templates') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTemplatesList: TemplatesList,
					onTheTemplatesObjectPage: TemplatesObjectPage
                }
            },
            opaJourney.run
        );
    }
);