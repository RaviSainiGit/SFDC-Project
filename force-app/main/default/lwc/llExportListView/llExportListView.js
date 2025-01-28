import { LightningElement,api } from 'lwc';
import getDataFromQuery from '@salesforce/apex/LL_ExportListViewController.getDataFromQuery';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class  LlExportListView extends LightningElement {
@api currentref ;
returnURL ;
data;
error;


connectedCallback() {
    alert(this.currentref);
    console.log('test'+this.currentref);
    getDataFromQuery({ urlString: this.currentref })
        .then(
            result => {
                console.log('exports'+result);
                alert(result);
                this.data = result;
            this.error = undefined;
            this.handleClick();
        })
        .catch(error => {
            this.error = error;
            console.log('error'+JSON.stringify(this.error));
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error while getting Accounts', 
                    message: error.message, 
                    variant: 'error'
                }),
            );
            this.data = undefined;
        });

    
}
handleClick(){
    //alert(JSON.stringify(this.data));
    let rowEnd = '\n';
        let csvString = '';
        let rowData = new Set();

        this.data.forEach(function (record) {
            Object.keys(record).forEach(function (key) {
                rowData.add(key);
            });
        });

       
        rowData = Array.from(rowData);
        csvString += rowData.join(',');
        csvString += rowEnd;

        // main for loop to get the data based on key value
        
        for(let i=0; i < this.data.length; i++){
            let colValue = 0;

            for(let key in rowData) {
                if(rowData.hasOwnProperty(key)) {
                 
                    let rowKey = rowData[key];
                    
                    if(colValue > 0){
                        csvString += ',';
                    }
                   
                    let value = this.data[i][rowKey] === undefined ? '' : this.data[i][rowKey];
                    csvString += '"'+ value +'"';
                    colValue++;
                }
            }
            csvString += rowEnd;
        }

        
        let downloadElement = document.createElement('a');

        downloadElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csvString);
        downloadElement.target = '_self';
        downloadElement.download = 'Account Data.csv';
        document.body.appendChild(downloadElement);
        downloadElement.click();
       // alert('test'); 
        this.handleNavigatetoNew();
    

    }
    async handleNavigatetoNew() {
     window.open(this.currentref,"_self");
  }



}