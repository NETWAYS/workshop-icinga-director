Lab - Import from CMDB
======================

Check CMDB data:

```
# mysql
mysql> use cmdb
mysql> SELECT * FROM hosts;
```

* Create a DB resource for the CMDB: *Menu -> Configuration -> Application -> Resources*
    - Type: MySQL
    - Host: `localhost`
    - Database, Username and password is `cmdb`
* Create an Import source for the CMDB
* Add a modifier
    - Property: `name` / Target property: `fqdn`
    - Modifier: Combine multiple properties with `${name}.icinga.local`
* Property `fqdn` is the key column

* Validate preview
* Check for changes and run the import
* Check history
