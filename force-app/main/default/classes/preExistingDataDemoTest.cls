@isTest
public with sharing class preExistingDataDemoTest {
    
    //Objects that are used to manage the org, or metadata objects, such as Users, Profile, Organization and RecordType can be accessed in unit tests.
    @isTest static void doUnitTest() {
        Map<Id, RecordType> recordTypeQuery = new Map<Id, RecordType>([SELECT Id FROM RecordType]);
        System.debug('Queried record types: ' + recordTypeQuery.size()); 
        Map<Id, User> uerQuery = new Map<Id, User> ([SELECT Id FROM User]);
        Map<Id, Profile> profileQuery = new Map<Id, Profile> ([SELECT Id FROM Profile]);
    }
}