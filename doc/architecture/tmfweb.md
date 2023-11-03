# Openslice TMF Web Portal

Openslice comprises of a [web landing page](http://portal.openslice.io/) that navigates to the respective TMF Portal.

- [Services Portal](http://portal.openslice.io/services)
- [Products Portal](http://portal.openslice.io/products)
- [Testing Portal](http://portal.openslice.io/testing)
- [Resources Portal](http://portal.openslice.io/resources)

The landing page and the TMF portals (Services, Products, Testing, Resources) are written in Angular and are maintained under the same Angular project.

Following you may find the scope each portal focuses on and the main TMF APIs it supports.

**Services Portal** is a designated portal for the:
- Service Designer - To design Customer Facing Services as bundles of Resource Facing Services that map to specific Resourses (e.g. NFV, Testing, General Resources). Then, it is charged with the designed Services' exposure to public Service Catalogs.
- Service Customer - To browse the public Service Catalogs and order the offered Services. The fulfilment process of the Service Order is also captured and the final deployed Services are exposed to the Customer.

**Products Portal** is a designated portal for the:
- Product Designer - To design Products as bundles of available Services. Then, it is charged with the designed Products' exposure to public Product Catalogs.
- Product Customer - To browse the public Product Catalogs and navigate to the respective offered Services.

**Testing Portal** is a designated portal for the:
- Testing Designer - To design Tests and provide the testing scripts as attachments to the latter. The Tests can be imported as Services at the Services Portal, and can be included in a Service Bundle.

**Resources Portal** is a designated portal for the:
- Resource Administrator - To view the available Resources that are being synchronized from the underlying infrastructure.




|                     | TMF620 | TMF632 | TMF633 | TMF634 | TMF638 | TMF639 | TMF640 | TMF641 | TMF642 | TMF653 | TMF685 | 
| -------------       |:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
|**Services Portal**  |        |x       |x       |        |x       |        |x       |x       |x       |        |        |
|**Products Portal**  |x       |x       |        |        |        |        |        |        |        |        |        |
|**Testing Portal**   |        |x       |        |        |        |        |        |        |        |x       |        |
|**Resources Portal** |        |x       |        |x       |        |x       |        |        |        |        |x       |


From the landing page, the user can also navigate towards the NFV portal. See [NFV WEB](./nfvweb.md).