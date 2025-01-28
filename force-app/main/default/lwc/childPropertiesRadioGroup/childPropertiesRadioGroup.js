import { LightningElement, api, track, wire } from 'lwc';
import getParentsByCriteria from '@salesforce/apex/LL_SelectPropertiesParentController.getParentsByCriteria';
import getRecordsCount from '@salesforce/apex/LL_SelectPropertiesParentController.getRecordsCount';

export default class ChildPropertiesRadioGroup extends LightningElement {

    @track options = [{ label: 'By Property', value: 'byProperty' }];
    @track selectedOption = 'byProperty';
    @track step = 1;

    //@api componentTitle = 'Search Account';
    @track listOfRecords = [];
    @track selectedRows = [];
    @track currentSelectedRows = [];
    @track currentSelectedRowName;
    @track selectedRow;
    @track sortedBy;
    @track sortedDirection;
    @track keyField = 'Id';
    @track option;

    @track showNoResultsErrorMessage = false;
    @track searchCriteria = '';
    @track pageNumber = 1;
    @track pageSize = 5;
    @track isLastPage = false;
    @track totalRecords = 0;
    @track totalPages = 0;

    // Column settings
    lstColumns = [
        // Define your column settings here based on your requirements
        // Example:
        { label: 'Name', fieldName: 'Name', type: 'text', sortable: true }
    ]
    // Initialization logic
    connectedCallback() {
        this.fetchRecords();
    }

    // Fetch records method
    fetchRecords() {
        getRecordsCount({ strOption: this.option, searchCriteria: this.searchCriteria })
            .then(result => {
                this.totalRecords = result;
                this.totalPages = Math.ceil(result / this.pageSize);
                this.isLastPage = this.totalPages === this.pageNumber;
                if (this.totalRecords > 0) {
                    this.fetchRecordsByCriteria();
                } else {
                    this.showNoResultsErrorMessage = true;
                }
            })
            .catch(error => {
                console.error('Error fetching records count: ', error);
            });
    }

    // Fetch records by criteria method
    fetchRecordsByCriteria() {
        getParentsByCriteria({ strOption: this.option, searchCriteria: this.searchCriteria, pageSize: this.pageSize, pageNumber: this.pageNumber })
            .then(result => {
                this.listOfRecords = result;
            })
            .catch(error => {
                console.error('Error fetching records by criteria: ', error);
            });
    }

    // Handle search change
    handleSearchChange(event) {
        this.searchCriteria = event.target.value;
    }

    // Handle search button click
    handleSearch() {
        this.pageNumber = 1;
        this.showNoResultsErrorMessage = false;
        this.fetchRecords();
    }

    // Handle row selection
    handleRowSelection(event) {
        // Handle row selection logic
    }

    handleNext() {
        this.step++;
    }

    handlePrevious() {
        this.step--;
    }
    get isStep1() {
        return this.step === 1;
    }

    get isStep2() {
        return this.step === 2;
    }

    get isStep3() {
        return this.step === 3;
    }

}