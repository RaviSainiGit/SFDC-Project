import { LightningElement, track, wire } from 'lwc';
import getEmployeeList from '@salesforce/apex/EmployeePaginationClass.getEmployeeList';
const DELAY = 100;

export default class EmployeePagination extends LightningElement {

    @track empData;
    @track strSearchEmpName = '';

    empURL = "";
    isAsc = false;
    isDsc = false;
    isNameSort = false;
    isEmailSort = false;

    sortedDirection = 'asc';
    sortedColumn;

    @wire(getEmployeeList, { empStrName: '$strSearchEmpName' })
    retrieveAccounts({ error, data }) {
        if (data) {
            this.empData = data;
        } else if (error) {

        }
    }

    searchEmployeeAction(event) {
        const searchString = event.target.value;
        window.clearTimeout(this.delayTimeout);
        this.delayTimeout = setTimeout(() => {
            this.strSearchEmpName = searchString;
        }, DELAY);
    }

    gotoAccount(event) {
        this.empURL = window.location.origin + "/" + event.currentTarget.dataset.id;
    }

    sortName(event) {
        this.isNameSort = true;
        this.isEmailSort = false;

        this.sortData(event.currentTarget.dataset.id);
    }

    sortEmail(event) {
        this.isNameSort = false;
        this.isEmailSort = true;

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
        this.empData = JSON.parse(JSON.stringify(this.empData)).sort((a, b) => {
            a = a[sortColumnName] ? a[sortColumnName].toLowerCase() : ''; // Handle null values
            b = b[sortColumnName] ? b[sortColumnName].toLowerCase() : '';

            return a > b ? 1 * isReverse : -1 * isReverse;
        });;
    }

}