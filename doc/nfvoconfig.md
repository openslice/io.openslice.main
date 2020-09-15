## NFV Orchestrator configuration

NOTE: Currently we support Open Source MANO version SEVEN/EIGHT

Configuration of your target(s) NFVOs/MANO services with Openslice is performed through the NFV portal.

Login to http://yourdomain/nfvportal/

Go to Admin->Manage MANO Platforms and enter the supported MANO platform Name=OSMvSEVEN, Version=OSMvSEVEN and save

Go to Admin->Manage MANO providers and enter a New MANO Provider:

* Name whatever you wish
* API URL Endpoint, eg: https://10.10.10.10:9999 (This is the SOL005 NBI endpoint)
* Username, password and Project of your OSM tenant.

Check EnabledForONBOARDING so when users onboard VNFs/NSDs they will be automatically ONBOARDED to this MANO