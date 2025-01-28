import { LightningElement, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/accountSearchController.getContactList';

export default class AccountSearch extends LightningElement {
    @track searchKey;
    @track contacts;
    @track error;
    @track data;

    // @wire(getContactList)
    // wiredData({ error, data }) {
    //   if (data) {
    //     this.contacts = data;
    //   } else if (error) {
    //     this.error = error;
    //     console.log('Error', error);
    //   }
    // }
    //Data = error
    //contacts.data
    //contacts.error

    handleChange(event){
      event.preventDefault();
      console.log('value'+ event.target.value);
      console.log(this.contacts);

    }

}