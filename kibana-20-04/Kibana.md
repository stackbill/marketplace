---
title: Kibana
sidebar_label: Kibana
---

|**`Version Latest` `OS Ubuntu 20.04` `Monitoring`**|  |
|-------------------------------------------------------|--|

### Description

The Elastic Stack, formerly known as the ELK Stack, is a set of open-source software from Elastic that allows you to search, analyse, and visualise logs created from any source and in any format, a process known as centralised logging. Centralised logging can be handy when looking for problems with your servers or apps since it allows you to sift through all of your logs in one spot. It's also handy for locating problems that affect several servers by comparing their logs over a certain time period.

### Software Included
 
 Elasticsearch
 Logstash
 Kibana

 ## Allow the Following port in security Groups

 To allow access to Kibana and Logstash, you must create the relevant security groups by adding inbound rules for ports 5601 and 9200. Authorised users may now interact with the Kibana visualisation interface and the Logstash data pipeline. To limit access, select appropriate source IP addresses, prioritise security, and consider combining authentication and encryption solutions for comprehensive security settings.


 ## Once the Kibana is deployed

You can log into the instance as ubuntu using either the password you set when you created the instance or with an SSH key if you added one during creation.

You can then switch the user to root without a password by entering the following command, and note the credenatils

~~~
sudo su -
~~~

Kindly make the required changes in the elasticsearch using the below command

~~~
nano /etc/elasticsearch/elasticsearch.yml
~~~

Access Kibana Web Interface through the web using http://domain.

To collect data from numerous sources and deliver it to Logstash or Elasticsearch, the Elastic Stack employs many lightweight data shippers known as Beats. Here are the Elastic Beats that are currently available. Kindly install and configure based on your requriment.

~~~
Filebeat: gathers and distributes log files.
Metricbeat: gathers data from your systems and services.
Packetbeat: is a network data collection and analysis tool.
Winlogbeat: is a programme that gathers Windows event logs.
Auditbeat: takes data from the Linux audit framework and checks file integrity.
Heartbeat: actively probes services to determine their availability.
~~~

