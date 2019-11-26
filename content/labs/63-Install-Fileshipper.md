Lab - Install Fileshipper
=========================

Check the project and releases on GitHub: [icingaweb2-module-fileshipper](https://github.com/Icinga/icingaweb2-module-fileshipper)

Install the current release with GIT

```
sudo -i
git clone \
    https://github.com/Icinga/icingaweb2-module-fileshipper \
    /usr/share/icingaweb2/modules/fileshipper -b v1.1.0

icingacli module enable fileshipper
```

Create configuration for fileshipper:

```
mkdir -p /etc/icingaweb2/modules/fileshipper
vi /etc/icingaweb2/modules/fileshipper/imports.ini
```

```
[examples]
basedir = "/opt/import"
```
