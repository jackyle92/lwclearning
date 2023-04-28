public with sharing class QueueableDemo implements System.Queueable{
    public QueueableDemo() {

    }
    public static void invokeQueueableMethod() {
        QueueableDemo qc = new QueueableDemo();
        System.enqueueJob(qc);
    }

    public void execute (System.QueueableContext context) {
        System.debug('Inside the execute of Queueable Job');
        List<Account> listOfAccount = new List<Account>([SELECT Id, Name FROM Account LIMIT 50]);
        System.debug('listof Account: ' + listOfAccount);
    }
}