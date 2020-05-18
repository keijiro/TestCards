TestCards
=========

**TestCards** is a simple test pattern generator for Unity.

![screenshot](http://i.imgur.com/NvPD8N2.png)
![screenshot](http://i.imgur.com/8P1LkKu.png)

![screenshot](http://i.imgur.com/B8Per7Q.png)
![screenshot](http://i.imgur.com/5Kucyfi.png)

How To Install
--------------

This package uses the [scoped registry] feature to resolve package dependencies.
Please add the following sections to the manifest file (Packages/manifest.json).

[scoped registry]: https://docs.unity3d.com/Manual/upm-scoped.html

To the `scopedRegistries` section:

```
{
  "name": "Keijiro",
  "url": "https://registry.npmjs.com",
  "scopes": [ "jp.keijiro" ]
}
```

To the `dependencies` section:

```
"jp.keijiro.testcards": "1.0.0"
```

After changes, the manifest file should look like below:

```
{
  "scopedRegistries": [
    {
      "name": "Keijiro",
      "url": "https://registry.npmjs.com",
      "scopes": [ "jp.keijiro" ]
    }
  ],
  "dependencies": {
    "jp.keijiro.testcards": "1.0.0",
...
```

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
