# Architecture


Openslice offers the following main functionalities:

* Service Catalog Management: A CSP will have the ability to manage the Service Catalog Items, their attributes , organize in categories and decide what to make available to Customers
* Services Specifications: A CSP will be able to manage Service Specifications
* Service Catalog Exposure: A CSP will be able to expose catalog to customers and related parties
* Service Catalog to Service Catalog: Openslice able to consume and provide Service Catalog items to other catalogs
* Service Order: The Customer will be able to place a Service Order
* Service Inventory: The Customer and Provider will be able to view deployed Services status


The following figure displays the overall architecture of Openslice.

[![Openslice  architecture](../images/architecture.png)](../images/architecture.png)


Openslice allows Vertical Customers browsing the available offered service specifications. It consists of:

* a web frontend for the Service Catalog, Ordering and Service Inventory
* a web frontend for onboarding VNFs and NSDs
* an API gateway that will be used by the web front end as well as any other 3rd party service
* an authentication server
* TMF API services (eg Service Catalog API, Service Ordering APIetc)
* NFV API services (eg VNF/NSD onboarding etc)
* an Issue management system
* Central logging
* Openslice Service Orchestration and Order Management (OSOM) solution that  transforms Service Ordering requests to the equivalent Orchestrators. 
* a Message bus which allows openslice services to exchange messages via queues and topics
