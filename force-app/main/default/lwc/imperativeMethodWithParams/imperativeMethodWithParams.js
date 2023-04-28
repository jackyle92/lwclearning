import { LightningElement, track } from 'lwc';
import getContactsWithParam from '@salesforce/apex/ContactController.getContactLstWithParam';

export default class ImperativeMethodWithParams extends LightningElement {

  @track searchKey;
  @track contacts;
  @track error;
  handleKeyChange(event) {
    this.searchKey = event.target.value;
    console.log(this.searchKey);
  }
  handleSearch() {
    getContactsWithParam({search: this.searchKey}).then(result => {
      this.contacts = result;
      console.log(this.contacts);
      this.error = undefined;
    }).catch(error => {
      this.contacts = undefined;
      this.error = error;
    })
  }
}