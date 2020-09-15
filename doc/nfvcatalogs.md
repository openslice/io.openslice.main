## NFV Services 

NFV Services are managed through a dedicate UI the NFV portal (eg http://portal.openslice.io/nfvportal)

Users are able through this portal to manage their NFV artifacts towards the NFVO, ( for example onboard VNFs and NSDs to a target OSM)


Openslice NFV Services target to accommodate the following envisaged user roles. All users are assumed to be Authenticated:

* NFV developer: This role is responsible to upload VNF and NSD Descriptors in the Openslice services towards NFVO like OSM
* Services administrator: This role represents the user that are responsible for maintenance of the Openslice services

(obsolete: )
* Testbed provider: This role represents users that are responsible for testbed administration, configuration, integration, adaptation, support, etc
* Experimenter: This role represents the user that will utilize our services and tools to deploy an experiment. That is the experiment description in terms of e.g.: NSD (Network Service Descriptor) or TOSCA Specification (in future versions)
    
    
Finally an anonymous user role exists who has some really simple usage scenarios (e.g. signup through the portal)


During the onboarding process the following occurs:
• A NFV developer submits a NFV archive (VNF or NSD) (he can later manage if needed some metadata)
• The administrator can manage the NFV artifact (e.g. edit it)
• The administrator On-Boards the NFV artifact to the target MANO
• The administrator can optionally mark the NFV:
o As public in order to be publicly visible by all portal users
o As Certified which means this is certified by a certain entity


## Request a new NSD deployment (this is different in comparison to Services)


An developer requests a new network service deployment (which NSD, tentative dates, target infrastructure, etc.). The request is marked as UNDER_REVIEW
* The administrator is notified about the new request and he has the following options:
* Schedule the deployment for the requested dates or propose other dates. The request is marked as SCHEDULED
* Reject the request for some reason. The Request is marked as REJECTED
* Deploy the request to target VIM(s). The Request is marked as RUNNING
* Finalize the deployment and release resources. The Request is marked as COMPLETED
*  every change of the request-lifecycle the experimenter is notified.