TestCards
=========

**TestCards** is a simple test pattern generator for Unity.

![screenshot](http://i.imgur.com/cgC564r.png)
![screenshot](http://i.imgur.com/8P1LkKu.png)

![screenshot](http://i.imgur.com/B8Per7Q.png)
![screenshot](http://i.imgur.com/5Kucyfi.png)

How To Use
----------

The `TestOverlay` component works as an image effect, so it has to be added to
a camera object before using. It simply overdraws the entire screen with a test
pattern.

Currently four pattern modes are available for use.

- **Fill**: simply fill the entire screen with a given color.
- **Spectrum**: draws a grayscale bar and a color spectrum bar.
- **Checker**: draws a checker pattern with a given scale.
- **Pattern**: draws a TV test pattern.

License
-------

The scripts and the shaders are [released into the public domain][Unlicense].
Feel free to use it.

The TV test pattern (PM5644) was created by RTFMASAP and shared under a
Creative Commons Attribution-Share Alike 3.0 Unported license. See the
[Wikimedia Commons page][Wikimedia] for further details.

[Unlicense]: http://unlicense.org/
[Wikimedia]: https://commons.wikimedia.org/wiki/File:PM5644-1920x1080.gif
