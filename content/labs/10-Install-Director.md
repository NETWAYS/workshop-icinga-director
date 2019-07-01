Lab: Install Director
=====================

Visit the project on GitHub:

    https://github.com/Icinga/icingaweb2-module-director

Check the releases for latest version and use the version during GIT install.

    # yum install -y git
    # cd /usr/share/icingaweb2/modules
    # git clone https://github.com/Icinga/icingaweb2-module-director director -b v1.6.2

Then setup the database

    # mysql
    mysql> CREATE DATABASE director CHARACTER SET 'utf8';
    mysql> GRANT ALL ON director.* TO director@localhost IDENTIFIED BY 'director';

The rest will be done via the web interface:

* Enable director module
* Create director DB resource, ensure charset is set to `utf8`
* Go to director and install database schema
