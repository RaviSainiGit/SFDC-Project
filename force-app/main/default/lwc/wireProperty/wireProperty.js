import { LightningElement, wire } from 'lwc';

import getAccountList from '@salesforce/apex/AccountWireHelper.getAccountList';
//import apexMethodName from '@salesforce/apex/Classname.apexMethodReference';

export default class WireProperty extends LightningElement {

    @wire(getAccountList) accounts;
    //@wire(apexMethodName, { apexMethodParams }) propertyOrFunction;

}