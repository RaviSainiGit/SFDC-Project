import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/getRecordContactController.getContacts';

export default class DisplayContact extends LightningElement {

    @wire(getContacts) listContacts;
}