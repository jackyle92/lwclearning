@isTest
private with sharing class InboundEmailHandlerRecipes_tests {
    
    static final String FROM_EMAIL = 'jacky.lee@crosscloudpartners.com';

    @TestSetup
    static void makeData(){
        Account testAccount = (Account) TestFactory.createSObject(new Account(Name = 'Testing Account'), true);

        TestFactory.createSObject(new Contact(
            email=FROM_EMAIL,
            AccountId = testAccount.Id,
            LastName = 'Poorman'
            ), 
            true);
    }

    private static Messaging.inboundEmail.BinaryAttachment createAttachment(String fileName, Blob fileBody) {
        Messaging.inboundEmail.BinaryAttachment attachment = new Messaging.inboundEmail.BinaryAttachment();
        attachment.fileName = fileName;
        attachment.body = fileBody;
        return attachment;
    }

    private static Messaging.InboundEmail createEmail () {
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.fromName = 'Kevin Poorman';
        email.fromAddress = FROM_EMAIL;
        email.toAddresses = new List<String> {'invalid@invalid.com.invalid'};
        email.subject = 'Test Email';
        email.plainTextBody = 'Welcome CodeLive Viewers';
        email.binaryAttachments = new List<Messaging.InboundEmail.BinaryAttachment>{createAttachment(
                'helloWorld.txt',
                Blob.valueOf('Hello CodeLive Viewers')
            ),
            createAttachment(
                'helloWorld2.txt',
                Blob.valueOf('Hello CodeLive Viewers two')
            )
        };
        return email;
    }

    private static Messaging.InboundEnvelope createEnvelop() {
        Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
        envelope.fromAddress = FROM_EMAIL;
        return envelope;
    }

    @isTest
    static void handleInboundEmailPossitiveFailureWhenContactCreationFails() {
        Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.fromAddress = FROM_EMAIL;

        delete [SELECT Id FROM Contact];

        Test.startTest();
        Messaging.InboundEmailResult result = new InboundEmailHandlerRecipes().handleInboundEmail(email, envelope);
        Test.stopTest();
        System.Assert.isFalse(
            result.success, 
            'Expected to find the success property is false.');
        System.Assert.isTrue(
            result.message.containsIgnoreCase('Unable to create new contact'), 
            'Expected to receive a InboundEmailHandlerRecipesException with the given message');

    }

}