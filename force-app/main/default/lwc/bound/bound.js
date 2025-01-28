import { LightningElement , track, api} from 'lwc';
import {FlowNavigationNextEvent} from 'lightning/flowSupport';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
  

export default class Bound extends LightningElement {
   
    @api availableActions = [];
    @api accountRecordId;
    
    objectApiName = 'Account';
    field = ['Name','Type','Industry'];
    
    handleSuccess(event) { 
        const evt = new ShowToastEvent({
            title : "Record Update",
            message : "Account record is update successfully",
            variant : "success"
        });
        this.dispatchEvent(evt);
        this.handleGoNext();
    }

    handleGoNext() {
        if(this.availableActions.find(action => action === 'NEXT')) { 
            const navigationNextEvent = new FlowNavigationNextEvent();
            this.dispatchEvent(navigationNextEvent);  
        }  
    }

}