Authentication is based on oAuth2. Our authentication service is a Keycloak server which is deployed with Openslice deployment 

API users needs to authenticate. 
All APIs (except grant token request) must include Bearer token in request Authorization header.



##OAuth token

Get first an oauth token, using your username and password. 
```
curl -X POST http://portal.openslice.io/auth/realms/openslice/protocol/openid-connect/token -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=demouser' -d 'password=demouser' -d 'grant_type=password' -d 'client_id=admin-cli'  
```
response:

```
                                                       {"access_token":"eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJHZFRjQnpxczg2VW10NTRVZV8ybTJyWHJkV3dzaWdSZE9EUldMYm1memNvIn0.eyJleHAiOjE1ODczOTg4NzUsImlhdCI6MTU4NzM5ODU3NSwianRpIjoiOWEwYjgxMGYtOTQyYi00ZmFmLTkzNDEtYzU5NTNhNmZlOTA1IiwiaXNzIjoiaHR0cDovL3BvcnRhbC5vcGVuc2xpY2UuaW8vYXV0aC9yZWFsbXMvb3BlbnNsaWNlIiwic3ViIjoiYTFhMjc2NWEtZWM4My00NDU2LWI3YjItMjA3MzE5ODZlMDM1IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYWRtaW4tY2xpIiwic2Vzc2lvbl9zdGF0ZSI6IjQ2ZDgwMmQ3LTg1ODUtNDJmYy04M2UzLTc5Y2VlY2UyMzczZSIsImFjciI6IjEiLCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicHJlZmVycmVkX3VzZXJuYW1lIjoiZGVtb3VzZXIifQ.dOnA_4EGNUIHMbdA80G-1OHgqiSLln9aTG7b95pbcLf-wjVZG5E8ewTEvfjgRVAuHcu9ZYTVY1W6qBET4ppqNk913x3dC-fR006QKUc4JPvmK3vfGFVw7DnKBcytFoWIS_gDpeBH5XwPGZqDclWRlfkQqfdBszQ2acjFwF5aChxA_uC40idXba6UxCl1moyOzpc5Qs6kPxWE3SQiuASpj_c6YdO1xjsjMsPkrWCfaWnICz2CgbKPbXQQfJFEPKIwnjxqBr5EUFOi-2qy7eviWnwgvnhJVbHGcbd0fyvMvo7nquo2xuMdiwBEHGYupKpYxRQuLVcfK8-wAFN1N-SLUw","expires_in":300,"refresh_expires_in":1800,"refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIwZjUxMDk5Yy0wNTIzLTRjNGQtODM0Zi1iNDc0YzBjOTA1MzkifQ.eyJleHAiOjE1ODc0MDAzNzUsImlhdCI6MTU4NzM5ODU3NSwianRpIjoiZTZlM2MxOTEtZjY3My00M2QxLThiZDQtYjY2MzM2MDEwMWI1IiwiaXNzIjoiaHR0cDovL3BvcnRhbC5vcGVuc2xpY2UuaW8vYXV0aC9yZWFsbXMvb3BlbnNsaWNlIiwiYXVkIjoiaHR0cDovL3BvcnRhbC5vcGVuc2xpY2UuaW8vYXV0aC9yZWFsbXMvb3BlbnNsaWNlIiwic3ViIjoiYTFhMjc2NWEtZWM4My00NDU2LWI3YjItMjA3MzE5ODZlMDM1IiwidHlwIjoiUmVmcmVzaCIsImF6cCI6ImFkbWluLWNsaSIsInNlc3Npb25fc3RhdGUiOiI0NmQ4MDJkNy04NTg1LTQyZmMtODNlMy03OWNlZWNlMjM3M2UiLCJzY29wZSI6InByb2ZpbGUgZW1haWwifQ.lisyXmd2nnmE5Wf2GBcFyNxtcGVEW6VR24407drx_18","token_type":"bearer","not-before-policy":1586797346,"session_state":"46d802d7-8585-42fc-83e3-79ceece2373e","scope":"profile email"}ubuntu@portal:~/openslice/io.openslice.main/compose$

```

The `access_token` will be used next as a Bearer.

```
curl http://portal.openslice.io/tmf-api/serviceCatalogManagement/v4/serviceCatalog -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJHZFRjQnpxczg2VW10NTRVZV8ybTJyWHJkV3dzaWdSZE9EUldMYm1memNvIn0.eyJleHAiOjE1ODczOTg4NzUsImlhdCI6MTU4NzM5ODU3NSwianRpIjoiOWEwYjgxMGYtOTQyYi00ZmFmLTkzNDEtYzU5NTNhNmZlOTA1IiwiaXNzIjoiaHR0cDovL3BvcnRhbC5vcGVuc2xpY2UuaW8vYXV0aC9yZWFsbXMvb3BlbnNsaWNlIiwic3ViIjoiYTFhMjc2NWEtZWM4My00NDU2LWI3YjItMjA3MzE5ODZlMDM1IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYWRtaW4tY2xpIiwic2Vzc2lvbl9zdGF0ZSI6IjQ2ZDgwMmQ3LTg1ODUtNDJmYy04M2UzLTc5Y2VlY2UyMzczZSIsImFjciI6IjEiLCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicHJlZmVycmVkX3VzZXJuYW1lIjoiZGVtb3VzZXIifQ.dOnA_4EGNUIHMbdA80G-1OHgqiSLln9aTG7b95pbcLf-wjVZG5E8ewTEvfjgRVAuHcu9ZYTVY1W6qBET4ppqNk913x3dC-fR006QKUc4JPvmK3vfGFVw7DnKBcytFoWIS_gDpeBH5XwPGZqDclWRlfkQqfdBszQ2acjFwF5aChxA_uC40idXba6UxCl1moyOzpc5Qs6kPxWE3SQiuASpj_c6YdO1xjsjMsPkrWCfaWnICz2CgbKPbXQQfJFEPKIwnjxqBr5EUFOi-2qy7eviWnwgvnhJVbHGcbd0fyvMvo7nquo2xuMdiwBEHGYupKpYxRQuLVcfK8-wAFN1N-SLUw'


Response:


[{"uuid":"9e186cd5-b2b2-4a06-b1d6-895720193bc9","lastUpdate":"2020-03-11T23:19:05Z","@baseType":"BaseEntity","@schemaLocation":null,"@type":"ServiceCatalog","href":null,"name":"Example Facility Services","description":"Example Facility Services","lifecycleStatus":"Active","version":"1.0","validFor":{"endDateTime":"2039-11-20T23:07:21Z","startDateTime":"2019-11-20T23:07:21Z"},"relatedParty":null,"id":"9e186cd5-b2b2-4a06-b1d6-895720193bc9","category":[{"@baseType":"io.openslice.tmf.scm633.model.ServiceCategoryRef","@schemaLocation":null,"@type":"io.openslice.tmf.scm633.model.ServiceCategoryRef","href":null,"name":"Generic Services","@referredType":null,"id":"98b9adf1-a1d6-4165-855f-153ddc2131b1"},{"@baseType":"io.openslice.tmf.scm633.model.ServiceCategoryRef","@schemaLocation":null,"@type":"io.openslice.tmf.scm633.model.ServiceCategoryRef","href":null,"name":"External","@referredType":null,"id":"08ffdb3c-6237-45d0-9f3a-d43b5fc5f0b6"},{"@baseType":"io.openslice.tmf.scm633.model.ServiceCategoryRef","@schemaLocation":null,"@type":"io.openslice.tmf.scm633.model.ServiceCategoryRef","href":null,"name":"eMBB","@referredType":null,"id":"ef2c90dd-b65e-4a9f-a9c3-427c9fb0219b"}]}]


```