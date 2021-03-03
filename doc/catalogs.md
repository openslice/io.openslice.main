# Catalogs and Templates

The Openslice Service Catalogue (accessible through the API or Services portal) contains the representation of Service Specifications, either created from the provider defining service attributes, or by supporting the GSMA Generic Slice Templates (GST) as well as the VINNI Service Blueprint. The following scenarios are supported by the Openslice Service Catalogue.


## Create/Design a Service Specification

### First Import some Resources as Resource Facing Services (RFSs)

If you have any NSDs as NFV artifacts, import them through the UI menu (Import from NSD list). Then an NSD is imported as a resource and an RFS automatically is created. RFSs then later are used to design a Customer Facing Service Specification
 
### Create/Design a Customer Facing Service Specification

Customer Facing Service Specification are the services offered to customers. 
You can create a new Service Specification from the menu. The services created through the UI are Customer Facing Services (CFS). Usually you create a CFS as a bundle and then you include Service Specification Relationships with RFSs or/and CFSs.

Any Service Specification Characteristics from the RFS are copied to the CFS specification. A CFS can include multiple RFS or/and CFSs.
For example you can create a CFS spec called "A 5G Service" which is a bundle of two other services (include them in Service Specification Relationships) such as 5G eMBB Slice and a Customer VPN. So when the user orders  "A 5G Service"  services from 5G eMBB Slice and a Customer VPN will be created during the order.

### Initial configuration

if you have an initial configuration that needs to be applied in the NSD deployment, then you go to the RFS (or CFS) and in Service Specification Characteristics go and edit the CONFIG characteristic. 
You can add in the Service Characteristic Value, in the Value field something like the following example which gives a floating IP to a VNF:

```
{ "nsdId": "e855be91-567b-45cf-9f86-18653e7ea", "vimAccountId": "4efd8bf4-5292-4634-87b7-7b3d49108" , "vnf": [ {"member-vnf-index": "1", "vdu": [ {"id": "MyCharmedVNF-VM", "interface": [{"name": "eth0", "floating-ip-required": true }]}]}]}
 
```

or a more complex example (beautify it first if you want to view it, but in the parameter CONFIG must be minified like the example):

```
{"nsdId":"e855be91-567b-45cf-9f86-18653e7","vimAccountId":"4efd8bf4-5292-4634-87b7-7b3d491","vnf":[{"member-vnf-index":"1","vdu":[{"id":"haproxy_vdu","interface":[{"name":"haproxy_vdu_eth1","floating-ip-required":true}]}]}],"vld":[{"name":"pub_net","vim-network-name":"OSMFIVE_selfservice01"},{"name":"management","vim-network-name":"OSMFIVE_selfservice01"},{"name":"lba_net","vim-network-name":"lba_net","vnfd-connection-point-ref":[{"member-vnf-index-ref":"1","vnfd-connection-point-ref":"haproxy_private","ip-address":"192.168.28.2"}]},{"name":"backend_net","vim-network-name":"backend_net","vnfd-connection-point-ref":[{"member-vnf-index-ref":"3","vnfd-connection-point-ref":"haproxy_public","ip-address":"192.168.20.2"}]},{"name":"lb_sb_net","vim-network-name":"lb_sb_net","vnfd-connection-point-ref":[{"member-vnf-index-ref":"3","vnfd-connection-point-ref":"haproxy_private","ip-address":"192.168.28.2"}]},{"name":"breaking_point_Spain","vim-network-name":"sb_repo_net"},{"name":"breaking_point_Greece","vim-network-name":"5TONICexternal"}],"additionalParamsForVnf":[{"member-vnf-index":"2","additionalParams":{"target_IP":"192.168.20.2"}},{"member-vnf-index":"4","additionalParams":{"target1_IP":"192.168.21.2","target2_IP":"10.154.252.10"}}]}
```

You can leave the Alias and Unit of Measure as is. Check also the is Default.



### Day 2 Primitive Actions

NFVOs like OSM allow to perform actions while a service is running, for example change attributes or make actions on a specific VNF. To design this do something similar to the following example:

-	Go to the RFS related to the NSD that contains VNFs with primitives
-	create a characteristic named Primitive::<primitive> , e.g. Primitive::touch
-	select Value Type: ARRAY
-	add Service Characteristic Value: i) alias=primitive, value=<primitivename> (e.g. touch), ii)  alias=member_vnf_index, value=<vnf index> (e.g. 1), iii) add the params that the user will change in alias the name of param and in value an initial value (e.g. alias=filename, value=myfile.txt)

In the above example, when the service is running and the user goes to service inventory to MODIFY it, changes the value of the alias=filename, value=myfile.txt, to value =secondfile.txt. Then inside the VNF a file will be created called secondfile.txt



### Generic Slice Templates (GST) 
(Offered only as a design for now. THere is no direct implementation to NFV)
On October 16th 2019 GSMA published NG.116  Version 2.0 which defines the Generic Network Slice Template (GST). GST is a set of attributes that can characterise a type of network slice/service. GST is generic and is not tied to any specific network deployment. Here is a list of the various attributes of the template:

-	Availability
-	Area of Service
-	Delay tolerance
-	Deterministic communication
-	Downlink throughput per network slice
-	Downlink throughput per UE
-	Energy efficiency
-	Group communication support
-	Isolation level
-	Location based message delivery
-	Maximum supported packet size
-	Mission critical support
-	MMTel support
-	NB-IoT support
-	Network Slice Customer network functions
-	Number of connections
-	Number of terminals
-	Performance monitoring
-	Performance prediction
-	Positioning support
-	Radio spectrum
-	Reliability
-	Root cause investigation
-	Session and Service Continuity support 
-	Simultaneous use of the network slice
-	Slice quality of service parameters
-	Support for non-IP traffic 
-	Supported access technologies 
-	Supported device velocity 
-	Synchronicity
-	Terminal density 
-	Uplink throughput per network slice 
-	Uplink throughput per UE
-	User management openness
-	User data access 
-	V2X communication mode

Openslice offers the GST in a format that is machine readable and aligned with the TMF SID model. Here is a tentative approach in JSON : <https://github.com/openslice/io.openslice.tmf.api/blob/master/src/main/resources/gst.json>

Providers can clone a GST as e NEST directly in Openslice Web portal and the adjust the default attributes to their Service Specification


### 5G-VINNI Service Blueprint
(Offered only as a design for now. THere is no direct implementation to NFV)
5G-VINNI Service Blueprint is a special Service Specification defined by teh 5G-VINNI project. Many details can be found in document <https://zenodo.org/record/3345612>

5G-VINNI Service Blueprint is a reusable self-contained specification of required network slice service (instances). As described in GST mapping VINNI-SB is also machine readable. 

Here is a tentative approach in JSON : <https://github.com/openslice/io.openslice.tmf.api/tree/master/src/main/resources/vinnisb>

5G-VINNI SB has many commonalities with GST as well as it offers Testing as a Service attributes.

 Next figure presents the high-level object model of a 5G-VINNI service blueprint.
 
The 5G-VINNI SB as a first prototype approach is conceived as a CFS of a ‘bundle’ of services. It has some characteristics, like name, description, service type (eMBB, etc) and others. The constituent services are:

- A “Service Topology” Service Specification which is related to a Network Service Resource topology (a Logical Resource Spec). It is considered at this stage as an RFS but is subject to change in future
- A “VINNI SB Service Requirements” Service Specification which is related to Service requirements. This is very similar to GST. It is considered at this stage a CFS.
- A “VINNI SB Service Exposure Level 1” Service Specification which contains characteristics for service exposure on level 1 ( see D3.1 for details). It is considered at this stage a CFS.
- A “VINNI SB Service Exposure Level 2” Service Specification which contains characteristics for service exposure on level 2. It is considered at this stage a CFS.
- A “VINNI SB Service Exposure Level 3” Service Specification which contains characteristics for service exposure on level 3. It is considered at this stage a CFS.
- A “VINNI SB Service Exposure Level 4” Service Specification which contains characteristics for service exposure on level 4. It is considered at this stage a CFS.
- A “VINNI SB Service 3rd part VNF” Service Specification which contains characteristics for support 3rd party VNFs to be included in the service. It is considered at this stage as an RFS but is subject to change in future
- A “VINNI SB Service 3rd part NSD” Service Specification which contains characteristics for support 3rd party NSDs to be included in the service. It is considered at this stage as an RFS but is subject to change in future
- A “VINNI SB Service Monitoring” Service Specification which contains characteristics for offering Monitoring capabilities on the requested Service. It is considered at this stage a CFS.
- A “VINNI SB Service Testing” Service Specification which contains characteristics for offering Testing capabilities on the requested Service. It is considered at this stage a CFS.


[![VINNI SB Template Model diagram](../images/vinni_sb_model_diagram.png)](../images/vinni_sb_model_diagram.png)


## Manage a Service Specification

You can manage them though the Web UI


## Assign a Service Specification to Service Categories and Publish 

Just create categories and from the menu select the category and add services


## Retire/Remove a Service Specification

Delete it from the category


## Consume and expose Service Specifications from other Service Catalogues 

See more on [Consuming Services From External Partner Organizations](./architecture/consumingServicesFromExternalPartners.md)


