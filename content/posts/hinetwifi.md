---
title: "Finding the Password Inside a Chunghwa Telecom HiNet Fiber Wi-Fi Router"
description: "The HiNet fiber Wi-Fi router shipped a WBR-2200 with a mysterious wifi.hinet.net account. The password was sitting in the page source."
publishDate: "2013-04-04T06:08:02.000Z"
tags: ["hack", "life", "wifi", "networking", "router"]
---

I recently signed up for Chunghwa Telecom HiNet fiber at 50M/10M, and took the free Wi-Fi that comes with it.

The box is a D-Link **WBR-2200**.

I followed a few [posts online](http://briian.com/?p=4756), applied for a fixed IP, and logged into the router.

- How to log in

```plain
Normal User: user/user
Super User: cht/chtap
```

Inside there is a mysterious account: [xxxxxxxx@wifi.hinet.net](mailto:xxxxxxxx@wifi.hinet.net).

A thread on [Mobile01](http://www.mobile01.com/topicdetail.php?f=110&t=2317597&p=1) says you have to call Chunghwa Telecom and ask them for that password. I did not feel like calling, so I did it myself.

Step 1.  
I was in Chrome. Right-click the password field and choose Inspect Element.

In the panel that opens you get something like this:

```html
<input value="123456" />
```

I figured that number was probably not the password, copied it, and tried it anyway.

What happened next was a coincidence, if it looked like one.

Thanks.

_Probably_ only applies to the home Wi-Fi unit bundled with HiNet fiber, the **WBR-2200**.
