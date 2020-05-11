/*
This sketch loads images placed in the sketch folder and applies a "colored-letter" filter to it.
The filter works by getting the pixel values each pixel in the image, then generating an array of
letters that are then drawn on the screen, where the color of the letter matches the color of the 
pixel where it is drawn.

The program has two settings, random and constant. The random setting dictates whether the images
are displayed sequentially or randomly. The constant setting is a mode where the letters on the 
screen change constantly, giving it a dynamic effect, or are set just once.

Pressing the 'r' key toggles randomness, and pressing the 'c' key toggles the constant mode.

All images used are obtained via google images.


Author: Arnav Mundkur (Github: arnavmundkur95)
Date: 10/05/2020
*/


ArrayList<PImage> images;
PFont font;
int size;
String path;
int w, h, index;
boolean constant;
boolean random;

void setup() {
  path = sketchPath() + "\\images\\";
  size(1200, 800, P2D);
  images = getPics(path);
  constant = false; // Change this to have a dynamic effect where the letters on the screen constantly change
  random = true; // Change this to iterate through the list sequentially or randomly
  w = 1200;
  h = 800;
  size = 19; 
  font = createFont("Arial", size, true);
  index = 0;
  showPicture(index);
}

void draw() {
  if (constant) {
    showPicture(index);
  }
}

// Function changes the image displayed
void nextImage() {
  if (random) {
    index = (int)random(images.size());
  } else {
    index++;
    if (index == images.size()) {
      index = 0;
    }
  }
  showPicture(index);
}


// Function displays the letters with their colors on the screen
void showPicture(int index) {
  PImage temp = images.get(index);
  temp.resize(w, h);

  char[] letters = new char[temp.pixels.length];
  for (int i = 0; i < letters.length; i++) {
    letters[i] =  char(int(random(65, 123)));
  }

  background(0);
  for (int i = 0; i < letters.length; i++) {
    if (i % (size + 50 /*+50*/) == 0) {
      writeLetter(letters[i], i%width, i/width, temp.get(i%width, i/width), size);
    }
  }
}


// Function to draw the letter on a screen where the position, color and size are parameters
void writeLetter(char letter, int x, int y, color z, int size) {
  textFont(font, size);                  // STEP 3 Specify font to be used
  fill(z);                         // STEP 4 Specify font color 
  text(letter, x, y);   // STEP 5 Display Text
}


// Function to retrieve the images located in the sketchfolder
ArrayList<PImage> getPics(String dir) {
  File file = new File(dir);
  ArrayList<PImage> pics = new ArrayList();
  if (file.isDirectory()) {
    String names[] = file.list();
    for (String s : names) {
      pics.add(loadImage(dir + s));
    }
    return pics;
  } else {
    return null;
  }
}

// Function to handle input to go to the next image
void keyPressed() {
  if(keyPressed && key=='r' || key=='R'){
    random = !random;
  } 
  else if(keyPressed && key=='c' || key=='C'){
   constant = !constant; 
  }
  else{
    nextImage();
  }
}
