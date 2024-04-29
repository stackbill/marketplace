---
title: Nextcloud
sidebar_label: Nextcloud
---

| **`Version Latest` `OS Ubuntu 22.04` `Media`** |  |
|-----------------------------------------------|--|

### Description

Nextcloud is a self-hosted file sharing and collaboration platform. It allows users to store and share files, collaborate on documents, and manage calendars, contacts, and more. Nextcloud emphasizes security and privacy, providing features such as end-to-end encryption and two-factor authentication to safeguard user data.

### Software Included

- Apache2
- MariaDB Server
- libapache2-mod-php
- PHP modules:
  - php-gd
  - php-mysql
  - php-curl
  - php-mbstring
  - php-intl
  - php-gmp
  - php-bcmath
  - php-xml
  - php-imagick
  - php-zip
- Unzip
- Certbot-Apache
- Nextcloud

### Ports Required

- 80
- 443
- 3478/TCP  
- 3478/UDP

### Ports Optional

- 8080
- 8443



### Getting started after deploying Nextcloud

You can log into the instance as ubuntu using either the password you set when you created the instance or with an SSH key if you added one during creation.

You can then switch the user to root without a password by entering the following command, and note the credenatils

~~~
sudo su -
~~~

When you connect to your Nextcloud Instance via SSH for the 1st time, you’ll be displayed with the passwords and prompted to enter a domain name to continue the setup and secure your connection, you will need a registered domain configured for your Instance.

~~~
To cancel setup, press Ctrl+C.  This script will run again on your next login:
Enter the domain name for your new Nextcloud site:
(ex. example.org or test.example.org) do not include www or http/s:
Domain/Subdomain name: 
~~~

Domain's A record must be pointed to the Instance's IPADDRESS.

If you continue, you'll be prompted to install an SSL certificate for the specified domain name. This process will involve installing the SSL certificate and configuring the Apache server to utilize it from Let's Encrypt.

Once you've finished the installation steps, please access the Nextcloud instance through the domain name you provided in your browser. Then, create the admin credentials and proceed with the setup according to your requirements.

~~~
Database Name: nextcloud
Database User: nextcloud
Database Password: The password can be found in /root/.user_db_pass
~~~

### Resources

Nextcloud Documentation: https://docs.nextcloud.com/
Nextcloud Developer Documentation: https://docs.nextcloud.com/server/latest/developer_manual/
Nextcloud Documentation on GitHub: https://github.com/nextcloud/documentation