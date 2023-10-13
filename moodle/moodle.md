---
title: Moodle
sidebar_label: Moodle
---

|**`Version Latest` `OS Ubuntu` `Learning`**|  |
|-------------------------------------------------------|--|

### Description

Moodle is the most widely used learning management system in the world. It is aimed to give learners, educators, and administrators with a single strong, secure, and integrated solution for creating customised learning environments as the top open source Learning Platform. This 1-Click app from Eummena, a Premium Moodle Partner, will allow you to start developing your online learning site on Stackbill in minutes!

### Software Included

- apache2
- MariaDB latest
- PHP 8.1
- Certbot
- Moodle

### Getting started after deploying moodle


In addition to the Moodle Open Source Software installation, this 1-Click also:

Preinstalls the Certbot tool with the apache plugin.

Sets a MariaDB root password, protecting access outside the localhost (if you need to gain access to the root user, get the password from /root/.mariadb_root_password file or follow these instructions).


### Accessing your Moodle instance

Once the deployment is complete, you will be able to access your Moodle instance at https://<your_domain_name>/. 


### Preparing your Moodle site for production

In order to use your Moodle for production, you must first configure a DNS entry with the fully qualified domain name (FQDN) to point to the IP of your Moodle. This way, you will have a proper URL for your Moodle site and you will also be able to enable https access (instead of the insecure http).

To proceed with these steps, you’ll need to log into the Droplet via SSH.

From a terminal on your local computer, connect to the Moodle as root:

~~~
$ ssh root@public_ipv4
Note: If you did not add an SSH key when you created the Droplet, you’ll first be prompted to reset your root password.

Then, to automatically apply Let's Encrypt SSL and enable https access for your Moodle droplet, use the pre-installed certbot tool. You will be asked to enter your domain name, make sure you enter your configured FQDN (for example: moodle.example.com). Enter y and your email address to finish the process and make sure to allow the tool to configure Apache automatically; enter y to force HTTPS rules to be applied!

# certbot --apache
No names were found in your configuration files. Please enter in your domain
name(s) (comma and/or space separated)  (Enter 'c' to cancel):
moodle.example.com
...
Do you wish to force HTTPS rewrite rule for this domain? [y/N]
y
~~~

After successfully completing these steps, you are now ready to proceed with Moodle installation on your browser. Just fire your browser at your FQDN and follow the instructions there. You will have to choose the MariaDB driver from the available options and enter the connection details for the database.