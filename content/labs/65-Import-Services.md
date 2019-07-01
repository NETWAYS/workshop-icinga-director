Lab: Import Services
====================

* Create separate Import Source for Hosts & Services
* Import "internet-sites.json"

* Host key column: `host`
* Host properties:
    - address: `${host}`
    - import: `default host`

* Create service template for `https`
    - command `http`
    - `http_ssl` to `true`

* Create `key` from modifier and combined `${host}-${service}`
* Key column: `key`
* Service properties:
    - import: `${service}`
    - object_name: `${service} ${host}`
    - host: `${host}`
    - vars.http_vhost with a filter `vhost!=`

* Execute Imports and Syncs
* Check Activity log
* Deploy config and check monitoring status
