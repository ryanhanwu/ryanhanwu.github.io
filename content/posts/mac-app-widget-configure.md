---
title: "New to Mac: Apps, Widgets, and Setup"
description: "First day with a MacBook Air: the free apps I installed, a few Dashboard widgets, and the shell commands I kept looking up."
publishDate: "2012-08-27T01:09:00.000Z"
tags: ["app", "mac", "shared", "setup", "tooling"]
---

[![](http://3.bp.blogspot.com/-59ZpL0EY70s/UDoRdkwB27I/AAAAAAAAB64/Pj9slEBZryA/s640/mac1.jpg)](http://3.bp.blogspot.com/-59ZpL0EY70s/UDoRdkwB27I/AAAAAAAAB64/Pj9slEBZryA/s1600/mac1.jpg)

Just got a 13" MacBook Air.

Updated to [OS X 10.8.1](http://support.apple.com/kb/DL1571) the day it arrived. Fast, and comfortable.

Notes on what I installed. Free apps first. Paid ones can wait.

### Productivity

- [SizeUp](http://www.irradiatedsoftware.com/sizeup/): window management. Convenient, though it pops a demo window.
- [Mou](http://mouapp.com/): Markdown editor with a live preview.
- [Dash](http://itunes.apple.com/us/app/dash-docs-snippets/id458034879?mt=12): quick snippets and doc lookup.
- [Calendar for Mac](http://qbix.com/calendar): a menu-bar calendar that actually shows events. _(Added 2012/09/01)_

### Browser

- Firefox
- Chrome
- Opera

### Storage

- Dropbox
- SkyDrive: still using it because an earlier promo left me with 25 GB.

### Development and editors

- [Sublime Text](http://www.sublimetext.com/): my favorite plain-text editor. Settings are in [this post](https://ryanwu.me/posts/my-sublime-text-2-on-windows-7-64bit/).
- [SmartGit](http://www.syntevo.com/smartgit/index.html): the best Git client I have used so far. SourceTree has wrecked a repo of mine.
- Xcode: iOS development.

### Multimedia

- [Hao Zhao Pian](http://www.haozhaopian.com/): handy photo effects.
- [Skitch](http://skitch.com/): screenshots, with a basic pen for markup.
- KKBox
- VLC Player _(added 2012/09/01)_

### Terminal

- [Go2Shell](http://itunes.apple.com/us/app/go2shell/id445770608?mt=12): open Terminal in the current Finder folder.
- iTerm: a stronger Terminal.

### Social

- Adium: MSN, Gtalk, and the rest in one client.
- [MenuTab for Facebook](http://itunes.apple.com/us/app/menutab-for-facebook/id421358730?mt=12): a solid Facebook integration.
- [TweetDeck](http://www.tweetdeck.com/): Twitter client. Useful when you are juggling accounts (I still have the jsdc.tw one).
- Skype
- Line

### System

Still exploring Dashboard widgets:

- iStat Pro
- Currency Converter
- Day Counter
- HSlider
- Page Capture
- PEMDAS
- Translator

I had never owned a MacBook, so I actually read up on [keyboard shortcuts](http://support.apple.com/kb/HT1343?viewlocale=zh_TW). I was also tired of opening and closing System Preferences while I kept changing settings, so I bound a shortcut for it. [This walkthrough](http://tantek.com/2010/242/b1/keyboard-shortcut-open-mac-system-preferences) is the one I followed.

A few commands and small tricks:

**Show hidden files**

```shell
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
```

**List installed packages (.pkg)** — package or bundle, take your pick

```shell
pkgutil --pkgs
```

**Sample a color on screen** with the built-in DigitalColor Meter.

[![](http://1.bp.blogspot.com/-aSrlG2aZh4c/UDod43skBmI/AAAAAAAAB7I/SQS2O01roP8/s320/Screen+Shot+2012-08-26+at+8.59.56+PM.png)](http://1.bp.blogspot.com/-aSrlG2aZh4c/UDod43skBmI/AAAAAAAAB7I/SQS2O01roP8/s1600/Screen+Shot+2012-08-26+at+8.59.56+PM.png)

I also installed a few everyday tools (htop, for example) through [MacPorts](http://www.macports.org/). I will add more as I think of them.

Still unsolved: I want a good blog editor. Still looking between MarsEdit 3, Ecto, and the rest.

Other reference: [40 Useful Mac OS X Shell Scripts and Terminal Commands](http://www.leftcolumn.net/2009/02/15/40-useful-mac-os-x-shell-scripts-and-terminal-commands/)
