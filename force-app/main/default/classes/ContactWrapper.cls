public with sharing class ContactWrapper {
    public ContactWrapper() {

    }
    private String firstName;
    private String lastName;
    private String email;

    public Contact generalContact () {
        Contact cont = new Contact();
        cont.FirstName = 'Jacky';
        cont.LastName = 'Lee';
        cont.email = 'jacky.lee@crosscloudpartners.com';
        return cont;
    }
}