---
title: "Update Enterprise Apps for iOS Devices only ONE TAP ! (faster OTA)"
description: "We all know that Apple provides an easy wayhttp://help.apple.com/iosdeployment-apps/mac/1.1/app43ad871eOTA - Over The Air to distribute your in-house..."
publishDate: "2012-10-25T21:33:00.000Z"
tags: ["ios","apple","app","ota","shared"]
---

We all know that Apple provides an [easy way](http://help.apple.com/iosdeployment-apps/mac/1.1/#app43ad871e)(OTA - Over The Air) to distribute your in-house application through a simple web link like following.

```plain
<a href="itms-services://?action=download-manifest&url=http://example.com/maniifest.plist">Install App</a>
```

Sure, we can use the same way to update the app. That means we have to send a email or url to our device owner, then they can click it. But in my case, we serve some people who are very busy. Thus we need a faster to update the app.

**Usage :**   
Simply One Tap on the **AutoUpdate Icon**

[![](http://1.bp.blogspot.com/-Y6MaFg8weKQ/UIrZz5yOnCI/AAAAAAAACe4/j973qStJTX0/s1600/p1.png)](http://1.bp.blogspot.com/-Y6MaFg8weKQ/UIrZz5yOnCI/AAAAAAAACe4/j973qStJTX0/s1600/p1.png)

  
Then the browser will show up and ask you to update the app  

[![](http://2.bp.blogspot.com/-uJnluXhnT0s/UIrZ7M0pFDI/AAAAAAAACfA/jdnBUhJE5pQ/s640/p2.PNG)](http://2.bp.blogspot.com/-uJnluXhnT0s/UIrZ7M0pFDI/AAAAAAAACfA/jdnBUhJE5pQ/s1600/p2.PNG)

**How to :**   
1\. Create a html file with following code

<script src="https://gist.github.com/3951519.js?file=ota-test.html"></script>2\. Add it to the home screen.

[![](http://4.bp.blogspot.com/-V05YdZ0HGiw/UIkFXXCqJpI/AAAAAAAACcE/IPOoyKHyVME/s320/p3.png)](http://4.bp.blogspot.com/-V05YdZ0HGiw/UIkFXXCqJpI/AAAAAAAACcE/IPOoyKHyVME/s1600/p3.png)

Remember to update the [apple-touch-icon](http://developer.apple.com/library/ios/#documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html) link 

  
**Demo:**  
Use you iOS device browser : [http://goo.gl/HNJuV](http://goo.gl/HNJuV)

**Download:**  
[ota-test.zip](https://dl.dropbox.com/u/15540367/Forever/ota-test.zip) - This zip include the sample app-touch-icon, sample-plist, and sample html.
