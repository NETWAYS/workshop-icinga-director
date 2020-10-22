Workshop Content
================

> In German: "Der rote Faden"

* Introduction
    - Introduction round, experiences with Icinga
    - Training environment
    - **Lab:** Explore training VMs
    - Director concept
    - Integration in Icinga Web 2 and Icinga 2

* Getting Started
    - Installation and sources
    - Dependencies and background daemon
    - **Lab:** Inspect Installation
    - Kickstart
    - **Lab:** Kickstart with Icinga 2
    - Overview of Director UI
    - Activity Log
    - Deployments
    - **Lab:** First Deploy
    - Commands
    - **Lab:** Prepare external check commands
    - **Lab:** Create a new check command

* Custom Data
    - Fields & Custom Variables
    - Data lists
    - Best Practice on variables (customer, hardware, os, sla, owner)
    - **Lab:** Create fields and a list

* Starting with hosts
    - Templates and the idea behind them
    - Objects and difference to templates
    - **Lab:** Create basic templates and hosts
    - Host groups and apply
    - **Lab:** Create host groups
    - Inspection from the monitoring module
    - Cloning hosts

* Monitoring stuff with services
    - Service Templates
    - Apply, Template Services, Host Services
    - **Lab:** Create services for ping and Linux monitoring
    - **TODO** **Lab:** Create a separate disk check to monitor /home on master
    - Service Sets, as apply and manually added
    - **Lab:** Create a service set for the web server role
    - **TODO** **Lab:** Add a host for github.com and manually add the serviceset to it
      (Note: having https on master critical is kinda intended - you will see if users correctly set http_ssl)
    - Service groups
    - Service overrides on hosts
    - **TODO** **Lab:** Override disk thresholds on master
    - Cloning services
    - Apply For based on array field
    - **TODO** **Lab:** Add partitions field to hosts and build apply for for it

* Clustering
    - Zones and satellites
    - Why to never manage Zones and Endpoints in Director
    - **Lab:** Create a host on the satellite
    - Agent monitoring
    - Explain how command_endpoint tells the remote how to check instead of scheduling the check
    - **Lab:** Add satellite host and update services
    - Explain why command_endpoint works now vs. agent later (zone and endpoint already exist)
    - Additional global zones for agents and commands

Here often ends days 1 - depending on amount of attendees and questions.

* Import & Sync
    - What is an Import
    - Modifiers
    - **Lab:** Import Linux Hosts from CMDB
    - What is Sync
    - Properties and Filters
    - Syncing data to Icinga configuration
    - **Lab:** Create hosts from CMDB
    - Add-On: Fileshipper
    - **Lab:** Install and configure fileshipper
    - **Lab:** Import Windows hosts from CSV
    - Syncing services (combined key unique)
    - **Lab:** Import Internet Sites and create hosts and services

* Automation with background jobs
    - Triggering of import and sync
    - Automatic config deployments
    - Housekeeping

* Time Periods
    - Show Icinga 2 documentation and glance on Director Interface
    - Usable for notification and check settings

* Notifications
    - Overview over notification objects (users, groups, templates, notification commands)
    - **Lab:** Notification by external commands

* Dependencies
    - Dependencies vs. Zones and Satellites
    - Only specified parent currently

* Installing agents with Director
    - Agent Tab on Hosts
    - **Lab:** Configure Linux Agent
    - **Lab:** Configure Windows Agent
    - Self Service API for Windows Agents, Hostgroups and keys

* Advanced Topics
    - Health monitoring on dashboard and check command
    - Configuration baskets
    - Quick Glance: icingacli
    - Quick Glance: Director API
    - Permissions and restrictions
