---
title: Slims
sidebar_label: Slims
---

|**`Version Latest` `OS Ubuntu 20.04` `Business Apps`**|  |
|------------------------------------------------------|--|

### Description

SLiMS is a comprehensive and actively developed web-based Open Source Software designed for library automation, catering to libraries of varying sizes and collections. It supports multi-platform functionality, running on systems that support PHP and MySQL. Developed using open-source software, SLiMS offers interactivity through AJAX technology and is licensed under GPLv3, ensuring freedom to modify and redistribute.

### Key Features of SLiMS include:

Online Public Access Catalog (OPAC) with thumbnail displays for book covers
XML record format support for web services
OAI-PMH data exchange
RSS feeds
Z39.50, SRU, and p2p services for copy-cataloging from different libraries
Efficient data management to minimize bibliographic data repetition
Management of master files for various reference data
Circulation management including borrowing, returning, reserves, and lending rules
Membership management with direct picture capture
Collection inventory and reporting/statistics features
Periodical management and support for multimedia and digital documents
Multilingual support and interface options
Support for parent catalog and federated search application
Library visitor counter, member area, and notification systems
LDAP server and a comprehensive system module with various utilities


For detailed documentation, refer to subsequent chapters. Visit http://slims.web.id for demos and software downloads.

### Software Included

- Apache
- Mysql
- php 7.3
- Slims

### Getting started after deploying SLiMS


You can log into the instance as ubuntu using either the password you set when you created the instance or with an SSH key if you added one during creation.

You can then switch the user to root without a password by entering the following command, and note the credenatils

~~~
sudo su -
~~~

Upon logging in, please take note of the MariaDB passwords located in the root directory. Enter the domain name for configuration on Apache once the script finishes running. Access the domain through a browser. Test the database using the provided credentials, create the admin user, and initiate the installation process.

### Security Procedure

The "install" folder in your SLiMS directory already exists. For security purposes, kindly rename or delete it from your VM.
