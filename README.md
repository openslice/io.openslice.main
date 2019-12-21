# io.openslice.main
Main parent project used to install openslice

##Installation

Install docker  
Install docker-compose

```
download https://raw.githubusercontent.com/openslice/io.openslice.main/master/compose/deploy.sh
sudo ./deploy.sh
cd io.openslice.main/compose/
sudo cp docker-compose.yaml.configure docker-compose.yaml
```

##Configure docker-compose services
Edit docker-compose.yaml

###mysql-portal container 
Edit credentials if you wish

###osoauthserver container
Edit the following if you changed mysql credentials 
 
```
"spring.datasource.username":"xx",
"spring.datasource.password":"xx",
```
Edit properly with your domain: "allowOrigins": [ "http://localhost" ]

Edit properly with your domain section: "redirectUris":

###osportalapi container
Edit the following if you changed mysql credentials

```
"spring.datasource.username":"xx",
"spring.datasource.password":"xx",
Edit properly with your domain "swagger.authserver" : "http://localhost:13081/osapi-oauth-server",
Edit properly with your domain "swagger.clientid" : "osapiWebClientId",
Edit properly with your domain "swagger.clientsecret" : "secret",
```

###bugzilla container
If you would like to use the Buzilla connector

```
"bugzillaurl":"bugzillaurl.xx:443/bugzilla/",
"bugzillakey":"exampleKeyeqNNwxBlgxZgMEIne0Oeq0Bz",
"main_operations_product":"Main Site Operations" //this is the default product to issue tickets
```

Bugzilla under this product should have components:  
NSD Deployment Request:Component used to schedule deployment req  
Onboarding:Issues related to VNF/NSD Onboarding  
Operations Support:Default component for operations support  
Validation:Use to track validation processes of VNFs and NSDs  
VPN Credentials/Access:Used for requesting VPN Credentials/Access   


##Configure nginx
```
cd nginc
sudo cp nginx.conf.default nginx.conf
```
Edit server_name


##Configure web ui
`cd io.openslice.portal.web/src/js/  `
`cp config.js.default config.js  `

edit in config.js  
```
TITLE: "Openslice demo",
WIKI: "http://localhost",
BUGZILLA: "https://localhost/bugzilla/",
STATUS: "http://status.localhost/",
APIURL: "http://localhost",
WEBURL: "http://localhost",
APIOAUTHURL: "http://localhost/osapi-oauth-server",
APITMFURL: "http://localhost/tmf-api/serviceCatalogManagement/v4"

```

##Configure TMF web ui
```
cd io.openslice.tmf.web/dist/io-openslice-portal-web/assets/config
sudo cp config.prod.default.json config.prod.json
```
and edit config.prod.json


issue then:
`sudo docker-compose down;sudo docker-compose up -d --build`


