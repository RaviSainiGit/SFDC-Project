import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/SortLastNameContactClass.getContacts';

export default class SortLastNameContact extends LightningElement {

    @track conData = [];
    @track error;

    accURL = "";
    isAsc = false;
    isDsc = false;
    isFirstNameSort = false;
    isLastNameSort = false;
    isEmailSort = false;
    isPhoneSort = false;

    sortedDirection = 'asc';
    sortedColumn;

    @wire(getContacts)
    wiredContacts({ data, error }) {
        if (data) {
            this.conData = data;
        } else if (error) {
            this.error = error;
        }
    }

    gotoAccount(event) {
        this.accURL = window.location.origin + "/" + event.currentTarget.dataset.id;
    }

    sortFirstName(event) {
        this.isFirstNameSort = true;
        this.isLastNameSort = false;
        this.isEmailSort = false;
        this.isPhoneSort = false;

        this.sortData(event.currentTarget.dataset.id);
    }

    sortLastName(event) {
        this.isFirstNameSort = false;
        this.isLastNameSort = true;
        this.isEmailSort = false;
        this.isPhoneSort = false;

        this.sortData(event.currentTarget.dataset.id);
    }

    sortEmail(event) {
        this.isFirstNameSort = false;
        this.isLastNameSort = false;
        this.isEmailSort = true;
        this.isPhoneSort = false;

        this.sortData(event.currentTarget.dataset.id);
    }

    sortPhone(event) {
        this.isFirstNameSort = false;
        this.isLastNameSort = false;
        this.isEmailSort = false;
        this.isPhoneSort = true;

        this.sortData(event.currentTarget.dataset.id);
    }


    sortData(sortColumnName) {
        // check previous column and direction
        if (this.sortedColumn === sortColumnName) {
            this.sortedDirection = this.sortedDirection === 'asc' ? 'desc' : 'asc';
        } else {
            this.sortedDirection = 'asc';
        }

        // check arrow direction
        if (this.sortedDirection === 'asc') {
            this.isAsc = true;
            this.isDsc = false;
        } else {
            this.isAsc = false;
            this.isDsc = true;
        }

        // check reverse direction
        let isReverse = this.sortedDirection === 'asc' ? 1 : -1;

        this.sortedColumn = sortColumnName;

        // sort the data
        this.conData = JSON.parse(JSON.stringify(this.conData)).sort((a, b) => {
            a = a[sortColumnName] ? a[sortColumnName].toLowerCase() : ''; // Handle null values
            b = b[sortColumnName] ? b[sortColumnName].toLowerCase() : '';

            return a > b ? 1 * isReverse : -1 * isReverse;
        });;
    }
}