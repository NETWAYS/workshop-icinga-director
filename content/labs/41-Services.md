Lab - Services
==============

Create a service template `default service`, and then check specific templates.

All check templates set the check command, and import `default service`.

* Create `default service` template
* Create check templates for some basic CheckCommands:
    - `ping4`
    - `disk`
    - `load`
    - `ssh`
    - `icinga`
* Add apply rule `ping` that assigns where `host.address = 192.168.*`
* Add services to the `linux host` template for: `disk`, `load`, `ssh` and `icinga`
* Deploy config
* Validate status in monitoring
