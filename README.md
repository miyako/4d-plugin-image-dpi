# 4d-plugin-image-dpi

A study on how different image formats store DPI information. 

#### BMP 

* Read [``BITMAPFILEHEADER``](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader). Look at ``biSize``. If the size is 12, the header is ``BITMAPCOREHEADER``, the ancient type. No DPI information here. If the size is 40 or larger, the ``biXPelsPerMeter`` and ``biYPelsPerMeter`` fields are available.  

* Because the value is **metric**, DPI is an approximation.
