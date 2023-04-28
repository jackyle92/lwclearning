import findContact from '@salesforce/apex/ContactController.findContact';
import { LightningElement } from 'lwc';

const DELAY = 340;

export default class CompositionContactSearch extends LightningElement {

  contacts;
  error;

  handleKeyChange(event) {
    window.clearTimeout(this.delayTimeout);
    const searchKey = event.target.value;
    console.log(searchKey);

    this.delayTimeout = setTimeout(() => {
      findContact({'searchKey': searchKey})
        .then(result => {
          this.contacts = result;
          this.error = undefined;
        })
        .catch(error => {
          this.contacts = undefined;
          this.error = error;
        })
    }, DELAY);

  }
}