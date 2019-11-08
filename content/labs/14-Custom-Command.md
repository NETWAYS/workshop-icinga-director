Lab - Custom dummy command
==========================

Create your own command for `check_dummy`

* Name it **NOT** `dummy`, use something like this
    - `my/dummy`
    - `local/dummy`
* Just use `check_dummy` as command, Director will add `PluginDir`
* Create two arguments as noted below
* Add fields for the arguments
* Set default values under main view of the command

```
Name: state
Value: $dummy_state$
Position: 1
Skip Key: yes
```

```
Name: text
Value: $dummy_text$
Position: 2
Skip Key: yes
```
