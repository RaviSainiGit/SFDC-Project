import { LightningElement } from 'lwc';
import loginPage from '@salesforce/apex/loginController.loginPage';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LoginFrom extends LightningElement {

    userNameVal;
    regRecordId;
    passwordVal;
    

    loginHandleChange(event){
        //alert(event.target.name);
        if(event.target.name == 'userName'){
            this.userNameVal = event.target.value;  
        }

        if(event.target.name == 'Password'){
            this.passwordVal = event.target.value;  
        }
        
    }

    handleLogin(){

        //console.log(' this.userNameVal=='+ this.userNameVal);
        
        loginPage({ 
            userName:this.userNameVal, 
            password:this.passwordVal
            })
        .then(result =>{
            if(result){
                const toastEvent = new ShowToastEvent({
                title:'Success!',
                message:'Login created successfully',
                variant:'success'
              });
              this.dispatchEvent(toastEvent);
            }
            
              //window.location.reload()
        })
        .catch(error=>{
            const toastEvent = new ShowToastEvent({
                title:'Error!',
                message: error.body.message,
                variant:'error'
              });
              this.dispatchEvent(toastEvent);
                //this.error = error;      
        }) 
     }

}