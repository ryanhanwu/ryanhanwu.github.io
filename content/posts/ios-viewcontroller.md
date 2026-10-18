---
title: "Passing Values Between ViewControllers"
description: "The first iOS question is usually how two ViewControllers share data. Pass it through the instance for a one-off, or through a singleton when the whole app needs it."
publishDate: "2012-10-03T20:21:00.000Z"
tags: ["ios", "singleton", "objective-c", "coding", "architecture"]
---

In iOS development we use a ViewController to own the behavior of each screen.

The first problem is usually this:

> **"How do I pass information between two ViewControllers?"**

Here are a few common ways.

**1. Pass information through the instance**

[![](http://1.bp.blogspot.com/-ocnOnGCizSQ/UGvhI2puHwI/AAAAAAAACTs/xUYMOv9FN9Y/s640/blog1-1.png)](http://1.bp.blogspot.com/-ocnOnGCizSQ/UGvhI2puHwI/AAAAAAAACTs/xUYMOv9FN9Y/s1600/blog1-1.png)

Every ViewController class, whether it comes from a Storyboard or a nib, has to be initialized (`alloc` + `init`) before you can work with the **instance**. To pass information between them, you need those instances.

When the payload is simple, or you only pass it once, going through the object instance is the simpler path.

#### Example A: from a nib, get the ViewController2 instance and set `user`

<script src="https://gist.github.com/3825488.js?file=ViewController1.m"></script>

#### Example B: in a Storyboard, use the instance from the segue and set `user`

<script src="https://gist.github.com/3825531.js?file=ViewController1.m"></script>

**2. Pass information through a singleton**

Passing through an instance is convenient, but shared information often lives beyond two ViewControllers. The app author's info, or the current user's cached data, belongs in one common place that everyone reads and writes. A singleton makes that simpler.

[![Singleton](http://3.bp.blogspot.com/-_ivnC4oFHjU/UGvy1U3Z79I/AAAAAAAACUM/3HjhOjMIaxg/s640/blog2.png)](http://3.bp.blogspot.com/-_ivnC4oFHjU/UGvy1U3Z79I/AAAAAAAACUM/3HjhOjMIaxg/s1600/blog2.png)

Sample code:

<script src="https://gist.github.com/3825767.js"></script>
