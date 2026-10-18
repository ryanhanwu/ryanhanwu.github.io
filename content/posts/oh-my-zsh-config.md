---
title: "My Default Shell Configuration - Oh-my-zsh"
description: "History of my default shell   I started to learn C Shellhttp://en.wikipedia.org/wiki/Cshelluse because of the part-time job I had got during universit..."
publishDate: "2013-07-28T04:45:02.000Z"
tags: ["zsh", "shell", "config", "system-admin", "oh-my-zsh", "shared"]
---

###History of my default shell  
I started to learn [C Shell](http://en.wikipedia.org/wiki/C_shelluse) because of the part-time job I had got during university. They were using [FreeBSD](http://www.freebsd.org/) as the default working environment. At the second year of the job, I tried [Tcsh](http://zh.wikipedia.org/wiki/Tcsh) and [Bash](https://en.wikipedia.org/wiki/Bash), then made **Bash** my default shell.

From time to time, I started to use Mac in recent years and also changed to use [zsh](http://www.zsh.org/).

###What is Z Shell ?  

> Zsh is a shell designed for interactive use, although it is also a powerful scripting language.
> 
> **\[http://www.zsh.org/\]**

The reason I use zsh is all about [Oh my zsh](https://github.com/robbyrussell/oh-my-zsh)

###What is OH MY ZSHELL ?

> oh-my-zsh is an open source, community-driven framework for managing your ZSH configuration. It comes bundled with a ton of helpful functions, helpers, plugins, themes, and few things that make you shout…

###How to Install?  
Check [Setup section](https://github.com/robbyrussell/oh-my-zsh#setup)

###My Configuration

-   Basic
    
    ```bash
    #Theme (with git status character)
    ZSH_THEME="dpoggi"
    
    CASE_SENSITIVE="true"
    
    #Aliases of zsh
    alias zshconfig="vim ~/.zshrc"
    alias ohmyzsh="vim ~/.oh-my-zsh"
    
    #Prevent tragedy
    alias rm='rm -i'
    
    source $ZSH/oh-my-zsh.sh
    ```
    
-   Node.js Related
    
    ```bash
    . ~/.nvm/nvm.sh
    nvm use default
    . <(npm completion)
    ```
    
-   [Autojump](https://github.com/joelthelion/autojump) - **Very useful tool for jumping to path i’ve visit most**
    
    ```plain
    #autojump
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    ```
    
-   Plugins Summary
    
    ```plain
    plugins=(brew copydir copyfile encode64 git node osx rsync sublime urltools vagrant)
    ```
    
    -   brew
        
        -   `brews` : List installed brews
    -   copydir & copyfile
        
        -   `copydir` : Copy current directory
        -   `copyfile $file` : Copy specific file
        -   Use `copypaste > [filename]` to paste file/dir to whereever you want
    -   encode64
        
        -   `encode64 myfile` : Encode myfile, shortcut `e64`
        -   `decode64 myfile` : Decode myfile, shortcut `d64`
    -   git
        
        -   Enable a punch of [alias](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh) and auto completion
    -   github
        -   `empty_gh repo` : Create empty Github repository **repo**
        -   `exist_gh repo` : Add existed project to repository **repo**
    -   node
        -   `node-docs domain` : Open Node.js document of current version of node and go to **domain** section
    -   osx **Very Useful**
        -   `tab` : Open new tab
        -   `vsplit_tab` : Vertical split tab
        -   `split_tab` : Horizontal split tab
        -   `pfd` : Current directory of **Finder**
        -   `pfs` : Current file of **Finder**
        -   `cdf` : Change directory(cd) to current directory of **Finder**
        -   `pushdf` : Remember current directory of **Finder**
        -   `quick-look myfile` : Open a quick look window of myfile like selecting file in Finder
        -   `man-preview ls` : Open a preview window with **ls**‘s manual
        -   `trash myfile` : Move myfile to trash
        -   `vncviewer dummy.com` : Open VNCViewer
    -   rsync
        -   `rsync-copy`
        -   `rsync-move`
        -   `rsync-update`
        -   `rsync-synchronize`
        -   Easy to understand… `COMMAND path1 path2`
    -   sublime
        -   `st` : Open Sublime Text2
        -   `stt` : Open current directory in Sublime Text2
    -   urltools
        -   `urlencode url` : Encode URL
        -   `urldecode url` : Decode URL
    -   vagrant
        -   Auto completion support

I only installed a few plugins. There’re still a lot of plugins you can use, please check the [plugin list here](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins).

After noting down all the plugin I’ve installed as a reminder. I decided to review all the supported plugins of Oh-my-zsh, I found out there’re so many ruby/rails related plugins. Maybe I could create some plugin for Node.js. Any ideas ? please tell me.
