import { LightningElement } from 'lwc';

export default class ChildPagination extends LightningElement {

    //onclick of previous sending info to parent component
    handlePrevious(event) {
        this.dispatchEvent(new CustomEvent('Previous'))
    }
    handleNext(event) {
        this.dispatchEvent(new CustomEvent('Next'))
    }

}