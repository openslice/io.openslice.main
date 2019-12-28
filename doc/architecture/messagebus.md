# Message Bus and exchanged Messages

Openslice continas Message bus which allows Openslice services to exchange messages via queues and topics.

It is based on ActiveMQ.

3rd party services can be attached to bus and subscribe to message topics or request resources via queues.


|CATALOG_UPD_SERVICEORDER_BY_ID| "jms:queue:CATALOG.UPD.SERVICEORDER_BY_ID" | queue | TMF API service | OSOM |
|CATALOG_GET_SERVICESPEC_BY_ID| "jms:queue:CATALOG.GET.SERVICESPEC_BY_ID" | queue | TMF API service | OSOM |
|CATALOG_GET_INITIAL_SERVICEORDERS_IDS| "jms:queue:CATALOG.GET.INITIAL_SERVICEORDERS" | queue | TMF API service | OSOM |
|CATALOG_GET_SERVICEORDER_IDS_BY_STATE| "jms:queue:CATALOG.GET.ACKNOWLEDGED_SERVICEORDERS" | queue | TMF API service | OSOM |
|CATALOG_ADD_SERVICE| "jms:queue:CATALOG.ADD.SERVICE" | queue | TMF API service | OSOM |
|CATALOG_UPD_SERVICE| "jms:queue:CATALOG.UPD.SERVICE" | queue | TMF API service | OSOM |
|CATALOG_GET_SERVICE_BY_ID| "jms:queue:CATALOG.GET.SERVICE" | queue | TMF API service | OSOM |


|**Alias** |  CATALOG_GET_SERVICEORDERS  |
|**Name** |  jms:queue:CATALOG.GET.SERVICEORDERS  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  xx |
|**Description** |   xx |


|**Alias** |  CATALOG_GET_SERVICEORDER_BY_ID  |
|**Name** |  jms:queue:CATALOG.GET.SERVICEORDER_BY_ID  |
|**Type** | queue  |
|**Destination** |   TMF API service |
|**Producers** | OSOM |
|**Body** |  xx |
|**Description** |   xx |




