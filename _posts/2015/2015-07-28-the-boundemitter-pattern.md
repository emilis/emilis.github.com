---
layout:     post
title:      The BoundEmitter Pattern
---

**TL;DR:** [emilis/bound-emitter](https://github.com/emilis/bound-emitter).

I've been using EventEmitters quite much lately.
Usually I mix them into modules that need to allow subscription to some internal events.
However I am not content with the style of code they require.

Consider this small example:

**some-storage.js**

~~~
var emitter =   new EventEmitter;

exports.on =    emitter.on.bind( emitter );
exports.once =  emitter.once.bind( emitter );
exports.off =   emitter.off.bind( emitter );
...
exports.write = function write( id, value ){
   ...
   emitter.emit( "write", id, value );
   ...
};
...
~~~
{: .break}


**some-logger.js**

~~~
var storage = require( "./storage" );

storage.on( "write", console.log.bind( console, "storage wrote:" ));
~~~
{: .break}

I don't like that the code in logger.js has a magical value (`"write"`). Typos could happen anywhere, event names can change in the future. As a consequence the logger would not receive notifications about the event. More than this: this error would happen silently and you would probably notice it only by it's confusing effects.

Creating some object for holding the constant values:

**some-storage.js**

~~~
...
export.EVENTS = { write: "write" };
...
~~~
{: .break}

...would not really solve the problem: you can still mistype it or change it. All that would happen is that instead of `"wirte"` or some other _String_, `emitter.on()` or `emitter.emit()` would get an `undefined` as it's first parameter.

So I thought what about this:

**some-storage.js**

~~~
...
emitter.emit.write = emitter.emit.bind( emitter, "write" );
emitter.on.write =   emitter.on.bind( emitter, "write" );
...
exports.on =         emitter.on;
...
exports.write =      function write( id, value ){
    ...
    emitter.emit.write( id, value );
    ...
};
...
~~~
{: .break}

**some-logger.js**

~~~
...
storage.on.write( console.log.bind( console, "Storage wrote:" ));
...
~~~
{: .break}


This way, if any typo occurs, or the event name is changed we would get instant errors in the style of "_TypeError: storage.on.write is not a function_". Easier to catch and debug.

An added bonus: piping events becomes trivial:

**some-cache.js**

~~~
...
storage.on.write( emitter.emit.clear_cache_now );
...
~~~
{: .break}


Now, I don't like typing the `...bind( emitter, ...` code all the time, so I wrote myself a small function. It takes an Array of event names:

**storage.js**

~~~
...
var emitter =   BoundEmitter([ "write", "remove" ]);

exports.on =    emitter.on;
exports.once =  emitter.once;
exports.off =   emitter.off;
...
exports.write = function write( id, value ){
    ...
    emitter.emit.write( id, value );
    ...
};
...
~~~
{: .break}


The `BoundEmitter()` returns an _EventEmitter_ with the proper `on.event / emit.event / ...` functions created and bound to the context and the first argument.

You can examine the code for it at [emilis/bound-emitter](https://github.com/emilis/bound-emitter), or just install it and use via npm:

~~~
npm install bound-emitter
~~~
{: .break}

~~~
var BoundEmitter = require( "bound-emitter" );
...
var your_emitter = BoundEmitter([ "create", "update", "remove" ]);
...
your_emitter.emit.create( some_value );
~~~
{: .break}


