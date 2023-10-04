---
title: JitsiMeet
sidebar_label: JitsiMeet
---

|**`Version Latest` `OS Ubuntu 20.04` `HOSTING PANELS`**|  |
|-------------------------------------------------------|--|

### Description

Jitsi Meet is an open-source video conferencing application built on WebRTC. It enables multi-person video conferences accessible through web browsers, offering functionality similar to popular conferencing tools like Zoom or Skype. What sets Jitsi Meet apart is its emphasis on privacy – all data passes through your server, and end-to-end TLS encryption ensures secure communication, protecting your private information.


### Software Included

Nginx
jicofo 
jitsi-meet 
jitsi-meet-prosody 
jitsi-meet-turnserver 
jitsi-meet-web 
jitsi-videobridge2

### Getting started after deploying JitsiMeet

The Jitsi server needs some ports opened so that it can communicate with the call clients.

You can allow the ports following  ports **80|443|4443|10000** in the firewall.


## Getting Started

Kindly point the domain to the server and during the installation process we will install SSL for the domain. Further to Secure Domain setup to allow only authenticated users kindly follow the link provided below.

~~~
https://jitsi.github.io/handbook/docs/devops-guide/secure-domain
~~~


