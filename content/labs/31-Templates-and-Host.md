Lab: Templates & Hosts
======================

Create host templates:

    Name: default host
    Check Command: hostalive
    Add fields: system_*
    Add default values as you like

    Name: linux host
    Imports: default host

    Name: windows host
    Imports: default host

Create a host for the master vm:

    Name: master.icinga.local
    Address: 192.168.33.11
    Imports: linux host

Now **deploy** the config and check monitoring if the host is monitored.

Bonus:
* Check the preview of the objects
* Check the current content of the deployment
