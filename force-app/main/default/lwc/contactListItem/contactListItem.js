import { LightningElement, api } from 'lwc';

export default class ContactListItem extends LightningElement {
  @api contact;
  hanldeClick(event) {
    // prevent default behavior of anchor tag click which is to navigate to the href url
    event.preventDefault();
    const selectEvent = new CustomEvent('select', {detail: this.contact.Id});

    this.dispatchEvent(selectEvent);
  }
}