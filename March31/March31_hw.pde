float x;
float y;
float easing = 0.05;

color bgColor;
color shapeColor;
float bgHue = 360;
float shapeHue = 600;

boolean stop = false; //boolean variable to make everything stop

void setup() {
  size(700, 500); //sets size for canvas
  background (25, 25, 25); //generates canvas' color as black
  noStroke();  //sets no border color around canvas
  colorMode(HSB, 360, 100, 100); //setting the maximum for hue, saturation, brightness
  bgColor = color(0, 5); // color black
  shapeColor = color(0, 0, 100); // color white
  
  // generate text: "Click to pause and continue!"
  textSize(15);
  fill(255);
  text("Click to pause and continue!", 10, 20); 
  
  // generate text: "Press c to clear everything!"
  textSize(15);
  fill(255);
  text("Press c to clear everything!", 10, 35); 
  
  // generate text: "Press space to change background color!"
  textSize(15);
  fill(255);
  text("Press space to change background color!", 10, 50); 
}

void draw() { 
  if (stop)  {
    // if c is pressed, then canvas clears
    if (keyPressed) { 
      if (key == 'c') {
        setup();
        }
      // if space is pressed then background color changes 
      if (key == ' '){
        bgHue += 25; 
        bgColor = color(bgHue % 360, 100, 100, 5);
        //// tried changing the color of the rectangle but when did, the rectangle became not clearly visible to the eye due to the color of the background clashing with the color of the shape
        //shapeHue += 25;
        //shapeColor = color(shapeHue % 360, 100, 100, 5);
      }
    }
  
    // enables for rectangles to appear in the screen depending on where the mouse is by calculating the difference between the position of the symbol and the cursor
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;
  
    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;
  
    noStroke(); // no lines or borders around the shape
    fill(bgColor); //fade by playing around with opacity
    rect(0, 0, width, height); // creates a rectangle that covers the whole screen
    
    if(frameCount%5 == 0){ // creates delay between rectangles appearing by making rectangles every 5 frames
      pushMatrix(); // settings such as fill and stroke will reset 
      noFill(); // no fill in the shape so its no color
      stroke(shapeColor);
      translate(x, y);
      rect(0, 0, random(50, 150), random(5,150));
      popMatrix(); // settings will be brought back
    }
    // generates rectangles of different sizes randomly in the background (not affected by the cursor)
    translate(x, y);
    noFill();
    stroke(shapeColor);
    rect(random(width), random(height), random(50, 200), random(5,200));
  }
}

// when mouse clicked, everything will stop so that you could take a screenshot if it is to your liking
void mousePressed() {
  if (stop) {
    stop = false;
  } else {
    stop = true;
  }
}
  
//References:
// https://www.youtube.com/watch?time_continue=330&v=_NJqfZUQ3i4&feature=emb_logo
// https://processing.org/reference/stroke_.html
// https://processing.org/examples/easing.html
// https://processing.org/reference/noFill_.html
// https://www.youtube.com/watch?v=spGP0B8SGnk
// https://processing.org/tutorials/transform2d/
