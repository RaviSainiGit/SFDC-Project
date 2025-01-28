import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import CUSTOMER_FEEDBACK_OBJECT from '@salesforce/schema/Customer_Feedback__c';
import NAME_FIELD from '@salesforce/schema/Customer_Feedback__c.Name';
import FEEDBACK_FIELD from '@salesforce/schema/Customer_Feedback__c.Feedback__c';

export default class InputGuest extends LightningElement {
    @track nameValue = '';
    @track feedbackValue = '';
    handleNameChange(event) {
        this.nameValue = event.target.value;
    }
    handleFeedbackChange(event) {
        this.feedbackValue = event.target.value;
    }
    async handleSubmit() {
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.nameValue;
        fields[FEEDBACK_FIELD.fieldApiName] = this.feedbackValue;

        try {
            const recordInput = { apiName: CUSTOMER_FEEDBACK_OBJECT.objectApiName, fields };
            const record = await createRecord(recordInput);
            const toastEvent = new ShowToastEvent({
                title: 'Feedback Sent',
                variant: 'success',
            });
            this.dispatchEvent(toastEvent);
            console.log('Feedback record Id:', record.id);
        } catch (error) {
            console.error('Error creating feedback record:', error);
        } finally {
            const toastEvent = new ShowToastEvent({
                title: 'Feedback Sent',
                variant: 'success',
            });
            this.dispatchEvent(toastEvent);
            this.nameValue = '';
            this.feedbackValue = '';

        }
    }
}