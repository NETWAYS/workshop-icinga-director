Lab - Service Sets
==================

We create a "Webserver" service set, and assign it based on vars.

* Manually create a Boolean field `http_ssl`
* Update external `http` command and add fields for:
    - `http_vhost`
    - `http_ssl`
    - `http_uri`
* Create service templates:
    - `http`
    - `https`, which sets `http_ssl` to true
* Update host `master.icinga.local` and add `webserver` to the `system_roles` array
* Create Service Set `Webserver`
* Add services for `http` and `https`
* Apply the service set via `host.vars.system_roles contains "webserver"`
