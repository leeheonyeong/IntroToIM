PImage peacock;

void setup() {
  size(513, 340);
  peacock=loadImage("peacock.jpg");
}

void draw() {
  loadPixels();
  peacock.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x+y*width; //particular pixel location
      float b = brightness(peacock.pixels[loc]); //getting the brightness of the peacock's pixel at a given location
      if (b > mouseX) { //make all the pixels white if the brightness of the peacock pixel is greater than mouseX so the threshold is the value of mouseX
        pixels[loc] = color(255); //make a pixel white
      } else { //make all the pixels black if the brightness of the peacock pixel is less than mouseX
        pixels[loc] = color(0); // make a pixel black
      }
    }
  }
  updatePixels();
}

// References
// https://www.youtube.com/watch?v=j-ZLDEnhT3Q (The Coding Train)
// https://www.youtube.com/watch?v=qB3SA43vKYc (The Coding Train)
// https://processing.org/reference/brightness_.html

