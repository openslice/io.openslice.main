# Lifecycle Management (LCM) Rules 

* NOTE: This is a prototype/experimental feature. So issues might raise during operation

LCM Rules are used for defining complex conditions and actions during the lifecycle of a service. In Openslice there are four types of rules defined:

* PRE_PROVISION 
* AFTER_ACTIVATION 
* SUPERVISION 
* AFTER_DEACTIVATION 


The following figure displays the different phases that the rules are performed, during the lifecycle of a Network Slice Instance.

[![Rules in NSI](../images/lcm/lcmfig1.png)](../images/lcm/lcmfig1.png)


In general the rules allow to perform many actions during service LCM. Thes are some examples:

* Modify service specification parameters before the instantiation of a service (or during operation) based on other dependencies. These parameters might be part of other services already included in Service order
* Translate GST/NEST parameter values to other values passed later to NFVO for instantiation or control
* Define complex OSM Configs based on other dependencies and passing variables
* Create new service orders so include dynamically other services
* Call external (RESTful) services (via http(s), define payload, examine response)


## Examine if the rules are executed successfully 

Rules are transformed automatically to executable code (currently is Java). If a rule is performed successfully  or has any issues (e.g. unexpected syntax errors or exceptions) appear in OSOM logfiles and also tey are attached as Notes to the running Service.

## LCM Rules and OSOM Service Orchestration

OSOM is the responsible service for executing the rules on a specific phase. The following image explains the design in the BPMN phases:


[![Rules](../images/lcm/lcmfig1_osom.png)](../images/lcm/lcmfig1_osom.png)



## Define rules

Rules are defined when designing a Service Spec. Here is an example of a list of rules:


[![lcmrules](../images/lcm/lcmfig2.png)](../images/lcm/lcmfig2.png)

Execution order of rules on a specific phase is random

* NOTE: There is a priority field. The lower the number the highest the priority of rule execution. For example Rule with priority 0 will run before rule with priority 1.


### Definition language

* The visual language that Openslice used is based on Google's Blockly (see https://developers.google.com/blockly)
* The blockly graph is automatically translated to Java internally and then dynamically executed during orchestration phases.

The following figure is an example of such a rule design. The rule for example will run in PRE_PROVISION phase:

[![lcmrules](../images/lcm/lcmfig3.png)](../images/lcm/lcmfig3.png)

* The goal of the above rule is to properly define a variable AreaCodes given the chosen AreaOfService from a Service Order.
* On the right side the user can define some rule properties or observe the underlying generated java code.


## The blocks library

The following images describe some blocks found in the library.

Blockly has syntax rules. It helps with colours to define them. 

So for example a parameter that is a Number cannot be "glued" with a String. Will need some conversion first

[![lcmrules](../images/lcm/lcmfig4.png)](../images/lcm/lcmfig4.png)
[![lcmrules](../images/lcm/lcmfig5.png)](../images/lcm/lcmfig5.png)
[![lcmrules](../images/lcm/lcmfig6.png)](../images/lcm/lcmfig6.png)
[![lcmrules](../images/lcm/lcmfig7.png)](../images/lcm/lcmfig7.png)
[![lcmrules](../images/lcm/lcmfig8.png)](../images/lcm/lcmfig8.png)

## Examples of Rules


The following images provide some examples of rules.

### define variables according to cases

In the following example we 
* define a String variable. 
- Then according to the Area of Service selected from the Service Order of the Service Specification we need to define it properly.
* We output the value to the OSOM Log
* Define dynamically the value of another parameter (This is fictional) and then do some other condition check

The strAreaCodes could be passed then e.g. to NFVO for instantiation of services to these cells.


[![lcmrules](../images/lcm/lcmfig9.png)](../images/lcm/lcmfig9.png)



### Define complex OSM configs for DAY 0

The following displays some complex examples for defining the parameters to pass to the NFV. In this case is OSM.
* NOTE: The OSM_CONFIG characteristic of a service is the one that it is used in orchestration to instantiate NS from OSM
* check the variable strTargetsParam. It is passed to the variable strOsmConfig3 which is executed if the Number of Cameras is more than 100. 
* if the Video quality requested is 3, then the Maximum Namber of camers will be 8. Check the OSM detailed configuration block and its syntax.
* if the Video quality requested is 2, we use a simpler OSM Config block to configure the parameter OSM_CONFIG. We just injected a json text ( watch the Escape of the string for the Quotes!)
* if the Video quality requested is 1, again we use a simpler OSM Config block to configure the parameter OSM_CONFIG. We use as injected json text a variable constructed later


[![lcmrules](../images/lcm/lcmfig10.png)](../images/lcm/lcmfig10.png)


### Define and instantiate different services according to Service Order request

In the following example we would like to offer a service either as Platinum, Gold or Silver. Depending on the selection we need to instantiate different services.

There are different ways to accomplish this:

* create dynamically New Service Orders of RFSs with equivalent quality of Services
* change for example the VIMs that you deploy the NS
* change the NSD (that is use different VNFs)

The following image displays for example the latter case.

[![lcmrules](../images/lcm/lcmfig11.png)](../images/lcm/lcmfig11.png)


### Call an external RESTful service

This is useful in cases for example of alarms , external logging, calling other services e.g. email or even a complex algorithm written in other language e.g. call an external service and get a result. (service e.g. a Python service)


[![lcmrules](../images/lcm/lcmfig12.png)](../images/lcm/lcmfig12.png)

[![lcmrules](../images/lcm/lcmfig13.png)](../images/lcm/lcmfig13.png)

### Create New Service Orders

The following example calls to Order a New Service Specification with specific Parameter Values

[![lcmrules](../images/lcm/lcmfig14.png)](../images/lcm/lcmfig14.png)





