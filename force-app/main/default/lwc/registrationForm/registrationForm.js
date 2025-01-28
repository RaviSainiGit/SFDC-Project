import { LightningElement } from 'lwc';
import submitRegistration from '@salesforce/apex/registrationController.submitRegistration';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RegistrationForm extends LightningElement {

    firstNameVal;
    lastNameVal;
    phoneVal;
    emailVal;
    regRecordId;
    confirmPasswordVal;
    passwordVal;
    dateOfBirthVal;
    addressVal;
    confirmPasswordMessage;
    confirmPasswordMessageStyle;
    

    regHandleChange(event){
        //alert(event.target.name);
        if(event.target.name == 'firstName'){
            this.firstNameVal = event.target.value;  
        }
        if(event.target.name == 'lastName'){
            this.lastNameVal = event.target.value;  
        }
        if(event.target.name == 'Phone'){
            this.phoneVal = event.target.value;  
        }
        if(event.target.name == 'Email'){
            this.emailVal = event.target.value;  
        }
        if(event.target.name == 'userName'){
            this.userNameVal = event.target.value;  
        }
        if(event.target.name == 'dateOfBirth'){
            this.dateOfBirthVal = event.target.value;  
        }
        if(event.target.name == 'Address'){
            this.addressVal = event.target.value;  
        }
        if(event.target.name == 'Password'){
            this.passwordVal = event.target.value;  
        }
        if(event.target.name == 'confirmPassword' ){
            //console.log(this.confirmPasswordVal);
            this.confirmPasswordVal = event.target.value;
            //alert(this.confirmPasswordVal);
              if(this.confirmPasswordVal === this.passwordVal){
                   this.confirmPasswordMessage = 'Confirm';
                   this.confirmPasswordMessageStyle = 'color : green';
              }else{
                  this.confirmPasswordMessage = 'Not Matching';
                  this.confirmPasswordMessageStyle = 'color : red';
              }
        }
        
    }

    handleSubmit(){

        //console.log(' this.firstNameVal=='+ this.firstNameVal);
        
        submitRegistration({firstName:this.firstNameVal, 
                            lastName:this.lastNameVal, 
                            phone:this.phoneVal, 
                            email:this.emailVal,
                            dateOfBirth:this.dateOfBirthVal,
                            userName:this.userNameVal,
                            address:this.addressVal,
                            password:this.passwordVal,
                            confirmPassword:this.confirmPasswordVal
                            })
        .then(result =>{
            if(result){
                this.regRecordId=result;
            }
            const toastEvent = new ShowToastEvent({
                title:'Success!',
                message:'Registration created successfully',
                variant:'success'
              });
              this.dispatchEvent(toastEvent);
              //window.location.reload()
        })
        .catch(error=>{
                this.error = error;      
        }) 
     }


}