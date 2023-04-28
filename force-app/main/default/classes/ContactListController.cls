public with sharing class ContactListController {
    public List<ContactWrapper> contacts {get; set;}

    public ContactListController() {
        contacts = new List<ContactWrapper>();
        for (Contact con: [SELECT Id, FirstName, LastName FROM Contact LIMIT 20]) {
            contacts.add(new ContactWrapper(con));
        }
    }

    //an example action method, this would be called from a button on the UI
    public Pagereference updateSelected() {
        for (ContactWrapper wrapper: contacts) {
            System.debug(wrapper.con.FirstName + ' ' + wrapper.con.LastName + ' is selected? ' + wrapper.selected);
        }
    }



    public with sharing class ContactWrapper {
        public Boolean selected {get; set;}
        public Contact con {get; set;}

        public ContactWrapper(Contact cont) {
            this.selected = false;
            this.con = cont;
        }
    }
}