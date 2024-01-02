---
title: bigbluebutton 
sidebar_label: bigbluebutton 
---

|**`Version Latest` `OS Ubuntu 20.04` `Business Apps`**|  |
|------------------------------------------------------|--|

### Description

BigBlueButton is an open-source web conferencing platform designed primarily for online learning and virtual classrooms. It provides a feature-rich environment that enables real-time collaboration, communication, and engagement among remote participants. Here's a detailed description of its features:

### Features

- Real-time Video and Audio Conferencing: BigBlueButton allows users to participate in live video and audio conferences, fostering interactive discussions and engagement.

- Interactive Whiteboard: Participants can collaborate on a shared digital whiteboard, enabling real-time drawing, annotation, and sharing of content like presentations, documents, or equations.

- Screen Sharing: Users can share their screens to showcase presentations, applications, or specific content, enhancing the learning or meeting experience.

- Multi-User Polling and Quizzes: It offers interactive polls and quizzes, allowing presenters to gather real-time feedback or assess participants' understanding.

- Breakout Rooms: Facilitators can divide participants into smaller groups for focused discussions or activities, enhancing collaboration and teamwork.

- Text Chat and Public/Private Messaging: Users can communicate via text chat, both publicly and privately, enabling discussions, questions, and sharing links or resources.

- Recording and Playback: BigBlueButton supports recording meetings, making it possible for users to review sessions later or share them with those unable to attend.


### Software Included

- BigBlueButton
- Nginx
- Redis

### Getting started after deploying bigbluebutton

You can log into the instance as ubuntu using either the password you set when you created the instance or with an SSH key if you added one during creation.

You can then switch the user to root without a password by entering the following command, and note the credenatils

~~~
sudo su -
~~~

Enter the domain name for configuration on Niginx and bigbluebutton once the script finishes running. Access the domain through a browser. Further To create Greenlight administrator account kindly refer to the following link https://docs.bigbluebutton.org/greenlight/gl-admin.html



