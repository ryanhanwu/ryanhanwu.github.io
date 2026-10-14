---
title: "推薦 XCode Plug-in - ColorSense + CodePilot"
description: "!http://4.bp.blogspot.com/-Ns45tdOFU94/UIraNuH1njI/AAAAAAAACfI/OwiurWlAmTs/s1600/newhero20110308.jpeghttp://4.bp.blogspot.com/-Ns45tdOFU94/UIraNuH1njI..."
publishDate: "2012-10-24T21:47:00.000Z"
tags: ["ios","apple","xcode","tools"]
---

[![](http://4.bp.blogspot.com/-Ns45tdOFU94/UIraNuH1njI/AAAAAAAACfI/OwiurWlAmTs/s1600/new_hero20110308.jpeg)](http://4.bp.blogspot.com/-Ns45tdOFU94/UIraNuH1njI/AAAAAAAACfI/OwiurWlAmTs/s1600/new_hero20110308.jpeg)

  
以目前來說，iOS的Developer大部分都還是使用XCode來做為主要的開發工具。  
但只要用過就知道，XCode充滿了許多神祕的問題：  
  
_XCode WTF [http://xcodewtf.tumblr.com/](http://xcodewtf.tumblr.com/)_  Text from XCode [http://www.textfromxcode.com/](http://www.textfromxcode.com/)  
\* @wtfxcode [https://twitter.com/wtfxcode](https://twitter.com/wtfxcode) 

嗯… 其實XCode真的很需要釋出開發Plug-in的API，就算有[廣大的回響](http://stackoverflow.com/questions/6316921/xcode-4-plugin-development)，官方目前似乎對於這件事情還是[沒有什麼反應](http://openradar.appspot.com/8622025)。

一山還有一山高還是有很多高手，弄出了一些好用的Plug-In，也就是今天要介紹的內容。

### 第一套：ColorSense 

**說明**  
一般我們在Objective-C裡面，時常會使用到UIColor，不過每次都要請視覺設計師大大給或是自己去找詳細的RGBA實在很麻煩。加入這個Plug-In，一個正常的UIColor Syntax(例如: \[UIColor redColor\]) 上面就會出現色塊，點擊之後就會出現Mac OS X的Color Panel供選擇，非常方便。

[![](http://3.bp.blogspot.com/-dT9gLqI-pwE/UIraUHSjb9I/AAAAAAAACfQ/sn5E_RMkon0/s640/cs.png)](http://3.bp.blogspot.com/-dT9gLqI-pwE/UIraUHSjb9I/AAAAAAAACfQ/sn5E_RMkon0/s1600/cs.png)

  
上面是我自己的螢幕截圖，身為一個Web Developer，我另外裝了[Hex Color Picker](http://wafflesoftware.net/hexpicker/)，使得我的Color Panel還可以得到Hex值。  
**安裝方式：**

1.  到官方的Git Repo，下載整個Project (git clone)
2.  用XCode開啟ColorSense專案
3.  Build ColorSense專案
4.  重啟XCode
    
    這樣就完成了！！
    
    **官方網址（Git Repo)**   
    [https://github.com/omz/ColorSense-for-Xcode](https://github.com/omz/ColorSense-for-Xcode)

### 第二套：CodePilot

**說明**  
XCode有自己的一套檔案管理方式，並不是按照實際的資料夾排列，而是使用群組的觀念，讓檔案在開發環境中看起來是整齊的。但是開發久了專案大了，或是加了很多其他Library，還是難免會有找不到檔案的情形。一直都很希望XCode可以像是[Sublime Text 2](http://www.sublimetext.com/2) 或是 [Alfred](http://www.alfredapp.com/) 一樣有個快速簡便的尋找檔案方式。於是我找到了CodePilot 這個Plug-in。  

[![](http://2.bp.blogspot.com/-fJKwgwQIiSc/UIkMYMlCjcI/AAAAAAAACd0/wQGRPTyn4n0/s320/cp.jpg)](http://2.bp.blogspot.com/-fJKwgwQIiSc/UIkMYMlCjcI/AAAAAAAACd0/wQGRPTyn4n0/s1600/cp.jpg)

  
以上是截圖。  
**安裝方式**

1.  將下載下來的檔案解壓
2.  把 CodePilot2.xcplugin 放到 “~/Library/Developer/Xcode/Third-Party Plug-ins” (目前我是使用App Store抓下來的Xcode 4.5.1)
3.  重啟XCode
    
    啟動的快捷健是Shift + Command + X (![](http://www.danrodney.com/mac/img/menusym-shift.gif)![](http://www.danrodney.com/mac/img/menusym-command.gif)X)
    
    是不是很好找呢～？
    
    **官方網址**  
    [http://codepilot.cc/](http://codepilot.cc/)
