import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/getRecordContactController.getContacts';

export default class DisplayContactRecord extends LightningElement {

    @track columns = [
        { label: 'Id', fieldName: 'Id'},
        { label: 'FirstName', fieldName: 'FirstName' },
        { label: 'LastName', fieldName: 'LastName' },
        { label: 'Phone', fieldName: 'Phone'}
    ];

    @track contactList;

   @wire (getContacts) wiredContacts({data,error}){
        if (data) {
            this.contactList = data;
            console.log(data); 
        } else if (error) {
            console.log(error);
        }
    }

}