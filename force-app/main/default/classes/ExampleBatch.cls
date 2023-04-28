public with sharing class ExampleBatch implements Database.Batchable<SObject>, Database.Stateful, Database.AllowsCallouts {

    private Integer statefulCount = 0;
    private static Integer staticCount = 0;
    public ExampleBatch() {

    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        // Retreive bulk of data for processing
    }

    public void execute(Database.BatchableContext bc, List<SObject> records){
        for(Account acct : (List<Account>)records) {
            statefulCount++;
            staticCount++;
        }
    }

    public void finish(Database.BatchableContext bc) {
        // Run any post processing
        System.debug(statefulCount);
        System.debug(staticCount);
    }
}