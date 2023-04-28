trigger TaskTrigger on Task (after insert, after update) {
  switch on Trigger.OperationType {
    when AFTER_INSERT {
      TaskTriggerHandler handler = new TaskTriggerHandler();
      handler.afterInsert(Trigger.new);
    }
    when AFTER_UPDATE {
      TaskTriggerHandler handler = new TaskTriggerHandler();
      handler.afterUpdate(Trigger.new, Trigger.oldMap);
    }
  }
}