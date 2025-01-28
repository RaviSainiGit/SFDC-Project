import { LightningElement,wire,track } from 'lwc';
 
import getAccountList from '@salesforce/apex/AccountContactController.getAccountList';
import getContacts from '@salesforce/apex/AccountContactController.getContacts';
 
const columns = [{
        label: 'First Name',
        fieldName: 'FirstName',
        sortable: "true"
    },
    {
        label: 'Last Name',
        fieldName: 'LastName',
        sortable: "true"
    },
    {
        label: 'Email',
        fieldName: 'Email',
        type: 'email'
    },
    {
        label: 'Phone',
        fieldName: 'phone',
        type: 'phone',
        sortable: "true"
    }
 
];
export default class AccCon extends LightningElement {
    
    @track accountId = '';
    @track contacts;
    @track columns = columns;
    @wire(getAccountList) accounts;
    @track data;
    @track sortBy;
    @track sortDirection;

    onValueSelection(event) {
        const selectedAccount = event.target.value;
        this.accountId = event.target.value;
        if (selectedAccount != null) {
            getContacts({
                    accountId: selectedAccount
                })
                .then(result => {
                    this.contacts = result;
                    console.log('result' + JSON.stringify(result) + selectedAccount);
                })
                .catch(error => {
                    this.error = error;
                });
        }
    }

     
    handleSortdata(event) {
        // field name
        this.sortBy = event.detail.fieldName;

        // sort direction
        this.sortDirection = event.detail.sortDirection;

        // calling sortdata function to sort the data based on direction and selected field
        this.sortData(event.detail.fieldName, event.detail.sortDirection);
    }

    sortData(fieldname, direction) {
        // serialize the data before calling sort function
        let parseData = JSON.parse(JSON.stringify(this.data));

        // Return the value stored in the field
        let keyValue = (a) => {
            return a[fieldname];
        };

        // cheking reverse direction 
        let isReverse = direction === 'asc' ? 1: -1;

        // sorting data 
        parseData.sort((x, y) => {
            x = keyValue(x) ? keyValue(x) : ''; // handling null values
            y = keyValue(y) ? keyValue(y) : '';

            // sorting values based on direction
            return isReverse * ((x > y) - (y > x));
        });

        // set the sorted data to data table data
        this.data = parseData;

    }

}