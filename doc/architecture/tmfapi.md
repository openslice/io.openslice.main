#OpenAPI specification

PLease check the complete spec in http://portal.openslice.io/tmf-api/swagger-ui.html

#API interaction

##OAuth token

Get first an oauth token, using your username and password. (Use Authorization: Basic b3NhcGlXZWJDbGllbnRJZE91dDpzZWNyZXQ=  as it is in the example)

```
curl -H "Authorization: Basic b3NhcGlXZWJDbGllbnRJZE91dDpzZWNyZXQ="  http://portal.openslice.io/osapi-oauth-server/oauth/token  -d grant_type=password -d username=admin -d password=changeme
```
response:

```
{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIm9wZW5hcGkiLCJhZG1pbiIsInJlYWQiLCJ3cml0ZSJdLCJvcmdhbml6YXRpb24iOiJteW9yZ2FuaXp0aW9uIiwiZXhwIjoxNTc4NTA1MDcyLCJhdXRob3JpdGllcyI6WyJST0xFX01FTlRPUiIsIlJPTEVfQURNSU4iXSwianRpIjoiMTFlNGYxYTUtZDY0Ny00YzA1LWE0ZGMtYWFhYzUyMjk4YzMwIiwiY2xpZW50X2lkIjoib3NhcGlXZWJDbGllbnRJZE91dCJ9.gm7cKdusDrdMRkxEiFU5sENKGRC1xwVj2SgPRmE9xxx" ,"token_type":"bearer","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIm9wZW5hcGkiLCJhZG1pbiIsInJlYWQiLCJ3cml0ZSJdLCJvcmdhbml6YXRpb24iOiJteW9yZ2FuaXp0aW9uIiwiYXRpIjoiNzNkZmIxODEtNTMwOS00MmExLThkOWUtOGM3YmQ0YTE1YmU0IiwiZXhwIjoxNTc0NTEyNjU2LCJhdXRob3JpdGllcyI6WyJST0xFX01FTlRPUiIsIlJPTEVfQURNSU4iXSwianRpIjoiN2VkM2E0M2QtZTg1ZS00MmNiLTk0NmMtMzI3NmQ5Mzc4YzJhIiwiY2xpZW50X2lkIjoib3NhcGlXZWJDbGllbnRJZE91dCJ9.xklL0vgWtinfTCTV1Do2rLBKUNuceEdgljpueXvoaRI","expires_in":3599,"scope":"openapi admin read write","organization":"myorganiztion","jti":"73dfb181-5309-42a1-8d9e-8c7bd4a15be4"}
```

The `access_token` will be used next as a Bearer.

## request a protected API resource

Example: Get all Service Catalogs (check the `Authorization:Bearer` to be correct)

```
curl -H "Authorization:Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIm9wZW5hcGkiLCJhZG1pbiIsInJlYWQiLCJ3cml0ZSJdLCJvcmdhbml6YXRpb24iOiJteW9yZ2FuaXp0aW9uIiwiZXhwIjoxNTc4NTA1MDcyLCJhdXRob3JpdGllcyI6WyJST0xFX01FTlRPUiIsIlJPTEVfQURNSU4iXSwianRpIjoiMTFlNGYxYTUtZDY0Ny00YzA1LWE0ZGMtYWFhYzUyMjk4YzMwIiwiY2xpZW50X2lkIjoib3NhcGlXZWJDbGllbnRJZE91dCJ9.gm7cKdusDrdMRkxEiFU5sENKGRC1xwVj2SgPRmE9xxx"  -H  "accept: application/json;charset=utf-8" -X GET "http://portal.openslice.io/tmf-api/serviceCatalogManagement/v4/serviceCatalog"

```


response:


```
[
  {
    "uuid": "9e186cd5-b2b2-4a06-b1d6-895720193bc9",
    "lastUpdate": "2019-12-19T10:45:55Z",
    "@baseType": "BaseEntity",
    "@schemaLocation": null,
    "@type": "ServiceCatalog",
    "href": null,
    "name": "Example Facility Services",
    "description": "Example Facility Services",
    "lifecycleStatus": "Active",
    "version": "1.0",
    "validFor": {
      "endDateTime": "2039-11-20T23:07:21Z",
      "startDateTime": "2019-11-20T23:07:21Z"
    },
    "relatedParty": null,
    "id": "9e186cd5-b2b2-4a06-b1d6-895720193bc9",
    "category": [
      {
        "@baseType": "io.openslice.tmf.scm633.model.ServiceCategoryRef",
        "@schemaLocation": null,
        "@type": "io.openslice.tmf.scm633.model.ServiceCategoryRef",
        "href": null,
        "name": "eMBB",
        "@referredType": null,
        "id": "ef2c90dd-b65e-4a9f-a9c3-427c9fb0219b"
      },
      {
        "@baseType": "io.openslice.tmf.scm633.model.ServiceCategoryRef",
        "@schemaLocation": null,
        "@type": "io.openslice.tmf.scm633.model.ServiceCategoryRef",
        "href": null,
        "name": "Generic Services",
        "@referredType": null,
        "id": "98b9adf1-a1d6-4165-855f-153ddc2131b1"
      }
    ]
  }
]
```