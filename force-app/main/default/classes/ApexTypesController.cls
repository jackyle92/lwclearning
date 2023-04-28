public with sharing class ApexTypesController {
    public ApexTypesController() {
    }

    @AuraEnabled
    public static String checkApexType(CustomWrapper wrapper){
        try {
            System.debug(wrapper);

            String response = 'You entered "' +
            wrapper.someString +
            '" as String, and "' +
            wrapper.someInteger +
            '" as Integer value. The list contained ' +
            wrapper.someList.size() +
            ' items.';

            return response;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        for (Integer i = 0; i < 3; i++) {
            System.debug(i + 'Hello World!');
        }

        String find = '%a%';
        Map<id, Account> conts = new Map<Id, Account>([SELECT Id, Name, (SELECT Id,FirstName, LastName FROM Contacts) con FROM Account WHERE Name like :find]);
        System.debug(conts.values());
    }
}