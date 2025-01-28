// googleMapOnAccount.js
import { LightningElement, wire, track } from 'lwc';
import fetchAccounts from '@salesforce/apex/GoogleMapToAccountController.fetchAccounts';

export default class GoogleMapOnAccount extends LightningElement {
   @track error;
    @track mapMarkers = [];
    @track markersTitle = 'Accounts';
    @track zoomLevel = 4;
 
 
    /* Load address from Controller */
    @wire(fetchAccounts, {})
    wireAccount({ error, data }) {
        if (data) {
            data.forEach(dataItem => {
                this.mapMarkers = [...this.mapMarkers,
                {
                    location: {
                        City: dataItem.BillingCity,
                        Country: dataItem.BillingCountry,
                    },
                    icon: 'custom:custom26',
                    title: dataItem.Name,
                }
                ];
            });
            this.error = undefined;
        } else if (error) {
            this.error = error;
        }
    }
}