# Message Bus and exchanged Messages

Openslice has a Message bus which allows Openslice services to exchange messages via queues and topics.

It is based on ActiveMQ.

3rd party services can be attached to bus and subscribe to message topics or request resources via queues.


## QUEUE MESSAGES  

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICEORDERS  |
|**Name** |  jms:queue:CATALOG.GET.SERVICEORDERS  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |   |
|**Description** | Return a List<ServiceOrder> as String Json|

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICEORDER_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.SERVICEORDER_BY_ID  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  String orderid  |
|**Description** |   Return a ServiceOrder as String Json |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPD_SERVICEORDER_BY_ID  |
|**Name** |  jms:queue:CATALOG.UPD.SERVICEORDER_BY_ID  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  ServiceOrderUpdate serviceOrder |
|**Headers** | "orderid"= orderid |
|**Description** |   Returns a ServiceOrder as String |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICESPEC_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.SERVICESPEC_BY_ID  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  specid |
|**Description** | Return a ServiceSpecification |

---



| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_INITIAL_SERVICEORDERS_IDS  |
|**Name** |  jms:queue:CATALOG.GET.INITIAL_SERVICEORDERS  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** |  |
|**Body** |   |
|**Description** | Return a List<ServiceOrder> as String Json|

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICEORDER_IDS_BY_STATE  |
|**Name** |  jms:queue:CATALOG.GET.ACKNOWLEDGED_SERVICEORDERS  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |   |
|**Headers** | "orderstate"= orderState |
|**Description** |  String Json ArrayList of ServiceOrders |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_ADD_SERVICE  |
|**Name** |  jms:queue:CATALOG.ADD.SERVICE  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  ServiceCreate String json |
|**Headers** | "orderid"=orderid, "serviceSpecid"= specid |
|**Description** |   Creates Service based an a Service Spec, Returns a Service object |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPD_SERVICE  |
|**Name** |  jms:queue:CATALOG.UPD.SERVICE  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | |
|**Body** |  ServiceUpdate |
|**Headers** | "serviceid" = serviceId, "propagateToSO" = true/false |
|**Description** |  will update a service by id and return the service instance. If propagateToSO=true then any service change will be handled by OSOM. This is needed to be controlled in order to avoid update loops|

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICE_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.SERVICE  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  String serviceID |
|**Description** |   returns a Service instance |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_SERVICE_QUEUE_ITEMS_GET  |
|**Name** |  jms:queue:CATALOG.SERVICEQUEUEITEMS.GET  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |   |
|**Description** |   returns a LIST OF Service Queue Items |
---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_SERVICE_QUEUE_ITEM_UPD  |
|**Name** |  jms:queue:CATALOG.SERVICEQUEUEITEM.UPDATE  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** | String SERVICEQUEUEITEM |
|**Headers** | "itemid" = SERVICEQUEUEITEM id |
|**Description** |  ill update a service queue item by id and return the instance |
---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_SERVICE_QUEUE_ITEM_DELETE  |
|**Name** |  jms:queue:CATALOG.SERVICEQUEUEITEM.DELETE  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  |
|**Headers** | "itemid" = SERVICEQUEUEITEM id |
|**Description** |  ill delete a service queue item by id  |


---

| Message |    |
| ------------- |----------------|
|**Alias** |  NFV_CATALOG_GET_NSD_BY_ID  |
|**Name** |  jms:queue:NFVCATALOG.GET.NSD_BY_ID  |
|**Type** | queue  |
|**Destination** |   NFV Catalog service |
|**Producers** | TMF API, OSOM |
|**Body** |  NSDid |
|**Description** |   Returns a NetworkServiceDescriptor object |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  NFV_CATALOG_DEPLOY_NSD_REQ  |
|**Name** |  jms:queue:NFVCATALOG.DEPLOY.NSD_REQ  |
|**Type** | queue  |
|**Destination** |   NFV Catalog service |
|**Producers** | OSOM |
|**Body** |  DeploymentDescriptor as Json String |
|**Headers** |  NSD id |
|**Description** |   Returns a DeploymentDescriptor object as json string containing deployment info|

---

| Message |    |
| ------------- |----------------|
|**Alias** |  NFV_CATALOG_UPD_DEPLOYMENT_BY_ID  |
|**Name** |  jms:queue:NFVCATALOG.UPD.DEPLOYMENT_BY_ID  |
|**Type** | queue  |
|**Destination** |   NFV Catalog service |
|**Producers** | OSOM |
|**Body** |  DeploymentDescriptor as Json String |
|**Headers** |  DeploymentDescriptor id |
|**Description** |   Updates and Returns a DeploymentDescriptor object as json string containing deployment info|

---



| Message |    |
| ------------- |----------------|
|**Alias** |  GET_USER_BY_USERNAME  |
|**Name** |  jms:queue:GET.USER_BY_USERNAME  |
|**Type** | queue  |
|**Destination** |   NFV Catalog service (this is temproary for now) |
|**Producers** | TMF API |
|**Body** |  username |
|**Headers** |   |
|**Description** |   Returns a PortalUser object as json string containing user info|

---

| Message |    |
| ------------- |----------------|
|**Alias** |  NFV_CATALOG_GET_DEPLOYMENT_BY_ID  |
|**Name** |  jms:queue:NFVCATALOG.GET.DEPLOYMENT_BY_ID  |
|**Type** | queue  |
|**Destination** |   NFV Catalog service |
|**Producers** |  OSOM |
|**Body** |  Deployment ID |
|**Description** |   Returns a DeploymentDescriptor object |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_EXTERNAL_SERVICE_PARTNERS  |
|**Name** |  jms:queue:CATALOG.GET.EXTERNALSERVICEPARTNERS  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |   |
|**Headers** |  |
|**Description** |  As a String Json ArrayList of Organizaton objects containing the characteristic name **EXTERNAL_TMFAPI** |

---



| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPD_EXTERNAL_SERVICESPEC  |
|**Name** |  jms:queue:CATALOG.UPD.EXTERNAL_SERVICESPEC  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM or maybe used by others that would like to update a Service Spec |
|**Body** | A serviceSpecification as json string  |
|**Headers** | servicespecification id, orgid id |
|**Description** | Updates (or inserts if does not exist in catalog) an external service specification) |

---


## EVENT TOPICS IN Message Bus
| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_CREATE  |
|**Name** |  jms:topic:EVENT.SERVICE.CREATE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | - |
|**Body** |  Notification object |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   xx |

---
| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_STATE_CHANGED  |
|**Name** |  jms:topic:EVENT.SERVICE.STATECHANGED  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | - |
|**Body** |  Notification object |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   xx |

---
| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_DELETE  |
|**Name** |  jms:topic:EVENT.SERVICE.DELETE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | - |
|**Body** |  Notification object. Can be one of ServiceOrderCreateNotification, ServiceOrderStateChangeNotification, ServiceOrderAttributeValueChangeNotification, ServiceOrderDeleteNotification, etc |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   xx |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_ATTRIBUTE_VALUE_CHANGED  |
|**Name** |  jms:topic:EVENT.SERVICE.ATTRCHANGED  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | - |
|**Body** |  Notification object. Can be one of ServiceOrderCreateNotification, ServiceOrderStateChangeNotification, ServiceOrderAttributeValueChangeNotification, ServiceOrderDeleteNotification, etc |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   xx |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_ORDER_CREATE  |
|**Name** |  jms:topic:EVENT.SERVICEORDER.CREATE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service |
|**Body** |  Notification object. Can be one of ServiceOrderCreateNotification, ServiceOrderStateChangeNotification, ServiceOrderAttributeValueChangeNotification, ServiceOrderDeleteNotification, etc |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the ServiceOrder object. Bugzilla service for example uses this to create a new issue |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_ORDER_STATE_CHANGED  |
|**Name** |  jms:topic:EVENT.SERVICEORDER.STATECHANGED  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service |
|**Body** |  Notification object. Can be one of ServiceOrderCreateNotification, ServiceOrderStateChangeNotification, ServiceOrderAttributeValueChangeNotification, ServiceOrderDeleteNotification, etc |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the ServiceOrder object. Bugzilla service for example uses this to update an issue |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_ORDER_DELETE  |
|**Name** |  jms:topic:EVENT.SERVICEORDER.DELETE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service |
|**Body** |  Notification object. Can be one of ServiceOrderCreateNotification, ServiceOrderStateChangeNotification, ServiceOrderAttributeValueChangeNotification, ServiceOrderDeleteNotification, etc |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the ServiceOrder object |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_SERVICE_ORDER_ATTRIBUTE_VALUE_CHANGED  |
|**Name** |  jms:topic:EVENT.SERVICEORDER.ATTRCHANGED  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service |
|**Body** |  Notification object. Can be one of ServiceOrderCreateNotification, ServiceOrderStateChangeNotification, ServiceOrderAttributeValueChangeNotification, ServiceOrderDeleteNotification, etc |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the ServiceOrder object |

---



