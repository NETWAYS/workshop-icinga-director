Lab: Services
=============

Create a service template `default service`, and then check specific templates.

All check templates set the check command, and import `default service`.

* Create `default service` template
* Create check templates: `ping4`, `disk`, `load`, `ssh`
* Add apply rule `ping` that assigns where `host.address = 192.168.*`
* Add services to the `linux host` template for: `disk`, `load`, `ssh`
* Deploy config
* Validate status in monitoring
