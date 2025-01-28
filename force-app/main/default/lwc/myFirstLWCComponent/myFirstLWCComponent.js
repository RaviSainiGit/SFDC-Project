import { LightningElement } from 'lwc';
export default class MyFirstLWCComponent extends LightningElement {
    myName;
    myEmail;
    myPhone;
    myAddress;
    myCompanyName;

    changeName(event){
        const Name = event.target.value;
        this.myName = Name;
        console.log(':: Name :: '+Name);
    }
    changeEmail(event){
        const Email = event.target.value;
        this.myEmail = Email;
        console.log(':: Email :: '+Email);
    }
    changePhone(event){
        const Phone = event.target.value;
        this.myPhone = Phone;
        console.log(':: Phone :: '+Phone);
    }
    changeAddress(event){
        const Address = event.target.value;
        this.myAddress = Address;
        console.log(':: Address :: '+Address);
    }
    changeCompanyName(event){
        const companyName = event.target.value;
        this.myCompanyName = companyName;
        console.log(':: companyName :: '+companyName);
    }

}