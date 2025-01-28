import { LightningElement, track } from 'lwc';


export default class HelloWorld extends LightningElement {
    @track firstNumber;
    @track secondNumber;
    resultValue;

    handleNumberOneChange(event) {
        this.firstNumber = parseInt(event.target.value);
    }
    handleNumberTwoChange(event) {
        this.secondNumber = parseInt(event.target.value);
    }
    addition() {
        this.resultValue = parseInt(this.firstNumber) + parseInt(this.secondNumber);
    }

}