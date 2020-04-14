float angle;

Table table; //table object loads a tabular data like csv files
float r = 200; //makes the radius a global variable

PImage earth; // nasa image of Earth
PShape globe; // sphere that represents our rotating globe
PImage webImg; //coronavirus image

void setup() {
  size(600, 600, P3D); //P3D allows for a 3D renderer
  earth = loadImage("earth.jpg"); //access for the earth.jpg file in the computer's memory
  table = loadTable("https://data.humdata.org/hxlproxy/api/data-preview.csv?url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv&filename=time_series_covid19_confirmed_global.csv", "header"); //added header because the first row is a header in the csv file

  noStroke();
  globe = createShape(SPHERE, r); //creates an object that is a sphere and has a radius of r
  globe.setTexture(earth); //sets the earth.jpg to auto-texture the sphere
  
  String url = "https://www.wilsoncenter.org/sites/default/files/styles/embed_text_block/public/media/uploads/images/shutterstock_1662701254.jpg";
  // Load image from a web server
  webImg = loadImage(url, "jpg");
}

void draw() {
  background(0);
  image(webImg, 0, 0); //loads the coronavirus background image
  translate(width*0.5, height*0.5);
  rotateY(angle);
  angle += 0.01; // controls the speed of the rotation
  
  // generate text: "COVID-19 Infected Cases Around The Globe"
  textSize(15);
  fill(255);
  text("                                        COVID-19 Infected", 10, 5); //unintentional but looks cool
  text("                                        Cases Around", 10, 15); //unintentional but looks cool
  text("                                        The Globe", 10, 25); //unintentional but looks cool

  lights(); //creates shading for like a 3d effect
  fill(200); //fills in with the color gray
  noStroke(); // no border line
  shape(globe); //creates the globe object into the scene

  for (TableRow row : table.rows()) {
    float lat = row.getFloat("Lat");
    float lon = row.getFloat("Long");
    float confirmed = row.getFloat("4/13/20"); //change the date to when you are running to code because the csv file gets updated daily

    //imporant to note: altitude is between -180 and 180 deg
    float theta = radians(lat);
    float phi = radians(lon) + PI;

    // Retrieving the Cartesian coordinates by flipping the y & z axes from math notation of spherical coordinates
    // Wikipedia: https://en.wikipedia.org/wiki/Spherical_coordinate_system
    float x = r * cos(theta) * cos(phi);
    float y = -r * sin(theta);
    float z = -r * cos(theta) * sin(phi);

    PVector pos = new PVector(x, y, z); //this position vector is the vector that points out from the center since the pos is equal to PVector x,y,z  26:00

    float h = pow(10, confirmed);
    float maxh = pow(10, 600000); // consider the maximum of infected value of scale of 1000 instad of 7jdvlsdbvlsbdvs
    h = map(h, 0, maxh, 10, 1000); // map the ones that have a infectd value of 1000 to 100pixels and the lower ones to 10 //// map the ones that have the highest infectd value of 1000pixels and 100pixels for the lower ones to 10
    //25:00
    PVector xaxis = new PVector(1, 0, 0);
    float angleb = PVector.angleBetween(xaxis, pos); // angleBetween returns a float 
    // establish a vector that the boxes will rotate around
    PVector raxis = xaxis.cross(pos); 

    pushMatrix(); //saves the current transformation state
    translate(x, y, z); //translation 
    rotate(angleb, raxis.x, raxis.y, raxis.z); //performs the rotation
    fill(255); //fill with color white
    box(h, 5, 5); // drawing a cube, actually more like a right rectangular prism and also the extrusion along the x-axis by using h 
    popMatrix(); //restores the transformation state
  }
}

//References
// https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html
//https://en.wikipedia.org/wiki/Spherical_coordinate_system
//https://processing.org/reference/translate_.html
//https://processing.org/reference/fill_.html
