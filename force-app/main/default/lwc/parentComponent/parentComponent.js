import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    firstName;
    lastName;
    email;
    phone;

    changeHandler(event){
        if(event.target.name == 'firstName'){
            this.firstName=event.target.value;
            // console.log(":: First Name ::"+this.name);
        }
        if(event.target.name == 'lastName'){
            this.lastName=event.target.value;
            console.log(":: Last Name ::"+this.lastName);
        }
        if(event.target.name == 'email'){
            this.email=event.target.value;
            console.log(":: Email ::"+this.email);
        }
        if(event.target.name == 'phone'){
            this.phone=event.target.value;
            console.log(":: Phone ::"+this.phone);
        }
        
    }

}