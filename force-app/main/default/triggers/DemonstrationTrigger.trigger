trigger DemonstrationTrigger on Demonstration__e (after insert) {
  for (Demonstration__e demo : (List<Demonstration__e>) Trigger.new) {
    System.debug(demo.Message__c);
  }

}