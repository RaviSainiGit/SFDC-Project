import { LightningElement, track } from 'lwc';
export default class CalculatorParentEvent extends LightningElement {

    @track result = '';

    handleCalculate(event) {
        const input = event.detail;
        try {
            // Evaluate the input string to calculate the result
            this.result = eval(input);
        } catch (error) {
            this.result = 'Error';
        }
    }

}