---
title: "My Sublime Text 2 on Windows 7 64bit"
description: "!http://www.catsone.com/wp-content/uploads/2011/10/MP900387742.jpg"
publishDate: "2012-03-09T00:17:00.000Z"
tags: ["editor","sublime-text-2","tools"]
---

![](http://www.catsone.com/wp-content/uploads/2011/10/MP900387742.jpg)

> Sublime, the awesome, amazing editor.**1\. Get 64bit portable version**

-   Official Website : [http://www.sublimetext.com/2](http://www.sublimetext.com/2)**2\. Install [Package Control](http://wbond.net/sublime_packages/package_control)**  
    This is the most complex step.  
    \_Type Ctrl + \` and enter following python code \_  
    
    import urllib2,os; pf=‘Package Control.sublime-package’; ipp=sublime.installed\_packages\_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install\_opener(urllib2.build\_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),‘wb’).write(urllib2.urlopen(‘[http://sublime.wbond.net/'](http://sublime.wbond.net/')+pf.replace(‘ ‘,‘%20’)).read()); print ‘Please restart Sublime Text to finish installation’
    
    **3\. Install Packages (All from package control)**
    
-   [Alignment](http://wbond.net/sublime_packages/alignment)
    
-   Format shortcut – Ctrl + Alt + a\* [BracketHighlighter](https://github.com/facelessuser/BracketHighlighter)
    
-   [CoffeeScript](https://github.com/Xavura/CoffeeScript-Sublime-Plugin)
-   [Display Functions (Java)](https://github.com/BoundInCode/Display-Functions)
-   [Edit History](https://github.com/Stuk/sublime-edit-history)
    
-   Jump to next/previous edit location
    
-   Add Key Binding\* [FileDiffs](https://github.com/colinta/SublimeFileDiffs)
    
-   Usage
    
-   Right click on tab (Or use command popup then search “Diff”)\* Install [KDiff3](http://kdiff3.sourceforge.net/)
    
-   Modify Code (file\_diffs.py)  
    
    **_Under WINMERGE_**if not WINMERGE:  
    if os.path.exists(“%s\\KDiff3\\KDiff3.exe” % os.environ\[‘ProgramFiles(x86)’\]):
    
    ```
    WINMERGE = <span class="str">'"%s\KDiff3\KDiff3.exe"'</span> % os.environ[<span class="str">'ProgramFiles(x86)'</span>]
    ```
    
    else:
    
    ```
    WINMERGE = <span class="str">'"%s\KDiff3\KDiff3.exe"'</span> % os.environ[<span class="str">'ProgramFiles'</span>]
    ```
    
    ……  
    **\_End of run\_diff function\_**  
    
    if from\_file == ‘from\_file’ or to\_file == ‘to\_file’:
    
    ```
    cmd_line = <span class="str">'%s "%s" "%s"'</span> % (WINMERGE, from_file, to_file)
    print <span class="str">"KDiff3 command: "</span> + cmd_line
    Popen(cmd_line)</pre></pre>*   [Git](https://github.com/kemayo/sublime-text-2-git/wiki)
    ```
    
-   Call git command quickly – Need [Git (mysysgit on Win7)](http://code.google.com/p/msysgit/)
    
-   Usage : Command search “git”\* [HTML5](https://github.com/mrmartineau/HTML5)
    
-   Snippets\* [IndentGuides](https://github.com/SublimeText/IndentGuides)
    
-   Indent line for editors\* [jQuery](https://github.com/mrmartineau/jQuery)
    
-   Snippets\* [jQuery Snippets pack](https://github.com/aaronpowell/sublime-jquery-snippets)
    
-   Hint : Need enable jQuery support by command
    
-   Snippets\* [JS Minifier](https://github.com/cgutierrez/JsMinifier)
    
-   Minify shortcut – **Ctrl + Alt + m\*** [JsFormat](https://github.com/jdc0589/JsFormat)
    
-   Format shortcut – **Ctrl + Alt + f\*** [Pretty JSON](https://github.com/dzhibas/SublimePrettyJson)
    
-   Format shortcut – **Ctrl + Alt + j\*** [Prefixr](http://wbond.net/sublime_packages/prefixr)
    
-   Format shortcut – **Ctrl + Alt + x** (For **CSS**)\* [SideBarGit](https://github.com/SublimeText/SideBarGit)
    
-   [SideBarEnhancement](https://github.com/titoBouzout/SideBarEnhancements/)
-   [SublimeCodeIntel](https://github.com/Kronuz/SublimeCodeIntel) **(Must Have)**
    
-   Autocomplete (Popup)\* [Tag](https://github.com/SublimeText/Tag)
    
-   **“/”**to end tag
    
-   Format shortcut – **Ctrl + Alt + f**
-   Features : Edit –> Tag …\* [Terminal](http://wbond.net/sublime_packages/terminal)
    
-   Open file shortcut – **Ctrl + Shift + t**
    
-   Open folder shortcut – **Ctrl + Shift + Alt + t\*** [Tortoise](http://wbond.net/sublime_packages/tortoise)
    
-   Need  [TortoiseGit](http://code.google.com/p/tortoisegit/) or [TortoiseSVN](http://tortoisesvn.tigris.org/)
    
-   **_Update : 20120314_ - \*\***error: \[Error 2\] The system cannot find the file specified\*\*\* [WinMerge](https://github.com/SublimeText/WinMerge)
    
-   Compare shortcut – **Ctrl + Alt + d** (Current file with previous edit file)
    
-   Modify Code (WinMerge.py)  
    
    WINMERGE = “F:\\WinMerge-2.12.4\\WinMergeU.exe”
    
    \* [ZenCoding](http://code.google.com/p/zen-coding/) **(AWESOME!!)\*\***Editor Shortcut\*\*
    
-   Toggle sidebar (file explorer) – **Ctrl + K then B**
    
-   Command List - **Ctrl + Shift + P**
-   File Search – **Ctrl + P**
    
    **Right Click Menu Support**
    
    [![](http://3.bp.blogspot.com/-KuwgCf4Jt0o/T1ibdNVstAI/AAAAAAAABq0/gUUd30d9tpE/s320/RightClick.png)](http://3.bp.blogspot.com/-KuwgCf4Jt0o/T1ibdNVstAI/AAAAAAAABq0/gUUd30d9tpE/s1600/RightClick.png)
    
-   Modify the Path of following regestries
    
-   Save following text into a .reg file then double click on it to apply

Windows Registry Editor Version 5.00  
  
\[HKEY\_CLASSES\_ROOT\\_\\shell\\SublimeText\]  
@\=“Edit With Sublime Text2”  
“Icon”\=“D:\\WindowsApp\\Sublime\\sublime\_text.exe”  
“Position”\=“Bottom”  
  
\[HKEY\_CLASSES\_ROOT\\_\\shell\\SublimeText\\command\]  
@\=“D:\\WindowsApp\\Sublime\\sublime\_text.exe %1”
