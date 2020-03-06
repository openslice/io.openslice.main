# Consuming Services From External Partner Organizations

In Openslice we can consume services from 3rd parties via Open APIs.

We use the TMF 632 Party Management model to specify Organizations that we can exchange items and other information such as:

- Import Service Specifications
- Create a Service Order
- Use the Service Inventory to query the status of the service ordered to the external partner organization

## Define an Organization as 3rd party to consume services East-West 

An organization must have a characteristic in openslice catalog:

- Name:  partyCharacteristicItem.setName("EXTERNAL_TMFAPI");

With a value a hashmap with the following: 

apiparams.put( "CLIENTREGISTRATIONID", "authOpensliceProvider");
apiparams.put( "OAUTH2CLIENTID", "osapiWebClientId");
apiparams.put( "OAUTH2CLIENTSECRET", "secret");
apiparams.put( "OAUTH2SCOPES", scopes);
apiparams.put( "OAUTH2TOKENURI", "http://portal.openslice.io/osapi-oauth-server/oauth/token");
apiparams.put( "USERNAME", "admin");
apiparams.put( "PASSWORD", "openslice");
apiparams.put( "BASEURL", "http://portal.openslice.io");
		
		
An Organization defined example in json:
```

  {
    "uuid": "3233a5e2-5049-4151-88b6-302ff5b9c5b2",
    "@baseType": "BaseEntity",
    "name": "TESTA",
    "id": "3233a5e2-5049-4151-88b6-302ff5b9c5b2",
    "contactMedium": [],
    "creditRating": [],
    "externalReference": [],
    "organizationChildRelationship": [],
    "organizationIdentification": [],
    "otherName": [],
    "partyCharacteristic": [
      {
        "@baseType": "BaseEntity",
        "name": "EXTERNAL_TMFAPI",
        "value": {
          "value": "{\"OAUTH2CLIENTSECRET\":\"secret\",\"OAUTH2TOKENURI\":\"http://portal.openslice.io/osapi-oauth-server/oauth/token\",\"OAUTH2SCOPES\":[\"admin\",\"read\"],\"PASSWORD\":\"openslice\",\"BASEURL\":\"http://portal.openslice.io\",\"USERNAME\":\"admin\",\"CLIENTREGISTRATIONID\":\"authOpensliceProvider\",\"OAUTH2CLIENTID\":\"osapiWebClientId\"}"
        }
      }
    ],
    "relatedParty": [],
    "taxExemptionCertificate": []
  }

```
		