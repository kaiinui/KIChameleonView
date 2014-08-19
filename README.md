KIChameleonView
===============

![](http://img.shields.io/cocoapods/v/KIChameleonView.svg?style=flat)

AniGIF
---

```objc
NSURL *url = [NSURL URLWithString:@"http://raphaelschaad.com/static/nyan.gif"];
[chameleonView setURL:url];
```

![](http://raphaelschaad.com/static/nyan.gif)

Video
---

```objc
NSURL *url = [NSURL URLWithString:@"http://content.viki.com/test_ios/ios_240.m3u8"];
[chameleonView setURL:url];
```

![](https://camo.githubusercontent.com/4258638f03f72effdd2e540b359bab11287fe289/687474703a2f2f656e67696e656572696e672e76696b692e636f6d2f696d616765732f626c6f672f766964656f5f706c617965725f72756e6e696e675f6d616e2e6a7067)

Image
---

```objc
NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/7817937/_github/ChameleonView.jpg"];
[chemeleonView setURL:url];
```

![](https://dl.dropboxusercontent.com/u/7817937/_github/ChameleonView.jpg)

WebP (currently not supported due to libwebp sourcecode footprint)
---

```objc
NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/7817937/photo1.200x.raw.webp"];
[chameleonView setURL:url];
```

![](https://dl.dropboxusercontent.com/u/7817937/nameko.jpg)

Dependencies
---

- `SDWebImage`
- `FLAnimatedImage`
- `VKVideoPlayer`

Installation
---

`pod 'KIChameleonView'`

and just `[chameleonView setURL:someURL];`!

:sushi:

LICENSE
---

The MIT License (MIT)

Copyright (c) 2014 kaiinui

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
