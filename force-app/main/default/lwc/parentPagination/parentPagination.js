import { LightningElement, track, wire } from 'lwc';
import getAccount from '@salesforce/apex/PaginationController.getAccount';

const columns = [{
        label: "Id",
        fieldName: "Id"
    },
    {
        label: "Name",
        fieldName: "Name"
    },
    {
        label: "Type",
        fieldName: "Type"
    },
    {
        label: "Billing Country",
        fieldName: "BillingCountry"
    }
];

export default class ParentPagination extends LightningElement {

    @track columns = columns;
    @track data;
    @track items;
    @track startingRecord = 1;
    @track endingRecord = 0;
    @track totalRecordCount;
    @track page = 1;
    @track totalPage;
    @track pageSize = 5;

    @wire(getAccount)
    fetchAccounts(result) {
        if (result.data) {
            this.items = result.data;
            this.totalRecordCount = result.data.length;
            this.totalPage = Math.ceil(this.totalRecordCount / this.pageSize);
            this.data = this.items.slice(0, this.pageSize);
            this.endingRecord = this.pageSize;
        }
    }

    prevHandler(event) {
        if (this.page > 1) {
            this.page = this.page - 1;
            this.displayRecordPerPage(this.page);
        }
    }

    nextHandler(event) {
        if (this.page < this.totalPage && this.page !== this.totalPage) {
            this.page = this.page + 1;
            this.displayRecordPerPage(this.page);
        }
    }

    displayRecordPerPage(page) {
        this.startingRecord = (page - 1) * this.pageSize;
        this.endingRecord = page * this.pageSize;
        this.endingRecord = (this.endingRecord > this.totalRecordCount) ? this.totalRecordCount : this.endingRecord;
        this.data = this.items.slice(this.startingRecord, this.endingRecord);
        this.startingRecord = this.startingRecord + 1;
    }

}