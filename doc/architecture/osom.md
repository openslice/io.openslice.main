# Openslice Service Orchestration and Order Management - OSOM

OSOM is a service responsible for:
* Service Order Management (SOM)
* Service Orchestration (SO)

It uses open source Flowable Business process engine (https://www.flowable.org) .

A Service Order follows the states as defined in TMF641 specification: 

[![Service Order state](../images/service_order_states.png)](../images/service_order_states.png)


## Initial state

When a new order is created, it goes into the Initial state. It is stored in the repository and triggers an Event.

[![Initial state](../images/service_order_initial_state.png)](../images/service_order_initial_state.png)

Administrators are notified usually from the Ticketing System of a new order. They login to Openslice and change the State of the order either to ACKNOWLEDGED or REJECTED. If ACKNOWLEDGED they can Propose a startDate, add Notes, and add any additional service items

## Order scheduler

A process checks every 1 minute for ACKNOWLEDGED orders.



[![Order scheduler BPM](../images/order_scheduler_bpm.png)](../images/order_scheduler_bpm.png)

[![Order scheduler](../images/order_scheduler_diagram.png)](../images/order_scheduler_diagram.png)
