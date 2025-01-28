import { LightningElement, api, track } from 'lwc';
import Id from '@salesforce/user/Id';
export default class MyFirstLWC extends LightningElement {
    @api name = 'Ravi Saini';
    @track title = 'CRM Consultant';
    phone = '8800746920';
    email = 'ravisaini9900@gmail.com';
    userId = Id;

    handleClick(){
        console.log('i am inside Js file');
        this.name = 'Virat kohli';
        this.title = 'Salesforce Developer';
    }

}