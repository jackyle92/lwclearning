/**
 * @description: 
 * @author: jackylee
 * @email: jacky.lee@crosscloudpartners.com
 */
public with sharing class ContactController {
    public ContactController() {

    }

    @AuraEnabled
    public static List<Contact> getContactList() {
        List <Contact> contLst = [SELECT id, Name, Picture__c FROM Contact WHERE Picture__c != null LIMIT 5];
        return contLst;
    }

    @AuraEnabled
    public static List<Contact> getContactLstWithParam(String search){
        try {
            String searchKey = '%' + search + '%';
            List <Contact> contLst = [SELECT id, Name FROM Contact WHERE name LIKE :searchKey];
            return contLst;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @future(callout = true) 
    public static void sendUpdateContactInfo(Set<Id> contactsId) {
        List<Map<String, String>> calloutBodyMap = new List<Map<String,String>>();

        for(Contact con :  [SELECT FirstName, LastName, Email, ExternalId__c FROM Contact WHERE Id in :contactsId]){
            Map<String, String> contactInfo = new Map<String, String>();
            contactInfo.put('first_name', con.FirstName);
            contactInfo.put('last_name', con.LastName);
            contactInfo.put('email', con.Email);
            contactInfo.put('externalId', con.ExternalId__c);
            calloutBodyMap.add(contactInfo);
        }

        HttpRequest req = new HttpRequest();
        req.setMethod('PUT');
        req.setBody(JSON.serialize(calloutBodyMap));
        req.setEndpoint('https://some.external.service.com/contacts');
        Http http = new Http();
        HttpResponse res = http.send(req);
        if(res.getStatusCode() != 200) {
            throw new CalloutException('Incorrect status returned: ' + res.getStatusCode());
        }

    }

    // for learning LWC
    @AuraEnabled(cacheable = true)
    public static List<Contact> findContact(String searchKey){
        try {
            String keySearch = '%' + searchKey + '%';
            return [SELECT Id, Name, Title, Phone, email, Picture__c
                        FROM Contact 
                        WHERE Name like :keySearch AND Picture__c != null
                        LIMIT 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}