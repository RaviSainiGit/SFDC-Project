import { LightningElement, track ,wire } from 'lwc';
import getEmployeeList from '@salesforce/apex/EmployeeController.getEmployeeList';

export default class Employee extends LightningElement {

    @track empData;
    @track error;

    @wire(getEmployeeList)
    dataRecord({data, error}){

        if(data){
            this.empData = data;
        }
        else if(error){
            this.error = error;
        }
    }
}