---
title: "Upgrade to Hexo 3"
description: "I’ve use Hexohttp://hexo.io for a while and deply my blog on Github. Upgrade to Hexo 3 is extremely simple."
publishDate: "2015-03-20T15:32:16.000Z"
tags: []
---

I’ve use [Hexo](http://hexo.io) for a while and deply my blog on Github. Upgrade to Hexo 3 is extremely simple.

1.  Upgrade Hexo command line tool
    
    ```shell
    $ npm install hexo-cli -g
    ```
    
2.  Update your package.json
    -   Basically replace old dependencies
        
        ```javascript
        "dependencies": {
        -    "hexo-renderer-ejs": "*",
        -    "hexo-renderer-stylus": "*",
        -    "hexo-renderer-marked": "*"
        +    "hexo": "^3.0.0",
        +    "hexo-generator-archive": "^0.1.0",
        +    "hexo-generator-category": "^0.1.0",
        +    "hexo-generator-index": "^0.1.0",
        +    "hexo-generator-tag": "^0.1.0",
        +    "hexo-renderer-ejs": "^0.1.0",
        +    "hexo-renderer-marked": "^0.2.4",
        +    "hexo-renderer-stylus": "^0.2.0",
        +    "hexo-server": "^0.1.2"
           }
        ```
        
    -   Add Hexo version **This step is very important, your hexo cli wont work if you didn’t add this**
        
        ```javascript
        "hexo" : {
            "version" : 3.0.0
        }
        ```
        
3.  Update deployer settings
    -   Install deployer first
        
        ```shell
        $ npm install hexo-deployer-git --save
        ```
        
    -   Update deployer config
        
        ```javascript
        -  type: github
        -  repository: git@github.com:ryanhanwu/ryanhanwu.github.io.git
        +  type: git
        +  repo: git@github.com:ryanhanwu/ryanhanwu.github.io.git
        ```
        

It’s done, happy blogging.
