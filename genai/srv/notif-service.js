const cds = require('@sap/cds')
const log = cds.log('notif-service')

class Notification extends cds.ApplicationService {
    
    init() {

        const { Translations } = cds.entities


        on('Translate', async function onTranslate(request) {
            log.info('on Translation - request.data', request.data, 'request.params:', request.params)
            const thisID = request.params[0].ID
            const template = await SELECT.one.from(Translations).where({ID : thisID })
            const resp = await (template.subject).concat(template.cont)

            request.reply(resp)

            

            /**fetch("https://api.ai.prod.eu-central-1.aws.ml.hana.ondemand.com/v2/inference/deployments/d8321d6bf8269e7b", {
                method: "POST",
                body: JSON.stringify({
                  userId: 1,
                  title: "Fix my bugs",
                  completed: false
                }),
                headers: {
                  "Content-type": "application/json; charset=UTF-8"
                }
              });**/
              
            
        })
    
    return super.init()
    }

}

module.exports = Notification