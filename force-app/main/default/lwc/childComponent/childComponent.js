import { api, LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {

    @api firstName;
    @api lastName;
    @api email;
    @api phone;
}