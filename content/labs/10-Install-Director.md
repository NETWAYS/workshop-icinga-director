Lab - Inspect Director Installation
===================================

The Director is pre-installed in version **1.7.x**, as well as the required modules:
**ipl**, **incubator** and **reactbundle**.

* Inspect /usr/share/icingaweb2/modules
* Check if icinga-director.service is running

    # systemctl status icinga-director.service

* Open Icinga Web 2 and access the Director overview
* Select the `director_db` database and create the schema
* Check if the background daemon becomes active after a few seconds
