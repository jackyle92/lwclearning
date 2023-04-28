public with sharing class Person {
    public String firstName;
    public String lastName;
    private Date dateOfBirth = Date.today();
    private String identification;
    public Integer age {
        get {
            return 32;
        }
        private set;

    }
    public Person(){
        this('John', 'Doe');
    }
    public Person(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
        System.debug(this.firstName + ' ' + this.lastName);
    }

}