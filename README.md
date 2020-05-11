# Colored Letter Filter

A small project where I experimented with an image filter.

This sketch loads images placed in the sketch folder and applies a "colored-letter" filter to it.
The filter works by getting the pixel values each pixel in the image, then generating an array of
letters that are then drawn on the screen, where the color of the letter matches the color of the 
pixel where it is drawn.

The program has two settings, random and constant. The random setting dictates whether the images
are displayed sequentially or randomly. The constant setting is a mode where the letters on the 
screen change constantly, giving it a dynamic effect, or are set just once.

Pressing the 'r' key toggles randomness, and pressing the 'c' key toggles the constant mode.

All images used are obtained via google images.
