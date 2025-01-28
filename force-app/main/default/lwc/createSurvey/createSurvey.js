import { LightningElement, track } from 'lwc';
import createSurveyRecord from '@salesforce/apex/SurveyController.createSurveyRecord';

export default class CreateSurvey extends LightningElement {
    @track step = 1;
    @track surveyName;
    @track surveyHeader;
    @track surveyQuestion;
    @track thankYouText;

    handleNameChange(event) {
        this.surveyName = event.target.value;
    }

    handleURLChange(event) {
        this.surveyHeader = event.target.value;
    }

    handleQuestionChange(event) {
        this.surveyQuestion = event.target.value;
    }

    handleThankYouTextChange(event) {
        this.thankYouText = event.target.value;
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

    get isStep4() {
        return this.step === 4;
    }

    handleCreateSurvey() {
        createSurveyRecord({
            surveyName: this.surveyName,
            surveyHeader: this.surveyHeader,
            surveyQuestion: this.surveyQuestion,
            thankYouText: this.thankYouText
        })
        .then(result => {
            // Reset input fields after successful insertion
            this.surveyName = '';
            this.surveyHeader = '';
            this.surveyQuestion = '';
            this.thankYouText = '';
            // Display success message to user
            this.showToast('Success', 'Survey created successfully', 'success');
            // Reset step to 1
            this.step = 1;
        })
        .catch(error => {
            console.error('Error creating survey:', error);
            // Display error message to user
            this.showToast('Error', 'Failed to create survey', 'error');
        });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(event);
    }
}