---
layout:     post
title:      The root of all problems with JavaScript
---

* It is not its bad parts,
* it is not its inconsistencies,
* it is not its syntax,
* it is not the dynamic typing,
* it is not the event loop,
* it is not the confusing prototypal inheritance,
* it is not IE, Safari or other outdated browsers,
* it is not the 300k npm packages,
* it is not the 1k languages that compile to JavaScript,
* it is not ES6, 7, 8, 2015, stage-1, stage-0
* it is not the ton of tools you seem to need to build anything working,
* it is not that your node_modules grew over a gigabyte in size,
* it is not the Website Obesity Crisis
* it is not the "new JavaScript framework every day" mentality,
* it is not its users,
* it is not its community[^1].

The root of most problems is that developers have to use JavaScript if they need to build anything that works in a browser[^2].

Let me rephrase: **the biggest problem** with JavaScript is that it is so big and a lot of developers are _forced_ to use it.

Naturally, all the developers who have to use it, try to fix their problems with the language or the available ecosystem in thousands of ways.

I don't think _everyone_ moving to Chrome, TypeScript, ES6, React, Webpack, 2 spaces, eslint-config-airbnb or anything else will solve any problems. It can only make matters worse.

#### Therefore:

* I love ES6 and beyond, but admire developers who stick with ES3 and ES5,
* I dislike TypeScript, but am interested in what their users are building,
* I hate Angular, I use React – no problem,
* I didn't like Grunt or Gulp, I switched to Webpack.
* I prefer to build my programs out of functions and expressions. I have no problem with people using pseudo-OOP as long as I don't need to write their boilerplate and can use their methods as callbacks when needed.
* I use 4 spaces, you use 2. Lets not start a flamewar. Lets grab a drink and talk about something more interesting instead.

### Live and let live.

* Use what you love, but don't push others to use it.
* Embrace the methods and techniques you are using, but be open to learning from others.
* Learn to distinguish between the things that are really important to you and that are minor annoyances.
* Don't be an asshole – it only hurts everyone.

* * *

### Notes

[^1]: I don't think there _is_ a JavaScript community. There's too much diverse stuff going on around. Front-end frameworks, back-end frameworks, 3d libraries, mobile platforms, vanilla style, embedded systems. The only most common factor may be npm... and still you could find tens of thousands of people who just add a bunch of `<script>` tags to their page and build entire apps with it.

[^2]: Even if you use some other language and compile it to JavaScript, there will come the moment when you will have to use JavaScript when debugging some deep issue in your code. There is no escape.
