/* CO-VID19 Data Visualization (Final Project)
*  HeonYeong(Andy) Lee
*  17th May 2020
*  Intro to IM
*/

float angle;

Table table; //table object loads a tabular data like csv files
float r = 200; //makes the radius a global variable

PImage earth; // nasa image of Earth
PShape globe; // sphere that represents our rotating globe
PImage webImg; //coronavirus image

int[] button = new int[10];
int col=255;

PImage mapimg; // 2d mapbox image of earth

int clat = 0;
int clon = 0;

int ww = 1024;
int hh = 512;

int zoom = 1;
String[] casesno;

//Formulas from the web mercator Wikipedia Page
float mercX(float lon) {
  lon = radians(lon);
  float a = (256 / PI) * pow(2, zoom);
  float b = lon + PI;
  return a * b;
}

//Formulas from the web mercator Wikipedia Page
float mercY(float lat) {
  lat = radians(lat);
  float a = (256 / PI) * pow(2, zoom);
  float b = tan(PI / 4 + lat / 2);
  float c = PI - log(b);
  return a * c;
}

void setup() {
  size(1600, 900, P3D); //P3D allows for a 3D renderer
  earth = loadImage("earth.jpg"); //access for the earth.jpg file in the computer's memory
  table = loadTable("https://data.humdata.org/hxlproxy/api/data-preview.csv?url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv&filename=time_series_covid19_confirmed_global.csv", "header"); //added header because the first row is a header in the csv file


  noStroke();
  globe = createShape(SPHERE, r*1.3); //creates an object that is a sphere and has a radius of r and multiplied by 1.3 to make the sphere bigger
  globe.setTexture(earth); //sets the earth.jpg to auto-texture the sphere

  String url = "https://www.wilsoncenter.org/sites/default/files/styles/embed_text_block/public/media/uploads/images/shutterstock_1662701254.jpg";
  // Load image from a web server (coronavirus background)
  webImg = loadImage(url, "jpg");

  button[0]=70; //x-coordinate of the green button
  button[1]=300; //y-coordinate of the green button
  button[2]=200; //width of the green button
  button[3]=50; // height of the green button
  button[4]=0; //button off(0) and on(1) state 

  button[5]=70; //x-coordinate of the blue button
  button[6]=700; //y-coordinate of the blue button
  button[7]=200; //width of the blue button
  button[8]=50; // height of the blue button
  button[9]=0; //button off(0) and on(1) state 
}

void draw() {
  background(0);
  imageMode(CORNER);
  webImg.resize(width, height); // resize the coronavirus background image to fit the canvas size
  image(webImg, 0, 0); //loads the coronavirus background image
  //webImg.resize(width, height); // resize the coronavirus background image to fit the canvas size
  pushMatrix();
  
  // draws the text desired in red and in text size 35
  fill(255, 0, 0);
  noStroke();
  textSize(35); 
  text("Updated CO-VID19 Data Visualization", 30, 30);

  // draws the text desired in green and in text size 25
  fill(0, 255, 0);
  noStroke();
  textSize(25);
  text("Click on the green button to view a 3d data visualization of the number of confirmed cases in each country", 30, 55);

  // draws the text desired in blue and in text size 25
  fill(0, 0, 255);
  noStroke();
  textSize(25);
  text("Click on the blue button to view a 2d data visualization of the number of confirmed cases in each country", 30, 80);
  popMatrix();

  // draws the green button
  fill(0, 255, 0);
  stroke(0);
  rect(button[0], button[1], button[2], button[3]);

  // draws the blue button
  fill(0, 0, 255);
  stroke(0);
  rect(button[5], button[6], button[7], button[8]);
  
  // if green button is pressed
  if (button[4]==1) {
    translate(width*0.5, height*0.5); //translating to the middle of the canvas so moves the center from (0,0) to the center of the canvas
    rotateY(angle);
    angle += 0.01; // controls the speed of the rotation

    // generate text: "COVID-19 Infected Cases Around The Globe"
    textSize(15);
    fill(255);
    text("                                                    COVID-19 Infected", 10, 5); //had to create this much space so that the text would be visible
    text("                                                    Cases Around", 10, 15); //had to create this much space so that the text would be visible
    text("                                                    The Globe", 10, 25); //had to create this much space so that the text would be visible

    lights(); //creates shading for like a 3d effect
    fill(200); //fills in with the color gray
    noStroke(); // no border line
    shape(globe); //creates the globe object into the scene

    for (TableRow row : table.rows()) {
      float lat = row.getFloat("Lat"); // gets the values in the column named Lat (short for latitude)
      float lon = row.getFloat("Long"); // gets the values in the column named Long (short for longitude)
      float confirmed = row.getFloat("5/14/20"); //change the date to when you are running the code because the csv file gets updated daily

      //imporant to note: altitude is between -180 and 180 deg
      float theta = radians(lat);
      float phi = radians(lon) + PI;

      // Retrieving the Cartesian coordinates by flipping the y & z axes from math notation of spherical coordinates
      // Wikipedia: https://en.wikipedia.org/wiki/Spherical_coordinate_system
      float x = r * 1.3 * cos(theta) * cos(phi); 
      float y = -r * 1.3 * sin(theta);
      float z = -r * 1.3 * cos(theta) * sin(phi);

      PVector pos = new PVector(x, y, z); //this position vector is the vector that points out from the center since the pos is equal to PVector x,y,z  26:00

      float h = (confirmed/100); // since the number of confirmed cases signficantly vary between countries, I chose to divide the number of confirmed cases by a 100
      float maxh = (140000); // consider the upper bound of infected value to 140,000
      h = map(h, 0, maxh, 10, 5000); // map the ones that have the highest infected value to the upper bound of the value's target range(5000) 
      // and the lowest infected value to the lower bound of the value's target range(10) ones to 10
      PVector xaxis = new PVector(1, 0, 0);
      float angleb = PVector.angleBetween(xaxis, pos); // angleBetween returns a float 
      // establish a vector that the boxes will rotate around
      PVector raxis = xaxis.cross(pos); 

      pushMatrix(); //saves the current transformation state
      translate(x, y, z); //translation 
      rotate(angleb, raxis.x, raxis.y, raxis.z); //performs the rotation
      fill(255, 0, 0); //fill with color red
      box(h, 5, 5); // drawing a cube, actually more like a right rectangular prism and also the extrusion along the x-axis by using h 
      popMatrix(); //restores the transformation state
    }
    webImg.resize(width, height); // resize the coronavirus background image to fit the canvas size
  }
  
  // if blue button is pressed
  if (button[9]==1) {
    // The clon and clat in this url are edited to be in the correct order.
    String url = "https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/" +
      clon + "," + clat + "," + zoom + "/" +
      ww + "x" + hh +
      "?access_token=pk.eyJ1IjoibGVlaGVvbnllb25nIiwiYSI6ImNrOHl5ajAwZDFlN2YzZ29rM2ZtbGIwZTkifQ.5O3w9k8dAY2di-V_Zg0dtg";
    mapimg = loadImage(url, "jpg");

    println(url);
    // earthquakes = loadStrings("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.csv");
    casesno = loadStrings("https://data.humdata.org/hxlproxy/api/data-preview.csv?url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv&filename=time_series_covid19_confirmed_global.csv");

    translate(width / 2, height / 2);
    imageMode(CENTER);
    image(mapimg, 0, 0);

    float cx = mercX(clon);
    float cy = mercY(clat);

    for (int i = 1; i < casesno.length; i++) {
      String[] data = casesno[i].split(",");
      //console.log(data);
      float lat = float(data[2]); //gets the values in the column named Lat (short for latitude)
      float lon = float(data[3]); // gets the values in the column named Long (short for longitude)
      float confirmed = float(data[117]); //change the column number to when you are running the code because the csv file gets updated daily
      float x = mercX(lon) - cx;
      float y = mercY(lat) - cy;
      // This addition fixes the case where the longitude is non-zero and
      // points can go off the screen.
      if (x < - width/2) {
        x += width;
      } else if (x > width / 2) {
        x -= width;
      }
      float h = (confirmed/100);
      float magmax = sqrt(pow(10, 10));
      float d = map(h, 0, magmax, 0, 300);
      stroke(255, 0, 0); // sets the stroke of the red circles as red
      fill(255, 0, 0, 200); // sets the color of the circle as red and the opacity as 200
      ellipse(x, y, d, d);
    }
    webImg.resize(width, height); // resize the coronavirus background image to fit the canvas size
  }
}

void mousePressed() {
  button[4]=0; //green button state is off
  if ((mouseY<(button[1]+button[3]))&&(mouseY>(button[1]))) { //but when the mouse is pressed inside the green rectangle,
    if ((mouseX<(button[0]+button[2]))&&(mouseX>(button[0]))) { //but when the mouse is pressed inside the green rectangle,
      button[4]=1; // the green button state becomes on
      col=20; 
    }
  }
  button[9]=0; //blue button state is off
  if ((mouseY<(button[6]+button[8]))&&(mouseY>(button[6]))) { //but when the mouse is pressed inside the blue rectangle,
    if ((mouseX<(button[5]+button[7]))&&(mouseX>(button[5]))) { //but when the mouse is pressed inside the blue rectangle,
      button[9]=1; // the blue button state becomes on
      col=20;
    }
  }
}

//References
// https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html
//https://en.wikipedia.org/wiki/Spherical_coordinate_system
//https://processing.org/reference/translate_.html
//https://processing.org/reference/fill_.html
//https://processing.org/reference/PVector.html
//https://www.wilsoncenter.org/sites/default/files/styles/embed_text_block/public/media/uploads/images/shutterstock_1662701254.jpg
//https://visibleearth.nasa.gov/collection/1484/blue-marble
//https://data.humdata.org/hxlproxy/api/data-preview.csv?url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv&filename=time_series_covid19_confirmed_global.csv
//https://en.wikipedia.org/wiki/Spherical_coordinate_system
//https://processing.org/reference/translate_.html
//https://processing.org/reference/fill_.html
//https://covid.ourworldindata.org/data/owid-covid-data.csv
//https://github.com/wizord-gaming/youtube/blob/master/button/button.pde
//https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/-122.4241,37.78,14.25,0,60/600x600?access_token=pk.eyJ1IjoibGVlaGVvbnllb25nIiwiYSI6ImNrOHl5ajAwZDFlN2YzZ29rM2ZtbGIwZTkifQ.5O3w9k8dAY2di-V_Zg0dtg
//https://docs.mapbox.com/api/maps/#static-images
//https://en.wikipedia.org/wiki/Web_Mercator_projection
