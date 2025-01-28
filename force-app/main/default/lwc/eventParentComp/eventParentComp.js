import { LightningElement, track } from 'lwc';

export default class EventParentComp extends LightningElement {
    @track evtName;

    handleClickEvent(event){
        this.evtName = 'create';
    }
}