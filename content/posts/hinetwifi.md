---
title: "取得中華電信(Hinet)光世代Wifi基地台內的密碼"
description: "最近申辦了中華電信光世代50M/10M，並且申請了免費附贈的Wifi。"
publishDate: "2013-04-04T06:08:02.000Z"
tags: ["hack","life"]
---

最近申辦了中華電信光世代50M/10M，並且申請了免費附贈的Wifi。

拿到的機器是D-Link 的 **WBR-2200**

剛剛參考一些[網路上的文章](http://briian.com/?p=4756)，把固定IP申請好，連入基地台

-   連入基地台的方法
    
    ```plain
    Normal User：user/user
    Super User：cht/chtap
    ```
    

卻發現裡面有一個神祕的帳號：[xxxxxxxx@wifi.hinet.net](mailto:xxxxxxxx@wifi.hinet.net) ?!

找了一下[Mobile01](http://www.mobile01.com/topicdetail.php?f=110&t=2317597&p=1)，這一組帳號的密碼，居然要打電話自己去跟中華電信要…… orz  
礙於懶得打電話，就只好靠自己來。

步驟1.  
我用的是谷歌(Chrome)瀏覽器，對這密碼欄位點選右鍵(Right Click)，然後選檢查元素(Inspect Element)。

然後就會看到在跳出的視窗中，有著以下類似的東西…

```plain
<input value="123456" />
```

我想這個號碼應該可能大概不是那個密碼，就把它複製下來試試看，

接下來… 如有雷同純屬巧合。

謝謝。

\_可能\_僅適用於Hinet(中華電信)光世代附贈的家用Wi-Fi機器 **WBR-2200**
