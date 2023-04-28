import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class EventWithData extends LightningElement {
  contacts;
  selectedContact;

  @wire(getContactList) contacts;

  handleClick(event) {
    const contactId = event.detail;
    this.selectedContact = this.contactId.data.find(contact => contact.Id === contactId);
  }
}