---
title: "Using Node.js to redirect and proxy normal HTTP+WebSocket traffics based on hostnames"
description: "Usually I used to use a single server to host several developing or experimental projects. Thus I need a quick solution to forward different request t..."
publishDate: "2013-07-19T05:23:46.000Z"
tags: ["node-js", "proxy", "redirect", "websocket", "coding"]
---

Usually I used to use a single server to host several developing or experimental projects. Thus I need a quick solution to forward different request to these services. I had tried to use [nginx](http://nginx.org/) before. But now I have a easier way to do so.

1.  **require modules**
    
    -   [underscode](http://underscorejs.org/)
    -   [node-http-proxy](https://github.com/nodejitsu/node-http-proxy)
        
        ```javascript
        var http = require('http'),
            _ = require('underscore'),
            httpProxy = require('http-proxy');
        ```
        
2.  **config proxy(forward) and redirect mappings** (hostname based)
    
    ```javascript
    var proxyOptions = {
      router: {
        "api.testAppX.com"     : 'localhost:2041',
        "dev.api.testAppX.com" : 'localhost:2042',
        "www.testAppY.com"     : 'localhost:10520',
        "test.oldApps.com"     : 'localhost:10520',
        'bc.ryanwu.co'         : 'localhost:8888'
      }
    },
      redirectOptions = {
        'olddomain.com'      : 'http://newdomain.com/',
        'www.olddomain.com'  : 'http://newdomain.com/',
        'blog.olddomain.com' : 'http://newdomain.com/blog/'
      };
    ```
    
3.  **Create an instance of node-http-proxy’s RoutingProxy**
    
    ```js
    var proxy = new httpProxy.RoutingProxy(proxyOptions);
    ```
    
4.  **Proxy normal HTTP requests**
    
    ```js
    var server = http.createServer(function(req, res) {
        var oriHost = req.headers.host,
            //remove port number from original host
            host = oriHost.indexOf(":") ? oriHost.split(':')[0] : oriHost;
    
      //Check matches of redirect hostnames
      if(_.has(redirectOptions, host)) {
        res.writeHead(301, { //You can use 301, 302 or whatever status code
          'Location': redirectOptions[host],
          'Expires': (new Date()).toGMTString()
        });
        res.end();
      } else {
        //Routing proxy will handle the rest of requests
        proxy.proxyRequest(req, res);
      }
    });
    ```
    
5.  **Proxy websocket requests and listen the main service on specific port**
    
    ```js
    server.on('upgrade', function(req, socket, head) {
      proxy.proxyWebSocketRequest(req, socket, head);
    });
    
    server.listen(80);
    ```
    

Its very convenient and then I can use a simple [forever](https://github.com/nodejitsu/forever) service to manage this service.

-   Download original JavaScript file on [here - Gist](https://gist.github.com/ryanhanwu/6031480)
    
-   Ref:
    
    -   [node-http-proxy-with-redirects.js](https://gist.github.com/konklone/5006662)
