## Preparing the environment

Install docker  
Install docker-compose

```
download https://raw.githubusercontent.com/openslice/io.openslice.main/master/compose/deploy.sh
sudo ./deploy.sh
cd io.openslice.main/compose/
sudo cp docker-compose.yaml.configure docker-compose.yaml
```

Containers need to properly resolve the DNS of your domain

edit /etc/docker/daemon.json and add:

```
{ "dns": ["8.8.8.8", "8.8.4.4"]
 }

```

and restart docker daemon.


##Configure docker-compose services

Edit docker-compose.yaml

###1. mysql-portal container 

In folder mysql-init edit the file 01-databases.sql. Edit the credentials that services connect to the database (if you wish) of portaluser (default is 12345) and keycloak (default is password).


###2.keycloak container

2.1 Edit the following if you changed mysql credentials 
```
DB_DATABASE: keycloak
DB_USER: keycloak
DB_PASSWORD: password
```

2.2 Change the keycloak admin password
``` 
KEYCLOAK_PASSWORD: Pa55w0rd
```

###3.osportalapi container (NFV services)

Edit the following if you changed mysql and keycloak credentials and adjust properly th domain

```
"spring.datasource.username":"xx",
"spring.datasource.password":"xx",
"keycloak-admin-password": "Pa55w0rd",
"keycloak.auth-server-url": "http://localhost:8080/auth"
Edit properly with your domain "swagger.authserver" : "http://localhost:28080/auth/realms/openslice",

```


###4.bugzilla container

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


###5.osscapi container (TMF-API service)

Edit the following if you changed mysql and keycloak credentials

```
"spring.datasource.username":"xx",
"spring.datasource.password":"xx",
"keycloak-admin-password": "Pa55w0rd",
"keycloak.auth-server-url": "http://localhost:28080/auth",
Edit properly with your domain "swagger.authserver" : "http://localhost:28080/auth/realms/openslice",

```


##Configure nginx

```
cd nginx
sudo cp nginx.conf.default nginx.conf
```
Edit server_name


##Configure web ui

`cd io.openslice.portal.web/src/js/  `
`cp config.js.default config.js  `

edit in config.js  with your domain
```
TITLE: "Openslice demo",
		WIKI: "http://localhost",
		BUGZILLA: "https://localhost/bugzilla/",
		STATUS: "http://status.localhost/",
		APIURL: "http://localhost",
		WEBURL: "http://localhost",
		APIOAUTHURL: "http://localhost/auth/realms/openslice",
		APITMFURL: "http://localhost/tmf-api/serviceCatalogManagement/v4"

```

##Configure TMF web ui
```
cd io.openslice.tmf.web/dist/io-openslice-portal-web/assets/config
sudo cp config.prod.default.json config.prod.json
```
and edit config.prod.json

edit config.oauth.ts with your domain details for example:

```
 issuer: 'http://portal.openslice.io/auth/realms/openslice/protocol/openid-connect/auth',
 loginUrl: 'http://portal.openslice.io/auth/realms/openslice/protocol/openid-connect/auth',
 tokenEndpoint: 'http://portal.openslice.io/auth/realms/openslice/protocol/openid-connect/token',
```



## Deploying docker compose




Go to compose directory and issue then:
`sudo docker-compose down;sudo COMPOSE_HTTP_TIMEOUT=200 docker-compose up -d --build`


Note: depending on your machine, this process might take time. You can monitor containers status with portainer at port 9000 (http://localhost:9000)


## Configure Keycloak server

Keycloack server is managing authentications and running on your host at port 28080 and proxied form nginx under http://localhost/auth.

Go to http://ipaddress:28080/auth/ or https://ipaddress:28443/auth/ 

and go to Administration Console 


NOTE: if you are running in HTTP you will get a message: HTTPS required

Go to https://ipaddress:28443/auth/

Login with the credentials from section 2.2

user admin and your KEYCLOAK_PASSWORD

Select the master realm from top left corner, go to login Tab and select "Require SSL": None
Do the same for realm Openslice


### Configure redirects

Go to realm Openslice, client, osapiWebClientId and change Root URL to your domain 
and insert in Valid Redirect URIs your domain e.g. http://exampl.org/*
an in Web Origins

### Configure email in Keycloak

Keycloak also allows new users to register  On Tab Login-> check for example User registration, Verify email, Forgot password etc.

Also, enter the details on Realm->Email->Enable Authentication



##Landing page

You can configure it at

```
io.openslice.portal.web/src/openslicehome/index.html
```

## NFV Orchestrator Configuration

See [NFV Orchestrator Configuration](./nfvoconfig.md) )

##Note

There is a case where the first time the services fail to start due to failed mysql connections. Please just issue again:

`sudo docker-compose down;sudo docker-compose up -d --build`

