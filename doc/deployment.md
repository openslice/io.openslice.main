## Preparing the environment

Note: See the Kubernetes section, if you would like to deploy Openslice in a Kubernetes cluster

<br>

1 - Backup your previous database if necessary:
```
sudo docker exec amysql /usr/bin/mysqldump -u root --password=letmein ostmfdb > backup_ostmfdb.sql
```

 2 - Install docker

_NOTE:_  Since July 2023 Docker Compose V1 stopped receiving updates. Openslice fully reverted to Compose V2, which is integrated in the Docker installation.


3 - Download environment preparation script
```
wget https://raw.githubusercontent.com/openslice/io.openslice.main/master/compose/deploy.sh
```

4 - Work with main/master branch:

```
sudo ./deploy.sh
```
Alternatively, work with develop or any other branch:

```
sudo ./deploy.sh develop [or replace develop with other branch name]
```

5 - Create configuration specific docker compose file
```
cd io.openslice.main/compose/
sudo cp docker-compose.yaml.configure docker-compose.yaml
```

6 - Configure containers to properly resolve the DNS of your domain

edit /etc/docker/daemon.json and add:

```
{ 
  "dns": ["8.8.8.8", "8.8.4.4"]
}
```

and restart docker daemon.

<br>

##Configure docker-compose services

<br>

Edit your configuration specific docker-compose.yaml that is previously created:



###1. mysql-portal container 

In folder mysql-init edit the file 01-databases.sql. Edit the credentials that services connect to the database (if you wish) of portaluser (default is 12345) and keycloak (default is password).

delete the exposed ports

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

Edit the following if you changed mysql and keycloak credentials and adjust properly the domain (replace everywhere the http://keycloak:8080)

```
SPRING_APPLICATION_JSON: '{
        "spring.datasource.url": "jdbc:mysql://amysql/osdb?createDatabaseIfNotExist=true",
        "spring.datasource.username":"root",
        "spring.datasource.password":"letmein",
        "spring-addons.issuers[0].uri": "http://portal.openslice.io/auth/realms/openslice",
        "spring-addons.issuers[0].username-json-path":"$.preferred_username",
        "spring-addons.issuers[0].claims[0].jsonPath":"$.realm_access.roles",
        "spring-addons.issuers[0].claims[1].jsonPath":"$.resource_access.*.roles",
        "spring.security.oauth2.resourceserver.jwt.issuer-uri": "http://portal.openslice.io/auth/realms/openslice",
        "springdoc.oAuthFlow.authorizationUrl": "http://portal.openslice.io/auth/realms/openslice/protocol/openid-connect/auth",
        "springdoc.oAuthFlow.tokenUrl": "http://portal.openslice.io/auth/realms/openslice/protocol/openid-connect/token",
        "springdoc.oauth.client-id" : "osapiWebClientId",
        "springdoc.oauth.clientsecret" : "secret",
        "spring.activemq.brokerUrl": "tcp://anartemis:61616?jms.watchTopicAdvisories=false",
        "spring.activemq.user": "artemis",
        "spring.activemq.password": "artemis",
        "logging.level.org.springframework" : "INFO"


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


Also in the 'Main Site Operations' product please create a version named 'unspecified'


###5.osscapi container (TMF-API service)

Edit the following if you changed mysql and keycloak credentials

```
"spring.datasource.username":"xx",
"spring.datasource.password":"xx",
"keycloak-admin-password": "Pa55w0rd",
Edit properly with your domain "swagger.authserver" : "http://localhost/auth/realms/openslice",

```

delete the exposed ports in other services like activemq

##Configure nginx

```
cd nginx
sudo cp nginx.conf.default nginx.conf
```
Edit server_name


##Configure Web UI

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

##Configure TMF Web UI

There are 3 files available for configuration:

* config.prod.json (Basic information + API configuration)
* theming.scss (CSS color palette theming)
* config.theming.json (HTML configuration - Logo, Favicon, Footer)


The first 2 files above (i.e. config.prod.json, theming.scss) are essential for the successful deployment of Openslice, thus created automatically during the initial deployment at **io.openslice.tmf.web/src/assets/config** directory as a copy of the default ones from the remote repository.

<br>

Ensure that you check the **config.prod.json** file and readjust to your deployment if needed. 

```
cd io.openslice.tmf.web/src/assets/config
```
and edit config.prod.json

E.g. Edit "TITLE" or "WIKI" property with your domain title 

```
TITLE: 'Openslice',
WIKI: 'https://openslice.io',
```

_NOTE:_  The {BASEURL} placeholder in the file automatically detects the Origin (Protocol://Domain:Port) of the deployment and applies it to every respective property. E.g. If you are attempting a local deployment of Openslice, then {BASEURL} is automatically translated to "http://localhost". Similarly, you may use {BASEURL} to translate to a public deployment configuration, e.g. "https://portal.openslice.io".

<br>

If further customization, apart from the default provided, is needed for branding (Logo, Footer) then **config.theming.json** needs to be created in **io.openslice.tmf.web/src/assets/config** directory, as follows:

```
cd io.openslice.tmf.web/src/assets/config
sudo cp config.theming.default.json config.theming.json
```

<br>

> **_IMPORTANT NOTE:_**  If you want to apply changes to the JSON configuration files without the need to rebuild the application, you have to apply the changes at the **io.openslice.tmf.web/dist/io-openslice-portal-web/assets/config** directory. Although, it is <u>mandatory</u> to also apply these changes to the **io.openslice.tmf.web/src/assets/config** for <u>persistancy</u>, as after any future rebuild of Openslice the **/dist** directory is being ovewritten along with its contents. The Openslice team strongly recommends to always apply your changes to the TMF web UI configuration files at **io.openslice.tmf.web/src/assets/config** and rebuild the application.

<br>


## Deploying docker compose




Go to compose directory and issue then:
```
sudo docker compose --profile prod down;sudo docker compose --profile prod up -d  --build
```

Note: depending on your machine, this process might take time. 



## Validating deployments and container monitoring

You can monitor containers status with portainer at port 9000 (http://your-ip:9000)

At first time at portainer use to monitor the Local machine.

Please check that all containers are in running state.



#Kubernetes installation


Openslice can be installed in a Kubernetes cluster. (This is a work in progress)

The related scripts are inside the kubernetes folder. Follow these steps along the lines. You need to configure the ingress properly depending on how you want to expose Openslice. 

1) Create an openslice namespace

```
kubectl create namespace openslice
```

2) Apply or create an ingress. Igress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. Traffic routing is controlled by rules defined on the Ingress resource.
An Ingress may be configured to give Services externally-reachable URLs, load balance traffic, terminate SSL / TLS, and offer name-based virtual hosting. An Ingress controller is responsible for fulfilling the Ingress, usually with a load balancer, though it may also configure your edge router or additional frontends to help handle the traffic. You must have an Ingress controller to satisfy an Ingress.
You may need to deploy an Ingress controller such as ingress-nginx.
 
You can also adapt it to connect to public cloud load balancers depending on your needs.

The following will expose an ingress resource from one of your a k8s nodes on port 80

```
 kubectl apply -f openslice-ingress.yaml
```


Finding the ingress IP:


```

kubectl describe -f openslice-ingress.yaml


Name:             openslice-ingress
Namespace:        openslice
Address:          10.10.10.35
Default backend:  default-http-backend:80 (<error: endpoints "default-http-backend" not found>)
Rules:
  Host        Path  Backends
  ----        ----  --------
  *
              /services   tmfweb:80 (<error: endpoints "tmfweb" not found>)
              /tmf-api    osscapi:13082 (<error: endpoints "osscapi" not found>)
              /auth       keycloak:8080 (<error: endpoints "keycloak" not found>)
              /osapi      osportalapi:13000 (<error: endpoints "osportalapi" not found>)
              /           portalweb:80 (<error: endpoints "portalweb" not found>)
Annotations:  kubernetes.io/ingress.class: nginx
Events:
  Type    Reason  Age                    From                      Message
  ----    ------  ----                   ----                      -------
  Normal  Sync    9m29s (x2 over 9m58s)  nginx-ingress-controller  Scheduled for sync
  
```

From the above example, our exposed ingress is at Address: 10.10.10.35

3) We need to configure the expose address and deploy openslice (IP or URL e.g. http://myopenslice.xxx)

```
./k8sdeploy.sh 10.10.10.35
```


4) Check the status of Openslice  in the cluster. Should be similar to the following:

```

kubectl get pods --namespace=openslice  -o wide

NAME                               READY   STATUS    RESTARTS   AGE    IP               NODE     NOMINATED NODE   READINESS GATES
activemq-59d4bfdb4b-bvjqr          1/1     Running   0          109s   192.168.43.97    kc-2     <none>           <none>
bugzilla-client-7dd7cb47cb-8qb8m   1/1     Running   0          100s   192.168.12.114   kc-3     <none>           <none>
centrallog-95bbf7867-k8fpt         1/1     Running   0          100s   192.168.12.107   kc-3     <none>           <none>
consul-b5dd76b76-64dzk             1/1     Running   0          107s   192.168.43.90    kc-2     <none>           <none>
keycloak-7c5b6bbc95-k2qfl          1/1     Running   0          105s   192.168.12.106   kc-3     <none>           <none>
manoclient-95f68f4c9-c9t6r         1/1     Running   0          104s   192.168.12.113   kc-3     <none>           <none>
mysql-portal-0                     1/1     Running   0          107s   192.168.43.99    kc-2     <none>           <none>
osom-6d548cf555-q8ptj              1/1     Running   0          104s   192.168.43.93    kc-2     <none>           <none>
osportalapi-5fff744db8-5g4zs       1/1     Running   0          103s   192.168.43.98    kc-2     <none>           <none>
osscapi-6d68b54d97-jn8tz           0/1     Running   0          102s   192.168.12.104   kc-3     <none>           <none>
portalweb-8469d57df4-94tfj         1/1     Running   0          101s   192.168.48.44    kc-nfs   <none>           <none>
tmfweb-868f7bb9c5-x4lfh            1/1     Running   0          102s   192.168.48.43    kc-nfs   <none>           <none>


kubectl get deployments  --namespace=openslice  -o wide

NAME              READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS            IMAGES                                      SELECTOR
activemq          1/1     1            1           2m15s   anactivemq            webcenter/activemq:5.14.3                   io.openslice.service=activemq
bugzilla-client   1/1     1            1           2m6s    bugzilla-client       openslice/io.openslice.bugzilla:latest      io.openslice.service=bugzilla-client
centrallog        1/1     1            1           2m6s    centrallog            openslice/io.openslice.centrallog.service   io.openslice.service=centrallog
consul            1/1     1            1           2m13s   aconsul               consul                                      io.openslice.service=consul
keycloak          1/1     1            1           2m11s   keycloak              quay.io/keycloak/keycloak:11.0.3            io.openslice.service=keycloak
manoclient        1/1     1            1           2m10s   manoclient            openslice/io.openslice.mano:latest          io.openslice.service=manoclient
osom              1/1     1            1           2m10s   openslice-osom        openslice/io.openslice.osom:latest          io.openslice.service=osom
osportalapi       1/1     1            1           2m9s    openslice-portalapi   openslice/io.openslice.portal.api:latest    io.openslice.service=osportalapi
osscapi           1/1     1            1           2m8s    openslice-scapi       openslice/io.openslice.tmf.api:latest       io.openslice.service=osscapi
portalweb         1/1     1            1           2m7s    openslice-portalweb   openslice/io.openslice.portal.web:latest    io.openslice.service=portalweb
tmfweb            1/1     1            1           2m8s    openslice-tmfweb      openslice/io.openslice.tmf.web:latest       io.openslice.service=tmfweb


kubectl get services  --namespace=openslice  -o wide

NAME              TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)              AGE     SELECTOR
activemq          ClusterIP   10.111.160.120   <none>        8161/TCP,61616/TCP   2m22s   io.openslice.service=activemq
bugzilla-client   ClusterIP   10.101.43.28     <none>        13010/TCP            2m14s   io.openslice.service=bugzilla-client
centrallog        ClusterIP   10.109.15.151    <none>        13013/TCP            2m14s   io.openslice.service=centrallog
consul            ClusterIP   10.101.103.240   <none>        8500/TCP,8600/TCP    2m21s   io.openslice.service=consul
keycloak          ClusterIP   10.110.216.62    <none>        8080/TCP,8443/TCP    2m19s   io.openslice.service=keycloak
manoclient        ClusterIP   10.108.112.84    <none>        13011/TCP            2m18s   io.openslice.service=manoclient
mysql-portal      ClusterIP   None             <none>        3306/TCP             2m19s   io.openslice.service=mysql-portal
osom              ClusterIP   10.105.173.85    <none>        13100/TCP            2m18s   io.openslice.service=osom
osportalapi       ClusterIP   10.104.121.164   <none>        13000/TCP            2m17s   io.openslice.service=osportalapi
osscapi           ClusterIP   10.108.6.161     <none>        13082/TCP            2m16s   io.openslice.service=osscapi
portalweb         ClusterIP   10.97.126.98     <none>        80/TCP               2m15s   io.openslice.service=portalweb
tmfweb            ClusterIP   10.98.56.82      <none>        80/TCP               2m15s   io.openslice.service=tmfweb

```


#Post installation steps 


## Configure Keycloak server

Keycloack server is managing authentications and running on your host at port 28080 and proxied form nginx under http://localhost/auth.

Go to http://domain.com/auth/ or https://domain.com/auth/ , (http://ipaddress:28080/auth/ or https://ipaddress:28443/auth/ are direct with no proxy) 

and go to Administration Console 


NOTE: if you are running in HTTP you will get a message: HTTPS required

Go to https://ipaddress:28443/auth/

Login with the credentials from section 2.2

user admin and your KEYCLOAK_PASSWORD

Select the master realm from top left corner, go to login Tab and select "Require SSL": None
Do the same for realm Openslice

NOTE: If you run in https the leave Require SSL to external requests


### Configure redirects

Go to realm Openslice, client, osapiWebClientId and change Root URL to your domain 
and insert in Valid Redirect URIs your domain e.g. http://exampl.org/*
an in Web Origins

### Configure email in Keycloak

Keycloak also allows new users to register  On Tab Login-> check for example User registration, Verify email, Forgot password etc.

Also, enter the details on Realm->Email->Enable Authentication


### add an openslice admin user

Go to manage/users and add an admin user, e.g. username=admin . Set a password and go also to Role Mappings and add to Assigned Roles ADMIN and MENTOR.



## Note about admin accounts

Please don't confuse the Keycloak administrator account with the admin account of Openslice service

In real Openslice under Users, please check that a user admin is created and in Role Mappings check assigned Roles ADMIN and MENTOR

##Landing page

You can configure it at

```
io.openslice.portal.web/src/openslicehome/index.html
```

## NFV Orchestrator Configuration

See [NFV Orchestrator Configuration](./nfvoconfig.md) )

##Note

There is a case where the first time the services fail to start due to failed mysql connections. Please just issue again:

`sudo docker compose --profile prod down;sudo docker compose --profile prod up -d  --build`

