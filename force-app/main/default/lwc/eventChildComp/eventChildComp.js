import { LightningElement } from 'lwc';

export default class EventChildComp extends LightningElement {
    test = 'Cust event';

    btnHandler(event){
        this.dispatchEvent(new CustomEvent("create"));
    }
}