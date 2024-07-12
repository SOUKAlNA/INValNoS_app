sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/translations/test/integration/FirstJourney',
		'ns/translations/test/integration/pages/TranslationsList',
		'ns/translations/test/integration/pages/TranslationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, TranslationsList, TranslationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/translations') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTranslationsList: TranslationsList,
					onTheTranslationsObjectPage: TranslationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);