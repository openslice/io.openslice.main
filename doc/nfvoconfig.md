# NFV Orchestrator configuration

NOTE: Currently we support Open Source MANO version SEVEN/EIGHT/TEN/ELEVEN. Later versions of OSM may also be supported by the existing configuration, as from OSM 9+ the project converged to the SOL005 interface, regarding the NBI, and SOL006 (YANG model), regarding the NFV/NSD packaging. Also an implementation of a generic SOL005 interface is supported, but not extensively tested.

Configuration of your target(s) NFVOs/MANO services with Openslice is performed through the NFV portal.

Login to http://yourdomain/nfvportal/

Navigate to Admin->Manage MANO Platforms and pick one of the supported MANO platform(s), e.g. Name=OSMvTEN, Version=OSMvTEN and save

Navigate to Admin->Manage MANO providers and enter a New MANO Provider:

* Name whatever you wish
* API URL Endpoint, eg: https://10.10.10.10:9999 (This is the SOL005 NBI endpoint)
* Username, password and Project of your OSM tenant.

Check EnabledForONBOARDING, so when users onboard VNFs/NSDs they will be automatically ONBOARDED to this MANO. If left unchecked, the onboarding must be performed manually after the VNF/NSD is uploaded to the portal.

Check EnabledForSYNC, if you want to support MANO->Openslice auto synchronization. When enabled, the existing VNFs/NSDs and VIMs (and any updates on them) of the registered MANO are also reflected to the portal.