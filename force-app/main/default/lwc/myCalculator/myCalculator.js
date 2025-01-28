import { LightningElement } from 'lwc';
export default class MyCalculator extends LightningElement {

    firstNum;
    secondNum;
    totalSum = 0;

    changeFirstNum(event){
        this.firstNum = event.target.value; 
    }

    changeSecondNum(event){
        this.secondNum = event.target.value;
    }

    addNumbers(){
        this.totalSum = Number(this.firstNum) + Number(this.secondNum);
    }

    subNumbers(){
        this.totalSum = Number(this.firstNum) - Number(this.secondNum);
    }

    multiNumbers(){
        this.totalSum = Number(this.firstNum) * Number(this.secondNum);
    }

    divNumbers(){
        this.totalSum = Number(this.firstNum) / Number(this.secondNum);
    }
    cancelNumbers(){
        this.firstNum = '';
        this.secondNum = '';
        this.totalSum = 0;
    }

}