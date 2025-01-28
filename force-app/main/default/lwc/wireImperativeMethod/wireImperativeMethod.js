import { LightningElement, track } from 'lwc';
import getAccountList from '@salesforce/apex/AccountWireHelper.getAccountList';

export default class WireImperativeMethod extends LightningElement {

    @track accData;
    @track error;

    handleLoad() {
        getAccountList()
            .then(result => {
                this.accData = result;
            })
            .catch(error => {
                this.error = error;
            });
    }
}