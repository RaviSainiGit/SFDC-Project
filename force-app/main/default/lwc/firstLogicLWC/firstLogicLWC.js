import { LightningElement, api, track, wire } from 'lwc';

import mapDemo from '@salesforce/apex/FirstLogicClass.mapDemo';
export default class FirstLogicLWC extends LightningElement {
    @api name = 'Ravi Saini';
    @track message = 'LWC Methodology';
    @track records;
    @track error;
    @track maps;

    @track contacts = [
        {
            Id : "12457896320",
            Name : "Ravi Saini"
        },
        {
            Id : "82457896320",
            Name : "Virat Kolhi"
        },
        {
            Id : "92457896320",
            Name : "Rohit Sharma"
        }
    ];
    @wire(mapDemo)
    wiredData({ error, data }) {
      if (data) {
        this.records = data;
        this.error = undefined;
        //console.log('Data' + this.records);
      } else if (error) {
         this.error = error;
        //console.error('Error:' + this.records);
        this.records = undefined;
      }
    }
    handleClick(){
      mapDemo().then(result=>{
        console.log(result);
        const options = [];
        for(let key in result){
          if(key){
            options.push({
            key:key,
            value:result[key]
          })
          }
        }
        console.log(options);
        this.maps = options;
      })
      .catch(error =>{
        this.error = error;
      });
    }

}