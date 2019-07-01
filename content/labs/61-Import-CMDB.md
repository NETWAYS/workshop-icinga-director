Lab: Import from CMDB
=====================

Check CMDB data:

    # mysql
    mysql> use cmdb
    mysql> SELECT * FROM hosts;

* Create a DB resource for the CMDB, database, user and password is `cmdb`
* Create an Import source for the CMDB
* Add a modifier to set `fqdn` property, combine `${name}` and add `.icinga.local`
* Property `fqdn` is the key column

* Validate preview
* Check for changes and run the import
* Check history
