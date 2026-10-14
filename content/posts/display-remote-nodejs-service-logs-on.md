---
title: "Display remote Node.JS service logs on Chrome Console"
description: "In recent years, we got plenty of PaaShttp://en.wikipedia.org/wiki/Platformasaservice services which provide very simple and easy way to deploy our No..."
publishDate: "2013-06-25T16:24:03.000Z"
tags: ["javascript","node-js","tools"]
---

In recent years, we got plenty of [PaaS](http://en.wikipedia.org/wiki/Platform_as_a_service) services which provide very simple and easy way to deploy our Node.JS services.

Usually after deploying my service, I have to use the command line tools or visit some very slow web pages to access the server logs. It’s really waste my time.

But today, I want to introduce a tool, **[Chrome Logger](http://craig.is/writing/chrome-logger),** it provides a way to **display server logs into Chrome Developer Tool’s Console.**

[![](/images/20130625_test1.png)](/images/20130625_test1.png)

[Install it](https://chrome.google.com/webstore/detail/chromephp/noaneddfkdjfnfdakjjmocngnfkfehhd), then visit my [sample project on Heroku](http://chromelogger.herokuapp.com/) to see what’s going on.

[![](/images/20130625_test1.png)](/images/20130625_test1.png)

-   Sample Test Project on Github

**Update 06/25 00:40:**

-   If you’re using [ExpressJS](http://expressjs.com/), you can simple log your error like following error handling middleware<script src="//gist.github.com/66d5ac94916c6ab0a545.js"></script>

**Update 06/25 01:50:**

-   After reading the [Secret of Browser Developer Tool](http://devtoolsecrets.com/). I updated ChromeLogger([my forked repo](https://github.com/ryanhanwu/chromelogger)) and express-chrome-logger([my forked repo](https://github.com/ryanhanwu/express-chrome-logger)). Now it supports **TABLE display**

[![](/images/20130625_test2.png)](/images/20130625_test2.png)

Pull requests sent : [chromelogger](https://github.com/ccampbell/chromelogger/pull/24) & [express-chrome-logger](https://github.com/olahol/express-chrome-logger/pull/1).

Good luck to myself.
