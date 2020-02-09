
# Developing

Openslice backend services are maily implemented with Java 8 and Spring boot.

Openslice uses various subsystems and depending on the module would you like to work, other subsystems must be present (you can disable them thoug in the code, e.g. at application.yml file)

## General subsystems

- Docker and Docker Compose should be installed in your development environment

### Consul
consul service registry should be up and running. You can launch consul with docker: 
`sudo docker run -d --name consul -p 8500:8500 -p 8600:8600 consul`

### ActiveMQ
ActiveMQ is our messaging system. You can launch an instance of ActiveMQ:
`sudo docker run --name='activemq' -d -e 'ACTIVEMQ_NAME=amqp-srv1' -e 'ACTIVEMQ_REMOVE_DEFAULT_ACCOUNT=true' -e 'ACTIVEMQ_ADMIN_LOGIN=admin' -e 'ACTIVEMQ_ADMIN_PASSWORD=admin' -e 'ACTIVEMQ_WRITE_LOGIN=producer_login' -e 'ACTIVEMQ_WRITE_PASSWORD=producer_password' -e 'ACTIVEMQ_READ_LOGIN=consumer_login' -e 'ACTIVEMQ_READ_PASSWORD=consumer_password' -e 'ACTIVEMQ_JMX_LOGIN=jmx_login' -e 'ACTIVEMQ_JMX_PASSWORD=jmx_password' -e 'ACTIVEMQ_STATIC_TOPICS=topic1;topic2;topic3' -e 'ACTIVEMQ_STATIC_QUEUES=queue1;queue2;queue3' -e 'ACTIVEMQ_MIN_MEMORY=1024' -e  'ACTIVEMQ_MAX_MEMORY=4096' -e 'ACTIVEMQ_ENABLED_SCHEDULER=true' -v /home/ctranoris/testcompose/data/activemq:/data/activemq -v /var/log/activemq:/var/log/activemq -p 8161:8161 -p 61616:61616 -p 61613:61613 webcenter/activemq:5.14.3`

### MySQL server
We use mysql as a storage DB. Please make sure that you have it installed in your system. There are instructions on internet how to install it. Check also our docker-compose installation script


## Oauth server

Clone the repository: https://github.com/openslice/io.openslice.oauth.server

Check the application.yml file. Default port is 13081. Especially the datasource username/password, server port.

make sure that the General subsystems are up and running.

run it with `mvn spring-boot:run`

You can check your consul server if it registered. You can browse to `http://localhost:13081/osapi-oauth-server/login`. 
A default account is user: admin, password: changeme


## VNF/NSD Catalog Management and NSD Deployment API service 

Clone the repository: https://github.com/openslice/io.openslice.portal.api

Check the application.yml file. Default port is 13080. Especially the datasource username/password, server port.

make sure that the General subsystems are up and running as well as the OAuth server

run it with `mvn spring-boot:run`

You can check your consul server if it registered. 

### Swagger API
Swagger API of the service is at `http://localhost:13000/osapi/swagger-ui.html`. You can try there various REST actions and authenticate via the OAuth server


## VNF/NSD Catalog Management and NSD Deployment WEB UI service 

The Web UI is written in AngularJS

Clone the repository: https://github.com/openslice/io.openslice.portal.web

by default the project io.openslice.portal.api exposes the folder ../io.openslice.portal.web/src/ in a folder testweb (Check class MvcConfig.java in io.openslice.portal.api) for development. (In production nginx is used). Point your browser to `http://localhost:13000/osapi/testweb/index.html/`


---

## Wishlist

Check also our wishlist of new features. You can add your own

See [Wishlist](./wishlist.md)








