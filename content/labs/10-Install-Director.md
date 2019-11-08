Lab - Setting Up Director
=========================

The Director is pre-installed in version **1.7.x**, as well as the required modules:
**ipl**, **incubator** and **reactbundle**.

* Inspect /usr/share/icingaweb2/modules
* Open Icinga Web 2 and check enabled modules

Install and enable the background daemon for Director:

    # useradd -r -g icingaweb2 -m -d /var/lib/icingadirector -s /bin/false icingadirector

    # cp /usr/share/icingaweb2/modules/director/contrib/systemd/icinga-director.service /etc/systemd/system/
    # systemctl daemon-reload

    # systemctl start icinga-director.service
    # systemctl enable icinga-director.service
    # systemctl status icinga-director.service

* Open Icinga Web 2 and access the Director overview
* select the `director_db` database and create the schema
* Check if the background daemon becomes active after a few seconds
