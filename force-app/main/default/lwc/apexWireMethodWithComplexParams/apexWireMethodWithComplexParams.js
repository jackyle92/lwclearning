import { LightningElement, track, wire } from 'lwc';
import checkApexType from '@salesforce/apex/ApexTypesController.checkApexType';

export default class ApexWireMethodWithComplexParams extends LightningElement {

  listItemValue = 0;
  numberValue = 50;
  stringValue = 'Some String';

  parameterObject = {
    someString: this.stringValue,
    someInteger: this.numberValue,
    someList: this.listItemValue,
  }

  @wire (checkApexType, {wrapper: '$parameterObject'}) apexResponse;

  handleStringChange(event) {
    this.parameterObject = {
      ...this.parameterObject, 
      someString: (this.stringValue = event.target.value),
    }
    console.log(this.parameterObject);
  }

  handleNumberChange(event) {
    this.parameterObject = {
      ...this.parameterObject, 
      someInteger: (this.numberValue = event.target.value),
    }
  }

  handleListItemChange(event) {
    const someList = [];
    for (let i = 0; i <event.target.value; i++) {
      someList.push(this.stringValue);
    }
    console.log('Some List: ', someList);
    this.parameterObject = {
      ...this.parameterObject,
      someList
    }
  }
}