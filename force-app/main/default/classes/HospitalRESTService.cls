@RestResource(urlMapping = '/hospital/*')
global with sharing class HospitalRESTService {
    @HttpGet
    global static HospitalWrapper doGet() {
        RestRequest req = RestContext.request;
        System.debug('URI: ' + req.requestURI);
        List<String> splitUrl = req.requestURI.split('/');
        String refCode = splitUrl[splitUrl.size() -1];
        List<Account> hospitals = [SELECT Name,Type, Industry, Hospital_Ref_Code__c FROM Account WHERE Hospital_Ref_Code__c = :refCode];
        if(hospitals.size() == 1) {
            // return hospitals[0];
            HttpResponse res = new HttpResponse();
            res.setBody(JSON.serializePretty(new HospitalWrapper(hospitals[0])));
            res.setStatusCode(200);
            return new HospitalWrapper(hospitals[0]);
        }
        return null;
    }

    @HttpPost
    global static String doPost() {

        System.debug(SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Hospital').getRecordTypeId());


        Id hospitalRTId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Hospital').getRecordTypeId();
        List<API_Mapping__mdt> mappings = [SELECT DeveloperName, Target_Field__c FROM API_Mapping__mdt];
        Blob requestBody = System.RestContext.request.requestBody;
        System.debug('requestBody: ' + requestBody.toString());
        Map<String,SObject> hospitalData = new Map<String, SObject>();
        hospitalData = (Map<String,SObject>)JSON.deserializeUntyped(requestBody.toString());
        // System.debug(hospitalData);
        Account hospital = new Account();
        hospital.RecordTypeId = hospitalRTId;
        for (API_Mapping__mdt  mapping : mappings) {
            if(hospitalData.containsKey(mapping.DeveloperName)){
                hospital.put(mapping.Target_Field__c, hospitalData.get(mapping.DeveloperName));
            }
        }
        insert hospital;
        return hospital.Hospital_Ref_Code__c;
    }
}
