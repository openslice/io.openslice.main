<img src="images/openslice_logo.png" alt="drawing" width="200"/>

*(Documentation is under construction)*

Openslice is a prototype open source, operations support system. It supports VNF/NSD onboarding to OpenSourceMANO (OSM) and NSD deployment management. It also supports TMFORUM OpenAPIs regarding Service Catalog Management, Ordering, Resource, etc.


## Demo

* Openslice Service Catalogs and ordering: <http://portal.openslice.io/services/>
* Openslice NFV Services onboarding: <http://portal.openslice.io/>
> username=admin, password=openslice <br> or <br>username=admin, password=changeme

---

## Installing

See [Deployment](./deployment.md)

---

## Hardware requirements

The complete environment consists of 10 microservices deployed as docker containers. (Note that Bugzilla or ELK are not included and we assume they runs elsewhere)

If you would like to operate all APIs, OSOM, the Mysql Server, nginx, etc then you need at least:

- 4 cores
- 8GB RAM
- 5GB HD space

However you can try with a minimun installation on a VM on a laptop with:

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