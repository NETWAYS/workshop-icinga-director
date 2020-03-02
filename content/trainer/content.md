Workshop Content
================

> In German: "Die rote Linie"

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

* Monitoring stuff with services
    - Service Templates
    - Apply, Template Services, Host Services
    - **Lab:** Create services for ping and Linux monitoring
    - Service Sets
    - **Lab:** Create a service set for the web server role
    - Service groups

* Clustering
    - Zones and satellites
    - Why to never manage Zones and Endpoints in Director
    - **Lab:** Create a host on the satellite
    - Agent monitoring
    - **Lab:** Add satellite host and update services
    - Additional global zones for agents and commands

<!-- end day 1 ? -->

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
    - Apply For with Services
    - Configuration baskets
    - Quick Glance: icingacli
    - Quick Glance: Director API
    - Permissions and restrictions
