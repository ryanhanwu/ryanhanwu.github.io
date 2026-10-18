---
title: "Xcode Plugins Worth Installing: ColorSense and CodePilot"
description: "Xcode still will not ship a plugin API. ColorSense puts a color chip on UIColor, and CodePilot gives you a fast file finder."
publishDate: "2012-10-24T21:47:00.000Z"
tags: ["ios", "apple", "xcode", "tools", "tooling"]
---

[![](http://4.bp.blogspot.com/-Ns45tdOFU94/UIraNuH1njI/AAAAAAAACfI/OwiurWlAmTs/s1600/new_hero20110308.jpeg)](http://4.bp.blogspot.com/-Ns45tdOFU94/UIraNuH1njI/AAAAAAAACfI/OwiurWlAmTs/s1600/new_hero20110308.jpeg)

Most iOS developers still use Xcode as the main tool.

Anyone who has used it knows it is full of mysterious problems:

_Xcode WTF [http://xcodewtf.tumblr.com/](http://xcodewtf.tumblr.com/)_ Text from Xcode [http://www.textfromxcode.com/](http://www.textfromxcode.com/)  
\* @wtfxcode [https://twitter.com/wtfxcode](https://twitter.com/wtfxcode)

Xcode really needs to ship an API for plugins. There is [plenty of demand](http://stackoverflow.com/questions/6316921/xcode-4-plugin-development), and officially there is still [not much of a response](http://openradar.appspot.com/8622025).

There is always someone better. A few people built plugins that are actually useful. That is what this post is about.

### First: ColorSense

**What it does**

In Objective-C we use `UIColor` all the time. Asking a visual designer for the value, or hunting down the RGBA yourself, gets old. With this plugin, a normal UIColor expression (for example `[UIColor redColor]`) shows a color chip. Click it and the Mac OS X color panel opens. Very convenient.

[![](http://3.bp.blogspot.com/-dT9gLqI-pwE/UIraUHSjb9I/AAAAAAAACfQ/sn5E_RMkon0/s640/cs.png)](http://3.bp.blogspot.com/-dT9gLqI-pwE/UIraUHSjb9I/AAAAAAAACfQ/sn5E_RMkon0/s1600/cs.png)

That screenshot is from my own screen. As a web developer I also installed [Hex Color Picker](http://wafflesoftware.net/hexpicker/), so the color panel can give me a hex value too.

**Install**

1. Clone the official git repo
2. Open the ColorSense project in Xcode
3. Build the ColorSense project
4. Restart Xcode

Done.

**Official repo**  
[https://github.com/omz/ColorSense-for-Xcode](https://github.com/omz/ColorSense-for-Xcode)

### Second: CodePilot

**What it does**

Xcode has its own way of managing files. It does not follow the real folders. It uses groups, so the project looks tidy inside the IDE. Once a project grows, or you pull in a pile of libraries, you still lose files. I kept wishing Xcode had a fast file finder like [Sublime Text 2](http://www.sublimetext.com/2) or [Alfred](http://www.alfredapp.com/). That is how I found CodePilot.

[![](http://2.bp.blogspot.com/-fJKwgwQIiSc/UIkMYMlCjcI/AAAAAAAACd0/wQGRPTyn4n0/s320/cp.jpg)](http://2.bp.blogspot.com/-fJKwgwQIiSc/UIkMYMlCjcI/AAAAAAAACd0/wQGRPTyn4n0/s1600/cp.jpg)

Screenshot above.

**Install**

1. Unzip the download
2. Put `CodePilot2.xcplugin` in `~/Library/Developer/Xcode/Third-Party Plug-ins` (I was on Xcode 4.5.1 from the App Store)
3. Restart Xcode

The shortcut is Shift + Command + X (![](http://www.danrodney.com/mac/img/menusym-shift.gif)![](http://www.danrodney.com/mac/img/menusym-command.gif)X)

Much easier to find things, right?

**Official site**  
[http://codepilot.cc/](http://codepilot.cc/)
