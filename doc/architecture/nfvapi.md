# API interaction

## OAuth token

See [oauth](./oauth.md)

## Request a protected API resource

Example: Get all vxfs (check the `Authorization:Bearer` to be correct)

```
curl -H "Authorization:Bearer eybGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIm9wZW5hcGkiLCJhZG1pbiIsInJlYWQiLCJ3cml0ZSJdLCJvcmdhbml6YXRpb24iOiJteW9yZ2FuaXp0aW9uIiwiZXhwIjoxNTcxOTI0MjU2LCJhdXRob3JpdGllcyI6WyJST0xFX01FTlRPUiIsIlJPTEVfQURNSU4iXSwianRpIjoiNzNkZmIxODEtNTMwOS00MmExLThkOWUtOGM3YmQ0YTE1YmU0IiwiY2xpZW50X2lkIjoib3NhcGlXZWJDbGllbnRJZE91dCJ9.Pj_hxnyMGhFhN8avU_DiAw1-LlcaIz5Hp9HNqalw-X4" http://localhost:13000/osapi/admin/vxfs
```
Example response:

```
[
  {
    "id": 1,
    "owner": {
      "id": 1,
      "organization": "ee",
      "name": "Portal Administrator",
      "email": "",
      "username": "admin",
      "createdAt": null
    },
    "uuid": "a954daf2-16da-4b7e-ae42-4825936d453c",
    "name": "cirros_vnfd",
    "iconsrc": "/osapi/images/a954daf2-16da-4b7e-ae42-4825936d453c/cirros-64.png",
    "shortDescription": "cirros_vnfd",
    "longDescription": "Simple VNF example with a cirros",
    "version": "1.0",
    "packageLocation": "/osapi/packages/a954daf2-16da-4b7e-ae42-4825936d453c/cirros_vnf.tar.gz",
    "dateCreated": 1568971426000,
    "dateUpdated": 1568981107000,
    "categories": [
      {
        "id": 3,
        "name": "Service",
        "productsCount": 1,
        "appscount": 0,
        "vxFscount": 1
      },
      {
        "id": 2,
        "name": "Networking",
        "productsCount": 1,
        "appscount": 0,
        "vxFscount": 1
      }
    ],
    "extensions": [],
    "validationJobs": [],
    "screenshots": "",
    "vendor": "OSM",
    "published": false,
    "termsOfUse": null,
    "descriptor": "vnfd-catalog:\n    vnfd:\n    -   connection-point:\n        -   name: eth0\n            type: VPORT\n        description: Simple VNF example with a cirros\n        id: cirros_vnfd\n        logo: cirros-64.png\n        mgmt-interface:\n            cp: eth0\n        name: cirros_vnfd\n        short-name: cirros_vnfd\n        vdu:\n        -   count: 1\n            description: cirros_vnfd-VM\n            id: cirros_vnfd-VM\n            image: cirros034\n            interface:\n            -   external-connection-point-ref: eth0\n                name: eth0\n                position: '1'\n                type: EXTERNAL\n                virtual-interface:\n                    bandwidth: '0'\n                    type: VIRTIO\n                    vpci: 0000:00:0a.0\n            name: cirros_vnfd-VM\n            vm-flavor:\n                memory-mb: 512\n                storage-gb: 1\n                vcpu-count: 1\n        vendor: OSM\n        version: '1.0'\n",
    "descriptorHTML": "<h3>cirros_vnfd</h3><br><b>Vendor: </b>OSM<br><b>Version: </b>1.0<br><b>Description: </b>Simple VNF example with a cirros<br><b>VM Count: </b>1<br><b>vCPU Count: </b>1<br><b>Memory: </b>512 MB<br><b>Storage: </b>1 GB<br>",
    "certified": false,
    "certifiedBy": null,
    "validationStatus": "UNDER_REVIEW",
    "packagingFormat": "OSMvFIVE",
    "supportedMANOPlatforms": [
      {
        "id": 1,
        "name": "osm fivee",
        "version": "osm fivee",
        "description": "osm five"
      }
    ],
    "vxfOnBoardedDescriptors": [],
    "vfimagesVDU": [
      {
        "id": 1,
        "name": "cirros034",
        "uuid": "d4549610-8abd-42ad-97f4-0a64e1c93977",
        "shortDescription": "Automatically created during vxf cirros_vnfd submission. Owner must update.",
        "packageLocation": null,
        "publicURL": null,
        "dateCreated": 1568971426000,
        "dateUpdated": null,
        "refVxFs": [
          {
            "id": 1,
            "name": "cirros_vnfd"
          }
        ],
        "owner": {
          "id": 1,
          "organization": "ee",
          "name": "Portal Administrator",
          "email": "",
          "username": "admin",
          "active": true,
          "currentSessionID": null,
          "apikey": "e41c1cc4-aa56-4b7e-9f4d-64589549d768",
          "createdAt": 1568711859000,
          "roles": [
            "ADMIN",
            "MENTOR"
          ]
        },
        "published": false,
        "termsOfUse": null,
        "deployedInfrastructures": []
      }
    ]
  },
  {
    "id": 2,
    "owner": {
      "id": 1,
      "organization": "ee",
      "name": "Portal Administrator",
      "email": "",
      "username": "admin",
      "createdAt": null
    },
    "uuid": "4ab80095-a63e-4fe7-8598-e1c7e880706e",
    "name": "cirros_sriov_vnfd",
    "iconsrc": null,
    "shortDescription": "cirros_sriov_vnf",
    "longDescription": "Simple VNF example with a cirros SRIOV interface",
    "version": "1.0",
    "packageLocation": "/osapi/packages/4ab80095-a63e-4fe7-8598-e1c7e880706e/cirros_sriov.tar.gz",
    "dateCreated": 1568971740000,
    "dateUpdated": 1568981100000,
    "categories": [
      {
        "id": 4,
        "name": "tyu",
        "productsCount": 1,
        "appscount": 0,
        "vxFscount": 1
      },
      {
        "id": 5,
        "name": "tyi",
        "productsCount": 1,
        "appscount": 0,
        "vxFscount": 1
      }
    ],
    "extensions": [],
    "validationJobs": [],
    "screenshots": "",
    "vendor": "OSM",
    "published": false,
    "termsOfUse": null,
    "descriptor": "vnfd:vnfd-catalog:\n  vnfd:\n  - connection-point:\n    - name: eth0\n      type: VPORT\n    - name: eth1\n      type: VPORT\n    description: Simple VNF example with a cirros SRIOV interface\n    id: cirros_sriov_vnfd\n    logo: cirros-64.png\n    mgmt-interface:\n      cp: eth0\n    name: cirros_sriov_vnf\n    short-name: cirros_sriov_vnf\n    vdu:\n    - count: 1\n      description: cirros_sriov_vnfd-VM\n      guest-epa:\n        cpu-pinning-policy: DEDICATED\n        cpu-thread-pinning-policy: PREFER\n        mempage-size: SMALL\n        numa-node-policy:\n          mem-policy: STRICT\n          node:\n          - id: '1'\n          node-cnt: '1'\n      id: cirros_sriov_vnfd-VM\n      image: cirros-0.3.6-x86_64\n      interface:\n      - external-connection-point-ref: eth0\n        name: eth0\n        position: '1'\n        type: EXTERNAL\n        virtual-interface:\n          bandwidth: '0'\n          type: VIRTIO\n          vpci: 0000:00:0a.0\n      - external-connection-point-ref: eth1\n        name: eth1\n        position: '2'\n        type: EXTERNAL\n        virtual-interface:\n          type: SR-IOV\n      name: cirros_sriov_vnfd-VM\n      vm-flavor:\n        memory-mb: 4096\n        storage-gb: 10\n        vcpu-count: 4\n    vendor: OSM\n    version: '1.0'\n",
    "descriptorHTML": "<h3>cirros_sriov_vnf</h3><br><b>Vendor: </b>OSM<br><b>Version: </b>1.0<br><b>Description: </b>Simple VNF example with a cirros SRIOV interface<br><b>VM Count: </b>1<br><b>vCPU Count: </b>1<br><b>Memory: </b>4096 MB<br><b>Storage: </b>10 GB<br>",
    "certified": false,
    "certifiedBy": null,
    "validationStatus": "UNDER_REVIEW",
    "packagingFormat": "OSMvFIVE",
    "supportedMANOPlatforms": [
      {
        "id": 1,
        "name": "osm fivee",
        "version": "osm fivee",
        "description": "osm five"
      }
    ],
    "vxfOnBoardedDescriptors": [],
    "vfimagesVDU": [
      {
        "id": 2,
        "name": "cirros-0.3.6-x86_64",
        "uuid": "be121176-1d62-4a1b-a3c1-7dce2e069d22",
        "shortDescription": "Automatically created during vxf cirros_sriov_vnfd submission. Owner must update.",
        "packageLocation": null,
        "publicURL": null,
        "dateCreated": 1568971740000,
        "dateUpdated": null,
        "refVxFs": [
          {
            "id": 2,
            "name": "cirros_sriov_vnfd"
          }
        ],
        "owner": {
          "id": 1,
          "organization": "ee",
          "name": "Portal Administrator",
          "email": "",
          "username": "admin",
          "active": true,
          "currentSessionID": null,
          "apikey": "e41c1cc4-aa56-4b7e-9f4d-64589549d768",
          "createdAt": 1568711859000,
          "roles": [
            "ROLE_ADMIN",
            "ROLE_MENTOR"
          ]
        },
        "published": false,
        "termsOfUse": null,
        "deployedInfrastructures": []
      }
    ]
  }
]
```


