//Name: HeonYeong(Andy) Lee
//Last Edited: April 21, 2020
//Course: NYUAD Intro to IM

Rotater[] rotaters;

void setup() {
  size(640, 360);
  rotaters = new Rotater[200];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 50);
    //initiate with i for index
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
}

void draw() {
  background(255);
  stroke(random(255), random(255), random(255));
  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(rotaters);
  textSize(15);
  fill(0);
  text("Try Moving the Mouse First and then Press the Mouse While Moving It!", 10, 20);
  }
}


class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;
  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(30, 75);
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    //each rotater has a direction, make a coin flip initially to determine dir.
    direction=-1;
    float coinflip = random(1);
    if (coinflip>.5)
      direction=1;
  }

  void rotate() {
    //get cartesian coords from polar angle
    //add to center point of rotater to rotate around the actual spot
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    //same as normal: vel+=acc
    speed+=acceleration;
    //angle is our pos now, mult by our direction
    angle+=speed*direction;
    //dampen it a little
    speed*=.98;
    acceleration=0;
    //rect(x, y, 2, 2);
  }

  void distance(Rotater[] rotaters) {
    //check the mouse, if close enough add some acceleration
    checkMouse();
    //check distance with all rotaters, if close enough draw line
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {
          line(x, y, r.x, r.y);
        }
      }
    }
  }

  void checkMouse() {
    //if mouse is close enough give some acceleration
    if (dist(mouseX, mouseY, x, y)<100 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.05;
      speed*=1.15;
      if (mousePressed) {
        acceleration=.0009;
        speed*=0.5;
      }
    }
  }
}

// References:
// https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/drawing/connectedLines/connectedLines.pde
