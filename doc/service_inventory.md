## Service Inventory

After a Service Order completion, active services with their additional characteristics are found:
* From the Order Items of a selected Service order
* from the menu of Service inventory and then selecting details of each service
* through the Service Inventory API (TMF 638 - Service Inventory Management ) 


## Interacting with an Active Service (Day 2 config)

In some cases, if the underlying service is configured with actions (for example in OSM Day 2 primitive actions), there are characteristics that can be modified.  Usually they are named like : <servicename>::Primitive::<action>

The user can edit the characteristic with a new value. The value is propagated through the OSOM and NFVO down to the related VNF.

## Terminating/Inactivate a service

You can terminate the service with one of the following processes:

* Select the related Service Orderand terminate the Order Item. This will delete all the underlying related active services. The Order goes to ACKNOWLEDGED->INPROGRESS->COMPLETE
* To terminate or inactivate a service, select the specific service from the inventory, press Edit and set the State either to Inactive or Terminated

<b>Warning: if you terminate or inactivate a service the action cannot be undone.</b>   