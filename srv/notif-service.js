const cds = require('@sap/cds');
const axios = require('axios');
/**const log = cds.log('notif-service');**/

module.exports = cds.service.impl(function() {

        const { Translations, Templates } = this.entities

        this.on('editTemplate', async function onEditTemplate(req) {

            const { template: ID } = req.data
            
            await UPDATE(Templates).set({subject: req.string, content: req.string}).where({ID: ID})
        
        })

        this.on('updatePrompt', async function onUpdatePrompt(req) {

            const { translation: ID } = req.data
            
            await UPDATE(Translations).set({prompt: req.string}).where({ID: ID})
        
        })

        this.on('translator', async function translatorEmail(req) {

            const id = req.params[0].ID
            const translation = await SELECT.one.from(Translations).where({ ID: id })
            const template = await SELECT.one.from(Templates).where({ ID: translation.template_ID })
            //const template = await SELECT.one.from(Templates).where({ID: template_ID})
            const subject = template.subject
            const content = template.content
            const translang = translation.translang_code
            const prompt = translation.prompt
    
            const payload = {
                "messages": [
                    {
                        "role": "system",
                        "content": `You are professional translator. Your task is to translate the email template into business-level formal target language. The target language code is "${translang}" according to ISO 639. \n Return ${subject} and ${content} with placeholders. \n ${prompt}`
                    }
                ],
                "max_tokens": 500,
                "temperature": 0.0,
                "frequency_penalty": 0,
                "presence_penalty": 0,
                "stop": "null"
            };
    
            try {
                
                const token = await axios.post("https://tum-ai-praktikum-sandbox-tdd.authentication.eu10.hana.ondemand.com/oauth/token", "grant_type=client_credentials", {
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                        "Cache-Control": "no-cache"
                    },
                    auth: {
                            username: "sb-90181d25-edaf-44d5-a8af-8d034e7ad591!b480214|aicore!b540",
                            password: "3fe38d7f-654a-4d6a-83cf-327ef053216c$Esn-tKauGCvNc5E8NVjR6mq87JM6tWsn9smASH0Uvsk="
                    }
                    });
                
                const config = {
                    headers: {
                        Authorization: `Bearer ${token.data.access_token}`,
                        "AI-Resource-Group": "default"
                    }
                };
    
                const response = await axios.post('https://api.ai.prod.eu-central-1.aws.ml.hana.ondemand.com/v2/inference/deployments/d8321d6bf8269e7b/chat/completions?api-version=2023-05-15', 
                                                payload, config); 
                console.log(response.data.choices[0].message.content);
                const result = response.data.choices[0].message.content;
                await UPDATE(Translations).set({content: result}).where ({ID: id});
                return result
            } catch (error) {
                return ('Translation failed: ' + error.message);
            }
        })


        this.on('editTranslation', async function onEditTranslation(req) {
            
            const { translation: ID } = req.data
            
            await UPDATE(Translations).set({content: req.string}).where({ID: ID})

        })
})

//module.exports = Notification