---
layout:     post
title:      How To Change Firefox Scratchpad Font Size
image:      /static/2014/scratchpad-font.png
---
[<img class="third" src="{{ page.image }}" alt="Firefox Scratchpad with custom font">]({{ page.image }})
I started using Firefox [Scratchpad] recently for some web scraping work. It is a very nice feature in the Firefox' Web developer toolbox. It has various execution options. You can open it with a shortcut on any page (`Shift+F4`). You can open and save your code to the disk. It even has a Vim mode (set `devtools.editor.keymap` to _vim_ in `about:config`).

However its default font size is too small for me. Until recently I found no way to change it. It does not react to general Content preferences, it didn't change when I changed default font for Web developer tools in general. Only after some digging through Firefox internal code I found a way to change it.

The trick is, you should use [userChrome.css]. This file is located in the directory of your Firefox profile (`~/.mozilla/firefox/hash.profile/userChrome.css`). If you don't have the file – create it. The code below sets the font family and size both for Web developer tools and Scratchpad:

```break
/*  Styles for Web developer tools */
@namespace url(http://www.w3.org/1999/xhtml);
@-moz-document regexp("chrome://browser/content/devtools/.*"){
    * {
        font-family:    Droid Sans Mono, monospace;
        font-size:      10pt !important;
    }
}

/*  Styles for Scratchpad */
.CodeMirror,
.CodeMirror pre {
    font-family:    Droid Sans Mono, monospace;
    font-size:      10pt !important;
}
```

[Scratchpad]:       https://developer.mozilla.org/en/docs/Tools/Scratchpad
[userChrome.css]:   http://kb.mozillazine.org/index.php?title=UserChrome.css&printable=yes
