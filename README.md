Downscaled Davis Dataset
========================

* Author    : Pablo Arias <pariasm@gmail.com>
* Copyright : (C) 2019 IPOL Image Processing On Line http://www.ipol.im/
* Licence   : GPL v3+, see LICENSE

OVERVIEW
--------

Code to generate the dataset of 7 videos used in

[P. Arias, G. Facciolo, J.-M. Morel, A comparison of patch-based models in
video denoising. IVMSP, 2018.](http://dev.ipol.im/~facciolo/pub/IVMSP2018.pdf)

The videos are downscaled versions of videos publicly available in [Derf's
Test Media collection](https://media.xiph.org/video/derf/).

The code
consists of two shell scripts and some C simple image manipulation functions (stolen 
from [imscript](https://github.com/mnhrdt/imscript) by Enric Meinhardt-Llopis).
It has been tested in Ubuntu 16.04 and 18.04.


DEPENDENCIES
------------

To compile the image tools we need
- libpng
- libtiff
- libjpeg
- libfftw

In addition, we also use ffmpeg to extract the frames from the downloaded videos.

COMPILATION
-----------

The code is compilable on Unix/Linux (probably on Mac OS as well, but we didn't test). 
We provide a simple Makefile to compile the C code.
```
$ cd imscript-lite && make && cd ..
```

USAGE
-----

```$ ./generate-dataset.sh```

