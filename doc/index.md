<img src="images/openslice_logo.png" alt="drawing" width="200"/>

version: 2020-Q3

*(Documentation is under construction)*

Openslice is a prototype open source, operations support system. It supports VNF/NSD onboarding to OpenSourceMANO (OSM) and NSD deployment management. It also supports TMFORUM OpenAPIs regarding Service Catalog Management, Ordering, Resource, etc.


## Latest news

* 17/2/2020 Openslice will participate in the next ETSI NFV&MEC Plugtests 2020, at Sophia Antipolis, France  15-19 June 2020 as a supporting open source communities . Read more at: <https://www.etsi.org/events/upcoming-events/1683-nfv-mec-plugtests#pane-1/> 

## Demo

* Openslice demo: <http://portal.openslice.io/>
* Openslice Service Catalogs and ordering: <http://portal.openslice.io/services/>
* Openslice NFV Services onboarding: <http://portal.openslice.io/nfvportal>
> username=admin, password=openslice <br> or <br>username=admin, password=changeme


## Video demo

* <https://youtu.be/KU8JPDFFl9A>

---

## Installing

See [Deployment](./deployment.md)

---

## Hardware requirements

The complete environment consists of  microservices deployed as docker containers. Portainer is also installed to monitor them at port 9000

If you would like to operate all APIs, OSOM, the Mysql Server, nginx, etc then you need at least:

- 4 cores
- 8GB RAM
- 5GB HD space

(Note that Bugzilla or ELK are not included and we assume they run elsewhere)

However you can try with a minimum installation on a VM on a laptop with:

- 2 cores
- 4GB of RAM  

 

## Supported APIs

For a quick access check our swagger links:

* TMF APIs: <http://portal.openslice.io/tmf-api/swagger-ui.html>
* API for VNF/NSD management: <http://portal.openslice.io/osapi/swagger-ui.html>

## Source code

Get source code here: <https://github.com/openslice>

## Contributing

[Contributing](./contributing/developing.md)

## Social Media

* Twitter: <https://twitter.com/OpensliceOSS>

## History

* The NFV portal part of Openslice was initially developed in H2020 European project 5GinFIRE (https://5ginfire.eu)  by University of Patras, Greece
* Openslice services, APIs and current version are actively maintained by University of Patras, Greece in H2020 European project 5G-VINNI (https://5g-vinni.eu/)



