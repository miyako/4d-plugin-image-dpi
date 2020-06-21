# 4d-plugin-image-dpi

A study on how different image formats store DPI information. 

#### BMP 

* Read [``BITMAPFILEHEADER``](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader). Look at ``biSize``. If the size is 12, the header is ``BITMAPCOREHEADER``, the ancient type. No DPI information here. If the size is 40 or larger, the ``biXPelsPerMeter`` and ``biYPelsPerMeter`` fields are available. Set the resolution in pixels-per-metre.  

#### PNG

* Copy chunks as per [pngcrush](https://en.wikipedia.org/wiki/Pngcrush), except [tEXt/zTXt/iTXt], which trumps ``pHYs``. When setting the ``pHYs`` chunk, set the unit type to ``PNG_RESOLUTION_METER`` and set the resolution in pixels-per-metre. 

#### JPEG

* Copy markers as per [jpegoptim](https://en.wikipedia.org/wiki/Jpegoptim), except ``IPTC_JPEG_MARKER`` which trumps ``JPEG_APP0``. Set ``write_JFIF_header`` to ``false``. Set ``JPEG_APP0`` with ``jpeg_write_marker``, set density unit to 1 (inches) and the resolution in inches.

#### TIFF

* ``TIFFSetField`` the field ``TIFFTAG_RESOLUTIONUNIT`` to ``RESUNIT_INCH``, ``TIFFTAG_XRESOLUTION`` and ``TIFFTAG_YRESOLUTION`` in inches. Make sure to use ``float``.
