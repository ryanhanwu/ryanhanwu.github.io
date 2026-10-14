---
title: "在ViewController 之間傳值"
description: "在iOS的開發中，我們經常會使用ViewController來控制每一個畫面的行為，   剛開始的時候最常遇到的問題就是"
publishDate: "2012-10-03T20:21:00.000Z"
tags: ["ios","singleton","objective-c","coding"]
---

在iOS的開發中，我們經常會使用ViewController來控制每一個畫面的行為，  
剛開始的時候最常遇到的問題就是  

> **“怎麼在兩個ViewController之間傳遞資訊”**這篇文章中我列出了幾種常見的方法，提供給大家做參考。

**1\. 透過實體(Instance)傳遞資訊**

[![](http://1.bp.blogspot.com/-ocnOnGCizSQ/UGvhI2puHwI/AAAAAAAACTs/xUYMOv9FN9Y/s640/blog1-1.png)](http://1.bp.blogspot.com/-ocnOnGCizSQ/UGvhI2puHwI/AAAAAAAACTs/xUYMOv9FN9Y/s1600/blog1-1.png)

我們都知道，每一個ViewController 的類別(Class)，不管是用Storyboard還是Nib的方式，都要先初始化(alloc + init)，然後再透過這些**實體(Instance)**物件做操作。所以，要在彼此之間傳遞資訊，必須要取得這些**實體**。

如果傳遞的資訊比較簡單，或是傳遞資訊的動作只有一次的時候，透過物件的實體是比較簡單的方式

#### 範例A： 透過 Nib 的方式，取得ViewController2 的實體，傳遞資訊，指定user的值

<script src="https://gist.github.com/3825488.js?file=ViewController1.m"></script>

#### 範例B：在StoryBoard中，透過Segue 取得的實體，傳遞資訊，指定user的值

<script src="https://gist.github.com/3825531.js?file=ViewController1.m"></script>\*\*2.透過單例(Singleton)物件傳遞\*\* 透過物件的實體來傳遞固然很方便，但是很多時候，資訊的共享並不只存在於兩個ViewController之間，例如這個應用程式的作者資訊、目前登入者的暫存資料等等，應該是在一個共通的地方，每個人都是去同一個地方存取共通的資訊。這時我們就可以透過Singleton的方式，讓資訊傳遞更簡單。

\[!\[\](http://3.bp.blogspot.com/-\_ivnC4oFHjU/UGvy1U3Z79I/AAAAAAAACUM/3HjhOjMIaxg/s640/blog2.png)\](http://3.bp.blogspot.com/-\_ivnC4oFHjU/UGvy1U3Z79I/AAAAAAAACUM/3HjhOjMIaxg/s1600/blog2.png)

以下是範例程式碼<script src="https://gist.github.com/3825767.js"></script>
