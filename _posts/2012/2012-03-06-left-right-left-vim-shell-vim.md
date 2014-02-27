---
layout: post
title: Left Right Left... Vim Shell Vim...
categories:
    - bash
    - vim
comments:
    -   id: 522205841 
        name: MantasK 
        date: 2012-12-18 11:36:54 
        text: " I'd say go with standard Unix foreground / background process control instead:\n$ vim// do stuff in VIM\nCTRL+Z &larr; suspend vim\n// so stuff in shell\n$ fg &larr; restore vim "
    -   id: 595406399 
        name: "@jmcclare "
        url: http://twitter.com/jmcclare 
        date: 2013-03-14 18:10:09 
        text: " I'm with MantasK. I just move vim in and out of the foreground to do other things in the same shell. I also prefer tmux windows to Gnome Terminal tabs. Just as with vim, I prefer things to be hidden when I'm not using them.tmux also makes switching very fast.\n<code>'Ctrl-a, a'</code> to see your list of terminals.\n<code>'Ctrl-a 3'</code> to switch to terminal 3, etc.\nIf you want your prompt to tell you when you're inside a vim shell, add something to your <code>$PS1</code> when the <code>$VIM</code> environment variable is set.\nI have <code>$PROMPT_COMMAND</code> set to function that updates my <code>$PS1</code> each time it is displayed. The whole thing is pretty large. It has colors and a lot of other indicators like this. Here's a short example for vim detection. In your <code>~/.bashrc</code>, or a file sourced from it:\n <code>build_custom_prompt () {\n$status=\"${USER}@${HOSTNAME} $(pwd)\";</code>\n Add an indicator if we are inside a Vim shell\n<code>if [ ! -z \"${VIM}\"]; then $status=\"Vim \"${status} fi\n PS1=\"${status} \\$ \"\n}\nPROMPT_COMMAND=build_custom_prompt</code>\n I also make the Vim indicator bold green. "

---
I added a couple of configuration lines and can now switch between Vim and a child shell session with `Alt+Left/Right`. Like this:

```break
+-----+                 +-------+
| Vim | -- Alt+Right -> | shell |
|     |                 |       |
|     | <- Alt+Left --- |       | 
+-----+                 +-------+
```

It feels like a faster way for switching between file editing and project tasks via shell and helped me reduce the number of tabs I keep in GNOME Terminal.

**`.vimrc` changes:**

```break
map <A-Right> :sh<CR>
map <A-Left> :q<CR>
```

**`.inputrc` changes:**

```break
$if term=xterm
    "\e[1;3D":  "\C-d"
$endif
```

Warning: this makes `Alt+Left` work like `Ctrl+D` (exit) in *all* of your shells.

The one drawback is that when I return to a tab and see a shell window I am not sure if the shell was opened from Vim, or Vim was closed. A visual clue would be nice, but I am not sure yet how to add it.

## Back story:

I usually keep 2-3 terminal tabs open for each code repository I work with (Vim, shell, server processes, etc.). Sometimes I may have ~10 tabs in my GNOME Terminal and am quite used to quickly switching between them.

However last week I was constantly committing changes to two repositories simultaneously and I had to do this more than often. I noticed that I am spending too much brain cycles for tracking which tab I'm on at the moment and how to get to the tab that I need.

I was writing some `make` tasks to reduce the number of commands I have to use to deploy my code, restart servers, etc. I had an idea of how I could gather all my interactions with a repository under one terminal tab. The couple of key bindings did the trick.
