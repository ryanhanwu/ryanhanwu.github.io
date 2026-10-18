---
title: "iOS Web Flicker with CSS3"
description: "A translate3d transition on a parent plus a left change on a child made Mobile Safari flash. Resetting translate3d on the child stopped it."
publishDate: "2012-04-26T02:45:00.000Z"
tags: ["ios", "css", "browser", "coding", "mobile"]
---

Testing a mobile web page on iOS (iPhone 4s / iPad 2 / iPod Touch), the screen started flickering.

A teammate and I spent a while on it and found a very strange bug.

**What was happening**

1. The parent `div` used `transform: translate3d(...)` for a transition.
2. After the screen finished processing, an event changed the child `div`'s CSS `left` value.

The moment that child property changed, the iOS screen **flickered**. iPad, iPhone 4s, and iPod Touch all did it. Android 2.x and 4.x did not.

**The fix**

I first assumed iOS WebKit was repainting the child when `left` changed on a positioned element. Then I thought, that is too basic to be the cause. After trying a few things and searching, a lot of people had the same problem.

On Stack Overflow, [this thread](http://stackoverflow.com/questions/6564911/webkit-translate3d-issues-peek-thru) and [this one](http://stackoverflow.com/questions/6481894/proper-way-to-optimize-css-3-animations-for-ios-mobile-safari). Theirs was a mysterious flicker from changing CSS `top`.

The workaround that stuck was the ugly one: dynamically add `translate3d`, then reset it.

Setting this CSS on the child fixed it:

```css
transform: translate3d(0,0,0);
-webkit-transform: translate3d(0,0,0);
```

**Follow-up**

Later that night I watched a video from Remy Sharp, who builds jsconsole and jsbin:

<iframe allowfullscreen="" frameborder="0" height="315" src="http://www.youtube.com/embed/IKl78ZgJzm4" width="560"></iframe>

**The flicker was tied to iOS hardware acceleration.**

**So `translate3d` has to be reset.**

The last time I hit a bug this mysterious, I was staring at the "advanced" browser known as IE 6.

**References**  
[http://stackoverflow.com/questions/tagged/translate3d](http://stackoverflow.com/questions/tagged/translate3d)
