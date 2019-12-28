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
|**Body** |  xx |
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
|**Body** |  xx |
|**Description** |   NOT IMPLEMENTED |

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
|**Alias** |  VNFNSD_CATALOG_GET_NSD_BY_ID  |
|**Name** |  jms:queue:VNFNSDCATALOG.GET.NSD_BY_ID  |
|**Type** | queue  |
|**Destination** |   NFV Catalog service |
|**Producers** | TMF API, OSOM |
|**Body** |  NSDid |
|**Description** |   Returns a NetworkServiceDescriptor object |

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



