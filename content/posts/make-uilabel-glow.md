---
title: "Make UILabel glow"
description: "You have to import QuartzCore"
publishDate: "2013-06-30T05:24:52.000Z"
tags: ["ios","uilabel","coding"]
---

You have to import QuartzCore

```plain
#import <QuartzCore/QuartzCore.h>
```

Then apply effect on your `UILabel` or `titleLabel`.

```objc
myLabel.layer.shadowOffset = CGSizeMake(0.0, 0.0);
myLabel.layer.shadowRadius = 20.0;
myLabel.layer.shadowOpacity = 0.5;
myLabel.layer.masksToBounds = NO;
```
