Authentication is based on oAuth2
API user needs to authenticate. 
All APIs (except grant token request) must include Bearer token in request Authorization header.



##OAuth token

Get first an oauth token, using your username and password. (Use Authorization: Basic b3NhcGlXZWJDbGllbnRJZE91dDpzZWNyZXQ=  as it is in the example)

```
curl -H "Authorization: Basic b3NhcGlXZWJDbGllbnRJZE91dDpzZWNyZXQ="  http://portal.openslice.io/osapi-oauth-server/oauth/token  -d grant_type=password -d username=admin -d password=changeme
```
response:

```
{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIm9wZW5hcGkiLCJhZG1pbiIsInJlYWQiLCJ3cml0ZSJdLCJvcmdhbml6YXRpb24iOiJteW9yZ2FuaXp0aW9uIiwiZXhwIjoxNTc4NTA1MDcyLCJhdXRob3JpdGllcyI6WyJST0xFX01FTlRPUiIsIlJPTEVfQURNSU4iXSwianRpIjoiMTFlNGYxYTUtZDY0Ny00YzA1LWE0ZGMtYWFhYzUyMjk4YzMwIiwiY2xpZW50X2lkIjoib3NhcGlXZWJDbGllbnRJZE91dCJ9.gm7cKdusDrdMRkxEiFU5sENKGRC1xwVj2SgPRmE9Aeg","token_type":"bearer","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIm9wZW5hcGkiLCJhZG1pbiIsInJlYWQiLCJ3cml0ZSJdLCJvcmdhbml6YXRpb24iOiJteW9yZ2FuaXp0aW9uIiwiYXRpIjoiMTFlNGYxYTUtZDY0Ny00YzA1LWE0ZGMtYWFhYzUyMjk4YzMwIiwiZXhwIjoxNTgxMDYxMDcyLCJhdXRob3JpdGllcyI6WyJST0xFX01FTlRPUiIsIlJPTEVfQURNSU4iXSwianRpIjoiYzA5NjlhMzgtNTExMy00YzMxLWEyMTItMTk1NWVhMjI0YTViIiwiY2xpZW50X2lkIjoib3NhcGlXZWJDbGllbnRJZE91dCJ9.kaXn9rnrPez4SOjO0xxxx-0GT9lBcF7g5MS_YGx_kKY","expires_in":35999,"scope":"openapi admin read write","organization":"myorganiztion","jti":"11e4f1a5-d647-4c05-a4dc-aaac52298c30"}
```

The `access_token` will be used next as a Bearer.