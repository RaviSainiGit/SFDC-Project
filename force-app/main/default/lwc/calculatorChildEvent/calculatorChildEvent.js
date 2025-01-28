import { LightningElement, track } from 'lwc';
export default class CalculatorChildEvent extends LightningElement {

    @track input = '';

    handleButtonClick(event) {
        const value = event.target.dataset.value;
        this.input += value;
    }

    handleCalculate() {
        // Fire a custom event to send the input data to the parent component
        const calculateEvent = new CustomEvent('calculate', {
            detail: this.input
        });
        this.dispatchEvent(calculateEvent);
    }

}