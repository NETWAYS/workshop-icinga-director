Lab - Activity Log & Deploy
===========================

* Inspect the Activity Log for changes done by Kickstart
* Deploy the latest changes to Icinga 2
* Inspect the Deployment, log and configuration files

Now let's have a look on the master VM:

```
cd /var/lib/icinga2/api
find packages/
find zones/
```

Also have a look at the log file, and search for "director".

```
less /var/log/icinga2.log
```
