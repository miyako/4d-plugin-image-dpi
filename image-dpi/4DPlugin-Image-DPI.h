/* --------------------------------------------------------------------------------
 #
 #	4DPlugin-Image-DPI.h
 #	source generated by 4D Plugin Wizard
 #	Project : Image DPI
 #	author : miyako
 #	2020/06/20
 #  
 # --------------------------------------------------------------------------------*/

#ifndef PLUGIN_IMAGE_DPI_H
#define PLUGIN_IMAGE_DPI_H

#include "4DPluginAPI.h"
#include "4DPlugin-JSON.h"
#include "C_TEXT.h"
#include "tiffio.h"

typedef struct
{
    uint8_t *ptr;
    toff_t len;
    toff_t pos;
} tiff_src;

typedef struct
{
    std::vector<uint8_t> *buf;
    toff_t pos;
} tiff_dst;

#pragma mark -

void Set_image_DPI(PA_PluginParameters params);

#endif /* PLUGIN_IMAGE_DPI_H */