float angle;

Table table; //table object loads a tabular data like csv files
float r = 200; //makes the radius a global variable

PImage earth; // nasa image of Earth
PShape globe; // sphere that represents our rotating globe
PImage webImg; //coronavirus image

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
}

void draw() {
  background(0);
  image(webImg, 0, 0); //loads the coronavirus background image
  webImg.resize(width, height); // resize the coronavirus background image to fit the canvas size
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
    float lat = row.getFloat("Lat"); // // gets the values in the column named Lat (short for latitude)
    float lon = row.getFloat("Long"); // gets the values in the column named Long (short for longitude)
    float confirmed = row.getFloat("5/9/20"); //change the date to when you are running to code because the csv file gets updated daily

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
    fill(255, 0, 0); //fill with color white
    box(h, 5, 5); // drawing a cube, actually more like a right rectangular prism and also the extrusion along the x-axis by using h 
    popMatrix(); //restores the transformation state
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


// change background 36:17
// add texts like covid 19 global map
//processing lights and box but remove lights and rotate 
// challenge have to change the date everytime because the csv file shows the data not through a row called infected but through dates instead

//References
// https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html
//https://en.wikipedia.org/wiki/Spherical_coordinate_system
//https://processing.org/reference/translate_.html
//https://processing.org/reference/fill_.html
