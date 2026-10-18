---
title: "How to monitor iPhone's HTTP traffic"
description: "I usually wonder how my iPhone apps communicate with their servers. I had a debate with my ex-coworker about the security of app communication. He thi..."
publishDate: "2013-11-13T22:54:51.000Z"
tags: ["ios", "app", "network", "shared", "security"]
---

I usually wonder how my iPhone apps communicate with their servers. I had a debate with my ex-coworker about the security of app communication. He thinks we can use simple HTTP protocol for app communication, including authentication. But I insist that we should use more secure way for transmission in apps.

Let me use an example to demonstrate how little an app protects the content and how easy it is to monitor the traffic of an iPhone app.

According to Apple’s document [here](https://developer.apple.com/library/mac/qa/qa1176/_index.html). I choose **_tcpdump_** and take [7-11 Taiwan app](https://itunes.apple.com/app/id403756560?mt=8) as an example.

[![](/images/20131113_app1.PNG)](/images/20131113_app1.png)

This app provides coupon for Starbucks. I want to get the content of this coupon.

The steps are as following :  

### 1\. Connect Device

-   Connect your iPhone to your Mac via USB.

### 2\. Remote Control

-   use **_rvictl_** to connect your device via UUID (20 characters, you can find it in iTunes or organizer in XCode)

```plain
>rvictl -s UUID
```

### 3\. Check whether your device is activated

```plain
> rvictl -l
Current Active Devices:
    [1] YOUR UUID
```

### 4\. Start monitering

##### Simplest way

```plain
sudo tcpdump -n -t -i rvi0 -q -A tcp
```

##### Including request and response headers and message body

```plain
sudo tcpdump -t -i rvi0 -A -s 0 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
```

##### GET Only

```plain
sudo tcpdump -t -i rvi0 -s 0 -A 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'
```

##### POST Only

```plain
sudo tcpdump -t -i rvi0 -s 0 -A 'tcp dst port 80 and (tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504f5354)'
```

### Result

The result will be like this

[![](/images/20131113_app2.PNG)](/images/20131113_app2.png)

```plain
IP XXXXXXXX.61956 > static-ip-38-69-56-61.rev.dyxnet.com.http
....X...1.....E.....@.@......i=8E&...P..z.h..... ........
/.}..Q.AGET /Starbucks/act_ns/2013_chrismas/css/images/ajax-loader.gif HTTP/1.1
Host: event.e21magicmedia.com.tw
Referer: http://event.e21magicmedia.com.tw/Starbucks/act_ns/2013_chrismas/index.html
Accept-Encoding: gzip, deflate
Accept: */*
Cookie: _ga=GA1.XXXXXXXXX
Accept-Language: en-us
Connection: keep-alive
User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_3 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/11B511
```

Wow ~ [http://event.e21magicmedia.com.tw/Starbucks/act\_ns/2013\_chrismas/index.html](http://event.e21magicmedia.com.tw/Starbucks/act_ns/2013_chrismas/index.html)

> Now you can get the Christmas discount(Buy 1 get 1 free) without downloading the app.

Then you can use Chrome Developer Tool and **_inspect_** the [image](http://event.e21magicmedia.com.tw/Starbucks/act_ns/2013_chrismas/images/coupon.jpg) for you

### Wrap Up

Don’t use simple web view to protect your content. HTTPs and session based authentication could be a better solution.

**_This article can be only used for education. All rights of images belong to original company_**

Reference :  
[Can I use tcpdump to get HTTP requests, response header and response body?](http://stackoverflow.com/questions/4777042/can-i-use-tcpdump-to-get-http-requests-response-header-and-response-body)  
[Remote Packet Capture for iOS Devices](http://useyourloaf.com/blog/2012/02/07/remote-packet-capture-for-ios-devices.html)
