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
|**Alias** |  CATALOG_ADD_SERVICESPEC  |
|**Name** |  jms:queue:CATALOG.ADD.SERVICESPEC  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | CRIDGE |
|**Body** |  ServiceSpecCreate |
|**Description** |  Creates a ServiceSpecification and  returns a ServiceSpecification as String  |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPD_SERVICESPEC  |
|**Name** |  jms:queue:CATALOG.UPD.SERVICESPEC  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | CRIDGE |
|**Body** |  ServiceSpecUpdate |
|**Headers** | "serviceSpecid" = serviceSpecId|
|**Description** |  Updates a ServiceSpecification and  returns a ServiceSpecification as String.   |
---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPDADD_SERVICESPEC  |
|**Name** |  jms:queue:CATALOG.UPDADD.SERVICESPEC  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | CRIDGE |
|**Body** |  ServiceSpecUpdate |
|**Headers** | "serviceSpecid" = serviceSpecId, "forceId"=forceId |
|**Description** |  Updates a ServiceSpecification and  returns a ServiceSpecification as String. If forceId is true then tries to assign the requested ID to the spec  |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_ADD_SERVICEORDER  |
|**Name** |  jms:queue:CATALOG.ADD.SERVICEORDER  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  ServiceOrderCreate serviceOrder |
|**Headers** |  |
|**Description** | Creates a ServiceOrder and  returns a ServiceOrder as String |

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

---| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICE_BY_ORDERID  |
|**Name** |  jms:queue:CATALOG.GET.SERVICE_BY_ORDERID  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** |  |
|**Body** |  String serviceID |
|**Description** |   returns Service IDs of a specific order given then order id |

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
|**Alias** |  CATALOG_SERVICES_TO_TERMINATE  |
|**Name** |  jms:queue:CATALOG.GET.SERVICETOTERMINATE  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  |
|**Headers** |  |
|**Description** | Get a list of ACTIVE services with END DAte in the past  |
---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_SERVICES_OF_PARTNERS  |
|**Name** |  jms:queue:CATALOG.GET.SERVICESOFPARTNERS  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  |
|**Headers** |  |
|**Description** | Get a list of ACTIVE services from the inventory of partners  |



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




| Message |    |
| ------------- |----------------|
|**Alias** |  NFV_CATALOG_NSACTIONS_SCALE  |
|**Name** |  jms:queue:NSACTIONS.SCALE  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM or maybe used by others that would like scale a NS |
|**Body** | A ScaleDescriptor as json string  |
|**Headers** | none |
|**Description** | performs a scale |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  NFV_CATALOG_NS_LCMCHANGED  |
|**Name** |  NFV_CATALOG_NS_LCMCHANGED  |
|**Type** | topic  |
|**Destination** |   any |
|**Producers** | MANO client |
|**Body** | A json string  |
|**Headers** | none |
|**Description** | A NFV_CATALOG_NS_LCMCHANGED message is published when LCM of a running NS is changed |

---

#ALARMS


| Message |    |
| ------------- |----------------|
|**Alias** |  ALARMS_ADD_ALARM  |
|**Name** |  jms:queue:ALARMS.ADD.ALARM  |
|**Type** | queue  |
|**Publishers** |  |
|**Consumers** | TMF API |
|**Body** |  AlarmCreate   |
|**Headers** | |
|**Description** |   Add an alarm  |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  ALARMS_UPDATE_ALARM  |
|**Name** |  jms:queue:ALARMS.UPDATE.ALARM  |
|**Type** | queue  |
|**Publishers** |  |
|**Consumers** | TMF API |
|**Body** |  AlarmUpdate   |
|**Headers** | alarmid = alarm id, body (AlarmUpdate object) |
|**Description** | Update an alarm |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  ALARMS_GET_ALARM  |
|**Name** |  jms:queue:ALARMS.GET.ALARM  |
|**Type** | queue  |
|**Publishers** |  |
|**Consumers** | TMF API |
|**Body** |     |
|**Headers** | alarmid = alarm id |
|**Description** |   get an alarm |

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

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_ALARM_CREATE  |
|**Name** |  jms:topic:EVENT.ALARM.CREATE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | OAS, BUGZILLA Service, CentralLog Service |
|**Body** |  AlarmCreateEvent |
|**Headers** |  |
|**Description** |   The Event  contains the Alarm object in payload |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_ADD_RESOURCE  |
|**Name** |  jms:queue:CATALOG.ADD.RESOURCE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  ResourceCreate |
|**Headers** |  |
|**Description** |   The Body  contains the ResourceCreate object to add |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPD_RESOURCE  |
|**Name** |  jms:queue:CATALOG.UPD.RESOURCE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  ResourceUpdate |
|**Headers** | resourceid , propagateToSO  |
|**Description** |   The Body  contains the ResourceCreate object to update |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_RESOURCE_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.RESOURCE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  resourceid |
|**Headers** |  |
|**Description** |   The Body  contains the ResourceCreate object to update |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_RESOURCES_OF_PARTNERS  |
|**Name** |  jms:queue:CATALOG.GET.SERVICESOFPARTNERS  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  none |
|**Headers** | none |
|**Description** |   retrieve all active services of partners |

---
| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_ADD_RESOURCESPEC  |
|**Name** |  jms:queue:CATALOG.ADD.RESOURCESPEC  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  ResourceSpecificationCreate |
|**Headers** |  |
|**Description** |   The Body  contains the ResourceSpecificationCreate object to add |

---
| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPD_RESOURCESPEC  |
|**Name** |  jms:queue:CATALOG.UPD.RESOURCESPEC  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  ResourceSpecificationUpdate |
|**Headers** | resourceSpecId  |
|**Description** |   The Body  contains the ResourceSpecificationCreate object to update |


---
| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_RESOURCESPEC_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.RESOURCESPEC_BY_ID  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  resourceSpecid |
|**Headers** |  |
|**Description** |   The Body  contains the object id to find |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPDADD_RESOURCESPEC  |
|**Name** |  jms:queue:CATALOG.UPDADD.RESOURCESPEC  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  resourceid |
|**Headers** |  |
|**Description** |   The Body  contains the ResourceSpecificationCreate object to update or create if not exist |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_RESOURCE_CREATE  |
|**Name** |  jms:topic:EVENT.RESOURCE.CREATE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service, other |
|**Body** |  Notification object.  |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the Resource object |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_RESOURCE_STATE_CHANGED  |
|**Name** |  jms:topic:EVENT.RESOURCE.STATECHANGED  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service, other |
|**Body** |  Notification object.  |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the Resource object |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_RESOURCE_DELETE  |
|**Name** |  jms:topic:EVENT.SERVICE.RESOURCE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service, other |
|**Body** |  Notification object.  |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the Resource object |

---

| Message |    |
| ------------- |----------------|
|**Alias** |  EVENT_RESOURCE_ATTRIBUTE_VALUE_CHANGED  |
|**Name** |  jms:topic:EVENT.RESOURCE.ATTRCHANGED  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | BUGZILLA Service, CentralLog Service, other |
|**Body** |  Notification object.  |
|**Headers** | "eventid"=eventid, "objId"= objId |
|**Description** |   The Event of the Notification object contains the Resource object |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_LCMRULE_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.LCMRULE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |  lcmid |
|**Headers** |  |
|**Description** |   The Body  contains the LCMRuleSpec object  |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_LCMRULES_BY_SPECID_PHASE  |
|**Name** |  jms:queue:CATALOG.GET.LCMRULES_BY_SPECID_PHASE  |
|**Type** | topic  |
|**Publishers** | TMF API |
|**Consumers** | any |
|**Body** |   |
|**Headers** | header.servicespecid, header.phasename |
|**Description** |   The Body  contains the LCMRuleSpec objects of the specific Service Spec and the specific phase  |





| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICETESTSPEC_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.SERVICETESTSPEC_BY_ID  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  specid |
|**Description** | Return a ServiceTestSpecification |

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_ADD_SERVICETEST  |
|**Name** |  jms:queue:CATALOG.ADD.SERVICETEST  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  ServiceTestCreate String json |
|**Headers** | "orderid"=orderid, "serviceTestSpecid"= specid |
|**Description** |   Creates Service Test based an a Service Test Spec, Returns a ServiceTest object |

---





| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_UPD_SERVICETEST  |
|**Name** |  jms:queue:CATALOG.UPD.SERVICETEST  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | |
|**Body** |  ServiceTestUpdate |
|**Headers** | "serviceid" = serviceId, "propagateToSO" = true/false |
|**Description** |  will update a service test by id and return the service instance. If propagateToSO=true then any service change will be handled by OSOM. This is needed to be controlled in order to avoid update loops|

---


| Message |    |
| ------------- |----------------|
|**Alias** |  CATALOG_GET_SERVICETEST_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.SERVICETEST  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  String serviceID |
|**Description** |   returns a Service TEST instance |


