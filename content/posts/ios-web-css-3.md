---
title: "iOS Web 畫面閃爍問題 (CSS3)"
description: "在iOS iPhone 4s/ iPad 2/iPod Touch 上測試 Mobile Web的時候出現了閃爍問題   和Team member 花了一段時間發現一個很詭異的問題   狀況   1\\. 父節點DIV因為要做Transition使用了 <span style=\"color: 6666..."
publishDate: "2012-04-26T02:45:00.000Z"
tags: ["ios","css","browser","coding"]
---

在iOS (iPhone 4s/ iPad 2/iPod Touch) 上測試 Mobile Web的時候出現了閃爍問題  
和Team member 花了一段時間發現一個很詭異的問題  
**狀況**  
1\. 父節點(DIV)因為要做Transition使用了 `**<span style="color: #666666;"> </span><span style="color: blue;">transform: translate3d(…)</span>**`  
`<span style="font-family: Arial;">2\. 畫面處理完成後，觸動事件將子節點(DIV)的CSS改變** **</span><span style="color: blue; font-family: 'Courier New';">**left : *px**</span>`

```
就在這個更改子節點的瞬間 iOS 的畫面一定會**<span style="color: red;">閃爍一下</span>** ``測試過了 iPad / iP4s / iPod Touch 都有這問題 但是Android 2.x 4.x 都沒有…
```

**處理方式**

原本以為是iOS 的 webkit 在處理特定 position 的 left 造成子節點重畫的問題，  
後來想想覺得這 ~也太基本了吧~ 不太可能，經過嘗試以及搜尋，發現很多人都有類似問題。

像是StackOverflow [這篇](http://stackoverflow.com/questions/6564911/webkit-translate3d-issues-peek-thru) 還有 [這篇](http://stackoverflow.com/questions/6481894/proper-way-to-optimize-css-3-animations-for-ios-mobile-safari) 他是改 CSS top 導致發生神秘的閃爍事件…

最後使用動態增加translatde3d 並且 reset 的 ~爛招~ 解法   

後來將以下的 css 指定給子節點 問題就解決了

transform: translate3d(0,0,0);

\-webkit-transform: translate3d(0,0,0);

  
**補充**  
回家後看到jsconsole/jsbin的作者 Remy Sharp 大大的影片

<iframe allowfullscreen="" frameborder="0" height="315" src="http://www.youtube.com/embed/IKl78ZgJzm4" width="560"></iframe>

**造成我畫面閃動的原因 應該是跟iOS的硬體加速有關**

**故需要Reset translate3d …..**

**~真。他x的  上一次遇到這種神秘的問題 是面對高級瀏覽器 IE 6 ……………~** 

**References**  
[http://stackoverflow.com/questions/tagged/translate3d](http://stackoverflow.com/questions/tagged/translate3d)
