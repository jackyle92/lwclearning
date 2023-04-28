public without sharing class TaskTriggerHandler {

    public static final String KEY_PREFIX = Contact.sObjectType.getDescribe().getKeyPrefix();
    
    public  void afterInsert(List<Task> tasks){
        Set<id> contactIds = new Set<Id>();
        for (Task t: tasks){
            if(t.WhoId != null && String.valueOf(t.WhoId).startsWith('003')) {
                contactIds.add(t.WhoId);
            }
        }

        Map<Id, Contact> contactMap = new Map<Id, Contact> ([SELECT id, No_of_Open_Tasks__c FROM Contact WHERE Id in :contactIds]);
        for (Task t : tasks) {
            if(contactMap.containsKey(t.WhoId)){
                contactMap.get(t.WhoId).No_of_Open_Tasks__c++;
            }
        }
        update contactMap.values();
    }

    public  void afterUpdate(List<Task> tasks, Map<id, Task> mapTasks){
        Set<id> contactIds = new Set<Id>();
        for (Task t : tasks) {
            if(t.IsClosed && !mapTasks.get(t.Id).IsClosed && t.WhoId != null && String.valueOf(t.WhoId).startsWith(
                KEY_PREFIX
            )) {
                contactIds.add(t.WhoId);
            }
        }

        Map<Id, Contact> contactMap = new Map<Id, Contact>([SELECT Id, No_of_Open_Tasks__c FROM Contact WHERE Id in:contactIds]);

        for (Contact con: contactMap.values()) {
            con.No_of_Open_Tasks__c = 0;
        }

        for (AggregateResult ar : [SELECT WhoId, COUNT(Id) total FROM Task WHERE IsClosed = false AND WhoId in :contactIds GROUP BY WhoId]) {
            String who = String.valueOf(ar.get('WhoId'));
            Decimal total = (Decimal)(ar.get('total'));
            contactMap.get(who).No_of_Open_Tasks__c = total;
        }
        update contactMap.values();

    }
}