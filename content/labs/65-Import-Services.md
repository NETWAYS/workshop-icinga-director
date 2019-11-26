Lab - Import Services
=====================

## Import Hosts

* Create Import Source: Internet Hosts
    - Import `internet-sites.csv`
    - Use object key: `host`

* Create Sync Rule: `Internet Hosts` with properties:
    - address: `${host}`
    - import: `default host`

## Import Services

* Create Import Source: Internet Services
    - Import `internet-sites.csv`
    - Use object key: `${host}!${service} ${host}`

* Create Sync Rule: `Internet Services` with properties:
    - import: `${service}` -> service template from name
    - object_name: `${service} ${host}` -> `https icinga.com`
    - host: `${host}`
    - `vars.http_vhost` from `vhost`
    - `vars.http_uri` from `uri`

## Run and Deploy

* Execute Imports and Syncs
* Check Activity log
* Deploy config and check monitoring status
