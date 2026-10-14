---
title: "Get current location and city name"
description: "1\\. Add CoreLocation.framework to your project"
publishDate: "2012-12-06T20:27:00.000Z"
tags: ["ios","geolocation","objective-c","coding"]
---

1\. Add **CoreLocation.framework** to your project

2. Add **CLLocationManagerDelegate** to your viewController

3\. Initialize **CLLocationManager** in viewDidLoad

4\. Get current location in  the delegate method  
**\-** (void)locationManager:(CLLocationManager_)managerdidUpdateLocations:(NSArray_)locations;

  
5. Use **CLGeocoder** to reverseGeocodeLocation  
  
<script src="https://gist.github.com/4222448.js?file=myViewController.m"></script>Full Code [here](https://gist.github.com/4222448)
