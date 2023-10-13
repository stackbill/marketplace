---
title: Odoo
sidebar_label: Odoo
---

|**`Version Latest` `OS Ubuntu 20.04` `Framework`**|  |
|-------------------------------------------------------|--|

### Description

Odoo, originally known as OpenERP, is a collection of open-source business applications built in Python and distributed under the LGPL licence. This application package addresses all company needs, from Website/Ecommerce to manufacturing, inventory, and accounting, all of which are seamlessly connected. It is the first time that a software editor has achieved such functional coverage. Odoo is the most widely used business software in the world. Odoo is utilised by 2.000.000 people globally, ranging from very small businesses (1 user) to extremely large businesses (300 000 users). This app is for Odoo Community Edition V14 and is ready to use without any technical experience.

### Software Included

- Odoo
- postgresSql

### Getting started after deploying Odoo

You can log into the instance as ubuntu using either the password you set when you created the instance or with an SSH key if you added one during creation.

You can then switch the user to root without a password by entering the following command,

~~~
sudo su -
~~~

When you connect to your Odoo Instance via SSH for the 1st time, you’ll be  prompted to enter a domain name to continue the setup and secure your connection, you will need a registered domain configured for your Instance.

~~~
To cancel setup, press Ctrl+C.  This script will run again on your next login:
Enter the domain name for your new WordPress site:
(ex. example.org or test.example.org) do not include www or http/s:
Domain/Subdomain name: 
~~~

Domain's A record must be pointed to the Instance's IPADDRESS.

Once the setup is completed without any issues, You  Can Access your new Odoo site in a browser using your domian name.
 
First, kindly provide the basic information so that the Odoo application can initialize the initial PostgreSQL database.