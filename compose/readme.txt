backend API Development

nginx.conf:
- comment location /osapi
- comment location /tmf-api
- comment location /oas-api

docker-compose --profile dev down;docker-compose --profile dev up -d 

Keycloak for development


Add 127.0.0.1 keycloak in your hosts file and replace http://localhost/auth/ with http://keycloak:8080/auth/ in your Keycloak config for TypeScript/Angular.

Hosts File Location:

In Linux/Unix, its location is at: /etc/hosts In windows, its location is at c:\Windows\System32\Drivers\etc\hosts.

Explanation:

    The Nginx uses the http://keycloak:8080 URL which is the network inside the docker system.
    The front-end (TS/Angular) uses the http://keycloak:8080
    You will not get the invalid token error, as you are getting the token from http://keycloak:8080 and as well verifying with the same URL.



nginx serves already the frontend from the project io.openslice.tmf.web
If you would like to use the frontend to test your backend config.prod.json should look similar to the following example


{
    "TITLE": "Openslice demo",
    "PORTALVERSION":"1.1.0-SNAPSHOT",
    "WIKI": "http://wiki.localhost",
    "BUGZILLA": "{BASEURL}/bugzilla/",
    "STATUS": "http://status.localhost/",
    "WEBURL": "{BASEURL}",
    "PORTAL_REPO_APIURL": "{BASEURL}/osapi",
    "ASSURANCE_SERVICE_MGMT_APIURL": "{BASEURL}/oas-api",
    "APITMFURL": "http://localhost:13082/tmf-api",
    "OAUTH_CONFIG" : {
        "issuer": "http://keycloak:8080/auth/realms/openslice/protocol/openid-connect/auth",
        "loginUrl": "http://keycloak:8080/auth/realms/openslice/protocol/openid-connect/auth",
        "tokenEndpoint": "http://keycloak:8080/auth/realms/openslice/protocol/openid-connect/token",
        "redirectUri": "{BASEURL}/redirect",
        "logoutUrl": "{BASEURL}/auth/realms/openslice/protocol/openid-connect/logout",
        "postLogoutRedirectUri": "{BASEURL}/services/services_marketplace",

        "responseType": "code",
        "oidc": false,
        "clientId": "osapiWebClientId",
        "dummyClientSecret": "secret",

        "requireHttps": false,
        "useHttpBasicAuth": true,
        "clearHashAfterLogin": false,

        "showDebugInformation": true
    }
}





    
    
    
--- 

Run openslice on host

Build first

docker-compose --profile prod down;docker-compose --profile prod  up -d --build

    