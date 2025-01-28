import { LightningElement, wire } from 'lwc';
import getObjectFields from '@salesforce/apex/GetObjectNamePickList.getObjectFields';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class GetObjectNamePickList extends LightningElement {

    objectApiName = '';
    fields = [];
    error;

    columnHeader = ['Object Name', 'Field Label', 'Data Type', 'Description', 'Relationship Name']

    @wire(getObjectFields, { objectApiName: '$objectApiName' })
    wiredFields({ error, data }) {
        if (data) {
            this.fields = data.map(field => ({
                objectLabel: field.objectLabel,
                label: field.label,
                dataType: field.dataType,
                description: field.description,
                relationshipName: field.relationshipName,
            }));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.fields = undefined;
        }
    }

    get columns() {
        return [
            { label: 'Object Name', fieldName: 'objectLabel' },
            { label: 'Field Label', fieldName: 'label' },
            { label: 'Data Type', fieldName: 'dataType' },
            { label: 'Description', fieldName: 'description' },
            { label: 'Relationship Name', fieldName: 'relationshipName' },
        ];
    }

    handleObjectChange(event) {
        this.objectApiName = event.target.value;
    }

    downloadCSV() {

        if (this.fields.length === 0) {
            this.showToast('Error', 'Please enter a valid object name', 'error');
            return;
        }
        else {
            // Prepare a html table
            let doc = '<table>';
            // Add styles for the table
            doc += '<style>';
            doc += 'table, th, td {';
            doc += '    border: 1px solid black;';
            doc += '    border-collapse: collapse;';
            doc += '}';
            doc += '</style>';
            // Add all the Table Headers
            doc += '<tr>';
            this.columnHeader.forEach(element => {
                doc += '<th>' + element + '</th>'
            });
            doc += '</tr>';
            // Add the data rows
            this.fields.forEach(record => {
                doc += '<tr>';
                doc += '<th>' + (record.objectLabel || '') + '</th>';
                doc += '<th>' + (record.label || '') + '</th>';
                doc += '<th>' + (record.dataType || '') + '</th>';
                doc += '<th>' + (record.description || '') + '</th>';
                doc += '<th>' + (record.relationshipName || '') + '</th>';
                doc += '</tr>';
            });
            doc += '</table>';
            var element = 'data:application/vnd.ms-excel,' + encodeURIComponent(doc);
            let downloadElement = document.createElement('a');
            downloadElement.href = element;
            downloadElement.target = '_self';
            // use .csv as extension on below line if you want to export data as csv
            downloadElement.download = 'Export Object Data.xls';
            document.body.appendChild(downloadElement);
            downloadElement.click();
        }
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }

}