import { LightningElement, track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountWireHelper.getAccountList';

export default class WireFunction extends LightningElement {

    @track accData;
    @track error;

    @wire(getAccountList)
    wiredAccounts({ data, error }) {
        if (data) {
            this.accData = data;
        } else if (error) {
            //console.log(error);
            this.error = error;
        }

    }

}