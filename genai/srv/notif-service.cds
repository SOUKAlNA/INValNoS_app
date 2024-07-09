using { sap.ui.notification as my } from '../db/schema';

@path: 'service/notification'
service Notification {
  entity Templates as projection on my.Templates;
    annotate Templates with @odata.draft.enabled;
  entity Translations as projection on my.Translations
    actions{
    @cds.odata.bindingparameter.name : '_it'
    @Common.SideEffects : {
        TargetProperties : ['_it/translation']
    }
    
    action translator(
                      @(UI.ParameterDefaultValue: _it.ID )
                      ID: String,
                      @(UI.ParameterDefaultValue: _it.translang_code) 
                      translang_code : String,
                      @(UI.ParameterDefaultValue: _it.subject )
                      subject: String,
                      @(UI.ParameterDefaultValue: _it.content) 
                      content : String
                    ) returns Translations: translation;
  
  }; 
    
    annotate Translations with @odata.draft.enabled;
  entity Contracts as projection on my.Contracts;
    annotate Contracts with @odata.draft.enabled;
  entity Components as projection on my.Components;
  entity LanguageTypes as projection on my.LanguageTypes;
  entity EmailTypes as projection on my.EmailTypes;
}
