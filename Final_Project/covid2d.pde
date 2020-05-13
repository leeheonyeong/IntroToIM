PImage mapimg;

int clat = 0;
int clon = 0;

int ww = 1024;
int hh = 512;

int zoom = 1;
String[] earthquakes;


float mercX(float lon) {
  lon = radians(lon);
  float a = (256 / PI) * pow(2, zoom);
  float b = lon + PI;
  return a * b;
}

float mercY(float lat) {
  lat = radians(lat);
  float a = (256 / PI) * pow(2, zoom);
  float b = tan(PI / 4 + lat / 2);
  float c = PI - log(b);
  return a * c;
}


void setup() {
  size(1600, 900);
  // The clon and clat in this url are edited to be in the correct order.
  String url = "https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/" +
    clon + "," + clat + "," + zoom + "/" +
    ww + "x" + hh +
    "?access_token=pk.eyJ1IjoibGVlaGVvbnllb25nIiwiYSI6ImNrOHl5ajAwZDFlN2YzZ29rM2ZtbGIwZTkifQ.5O3w9k8dAY2di-V_Zg0dtg";
  mapimg = loadImage(url, "jpg");
  println(url);
  // earthquakes = loadStrings("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.csv");
  earthquakes = loadStrings("https://data.humdata.org/hxlproxy/api/data-preview.csv?url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv&filename=time_series_covid19_confirmed_global.csv");
  


  translate(width / 2, height / 2);
  imageMode(CENTER);
  image(mapimg, 0, 0);

  float cx = mercX(clon);
  float cy = mercY(clat);

  for (int i = 1; i < earthquakes.length; i++) {
    String[] data = earthquakes[i].split(",");
    //console.log(data);
    float lat = float(data[2]);
    float lon = float(data[3]);
    float confirmed = float(data[112]);
    float x = mercX(lon) - cx;
    float y = mercY(lat) - cy;
    // This addition fixes the case where the longitude is non-zero and
    // points can go off the screen.
    if(x < - width/2) {
      x += width;
    } else if(x > width / 2) {
      x -= width;
    }
    //mag = pow(10, mag);
    //mag = sqrt(mag);
    float h = (confirmed/100);
    float magmax = sqrt(pow(10, 10));
    float d = map(h, 0, magmax, 0, 300);
    stroke(255, 0, 0);
    fill(255, 0, 0, 200);
    ellipse(x, y, d, d);
  }
}

 //https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/-122.4241,37.78,14.25,0,60/600x600?access_token=pk.eyJ1IjoibGVlaGVvbnllb25nIiwiYSI6ImNrOHl5ajAwZDFlN2YzZ29rM2ZtbGIwZTkifQ.5O3w9k8dAY2di-V_Zg0dtg
 //https://docs.mapbox.com/api/maps/#static-images
 //map projection wikipedia
