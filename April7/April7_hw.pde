int _num = 10;

Circle[] _circleArr = {}; //array created to store all the circles

void setup() {
  size(1450, 870); //sets size for canvas
  background(255);
  strokeWeight(1);
  smooth(); //Draws all geometry with smooth (anti-aliased) edges
  fill(150, 50);
  drawCircles();
}

//each circle is given a factor in movement in terms of x and y coordinates
void draw() {
  background(102, 102, 153); //generates canvas' color as purple
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
  // generate text: "Click to draw circles!"
  textSize(15);
  fill(255);
  text("Click to draw circles!", 10, 20);
}

//when mouse pressed, traces the number of circles generated and displays in console
void mouseReleased() {
  drawCircles();
  println(_circleArr.length);
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle(); //calling the obstructor with the new keyword created
    thisCirc.drawMe(); //calls the method after creating the object
    _circleArr = (Circle[])append(_circleArr, thisCirc); //adds objects to the array
  }
}

//Creating a circle class so that there is no need to create different circles, making it reusable
class Circle {
  //Object properties
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove; //steps to move every frame
  //Object constructor
  Circle () {
    x = random(width); //assigning x to be a random integer of the width of the board size
    y = random(height); //assigning y to be a random integer of the height of the board size
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    //Object's color and alpha
    //random steps
    alph = random(255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  // Object method
  void drawMe() {
    noStroke(); //sets no border color around canvas
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2); //makes the ellipse to be generated at random places and of different sizes by manipulating the radius
    stroke(linecol, 150);
    noFill(); //sets no border color around canvas
    rect(x, y, 10, 10);
  }

  void updateMe() {
    //moves every frame
    x += xmove;
    y += ymove;
    //wraps position at stage edges
    if (x > (width+radius)) { 
      x = 0 - radius;
    }
    if (x < (0-radius)) { 
      x = width+radius;
    }
    if (y > (height+radius)) { 
      y = 0 - radius;
    }
    if (y < (0-radius)) { 
      y = height+radius;
    }

    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y); // calculates separation distance between circles center
        float overlap = dis - radius - otherCirc.radius; //calculates overlap
        //circles increases in opacity if not overlapping with other circles
        //circles fade when overlapping
        if (overlap<0) { 
          float midx, midy;
          //calculates midpoint of circles
          midx = (x+otherCirc.x)/2;
          midy = (y+otherCirc.y)/2;
          stroke(0, 100);
          noFill();
          overlap*=-1;   
          rect(midx, midy, overlap, overlap);
        }
      }
    }
    //Draws
    drawMe();
  }
}

//References
//Matt Pearon
//https://processing.org/reference/smooth_.html
//https://processing.org/reference/ellipse_.html
//https://processing.org/reference/rect_.html
//https://processing.org/tutorials/objects/
//https://www.youtube.com/watch?v=lmgcMPRa1qw
