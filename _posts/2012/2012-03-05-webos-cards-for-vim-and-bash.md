---
layout: post
title: WebOS cards-like interaction for Vim users
published: false
categories:
    - bash
    - vim
---
I added a couple of configuration lines and can now switch between Vim and a child shell session with `Alt+Left/Right`. Like this:

    +-----+                 +-------+
    | Vim | -- Alt+Right -> | shell |
    |     |                 |       |
    |     | <- Alt+Left --- |       | 
    +-----+                 +-------+

It feels like a faster way for switching between file editing and project tasks via shell and helped me reduce the number of tabs I keep in GNOME Terminal.

**`.vimrc` changes:**

    map <A-Right> :sh<CR>
    map <A-Left> :q<CR>

**`.inputrc` changes:**

    $if term=xterm
        "\e[1;3D":  "\C-d"
    $endif

Warning: this makes `Alt+Left` work like `Ctrl+D` (exit) in *all* of your shells.

The one drawback is that when I return to a tab and see a shell window I am not sure if the shell was opened from Vim, or Vim was closed. A visual clue would be nice, but I am not sure yet how to add it.

## Back story:

I usually keep 2-3 terminal tabs open for each code repository I work with (Vim, shell, server processes, etc.). Sometimes I may have ~10 tabs in my GNOME Terminal and am quite used to quickly switching between them.

However last week I was constantly committing changes to two repositories simultaneously and I had to do this more than often. I noticed that I am spending too much brain cycles for tracking which tab I'm on at the moment and how to get to the tab that I need.

I was writing some `make` tasks to reduce the number of commands I have to use to deploy my code, restart servers, etc. I had an idea of how I could gather all my interactions with a repository under one terminal tab. The couple of key bindings did the trick.
