## COVID-19 Data Visualization

**Introduction**

For my final project, I decided to improve on my previous data visualization assignment. As mentioned in the README file that
I created for that assignment, there were some problems that I encountered. One of the problems was that the data from the csv 
file were not accurately presented at the globe. This posed to be a big problem as the main goal of my assignment was to 
display the data correctly. Therefore, I will be fixing this problem, and I will also add some more features such as a main
menu screen and an alternative way to view the data which was to display a bar graph of the number of infected cases in each 
country. This will allow the user to decide how the data should be displayed. 

However, one thing I realized that I might not be able to do is to create bar graph for an alternative way to view the data I
obtained through a csv file. The reason for that was because there were exactly 266 rows of countries/regions and the number
of confirmed CO-VID 19 cases in some countries varied greatly. For example, if we take USA and Comoros, the number of 
confirmed CO-VID 19 cases in the US is around 1.4 million and in Comoros it is only 11 in the time I am documenting this. 
Therefore, I asked my professor if a 2d data visualization of the number of confirmed cases in each country is okay instead
of doing a bar graph and he approved it.

**Process**

The first thing I did was fix the problem that I was not able to solve on my previous data visualization assignment which was
the numbers of confirmed cases not displaying properly on the rotating globe. It turned out that the way I used the map 
function was wrong. The first parameter of the map function is a "float: the incoming value to be converted"(from Processing
Reference Page). For that value, I had used the pow function previously for the values of confirmed cases which explained
the similar sizes of boxes that are drawn on the globe. Since I knew the problem, I played around with different numbers. 
Eventually, I figured out that dividing the number of confirmed cases by a 100 solved the problem. After I was able to fix 
this major problem, I moved on to working on my 2d data visualization.

Daniel Shiffman made a video on creating a 2d data visualization as well so I referenced my work on what he did. The only 
problems I faced was using mapbox and scaling the red circles(used to display the number of confirmed cases in each country
through the size of the circles depending on the latitude and longitude of the area)on the 2d image of earth. After surfing 
through the mapbox webpage for few hours, I eventually figured out how to display the mapbox image on my sketch. The next part
was to scale the red circles with some math. As mentioned earlier, the number of confirmed cases in each country vary greatly
so what I did was the use the same solution I used on my 3d data visualization. This fixed the problem.

Both of these data visualizations required a lot of math especially since the boxes and red circles have to be mapped on the
right position whether it is a sphere or 2d image of Earth depending on their longitude and latitude. Daniel Shiffman explains
really well in both of the videos in why we need to use formulas such as the Web Mercator Formulas for the 2d data 
visualization:

![](https://i.imgur.com/vYpxSY0.png)

and the Cartesion Coordinate Formulas for the 3d data visualization:

![](https://i.imgur.com/gaLtJ7Q.png)

The last thing I needed to do was to create a main menu screen that explains what my project does and 2 sepearate buttons that
displays either the 2d data visualization or the 3d data visualization. This was fairly simple as there plenty of videos 
online how to create a button in Processing.

**Images and Video**

You could watch my project for this assignment in this short [video](https://youtu.be/S05hw3ojCKE).

This is how my final project looked like:

Main Screen
![](https://i.imgur.com/XuntxRF.png)

3d data visualization of the number of confirmed cases in each country
![](https://i.imgur.com/pGlH16K.png)

2d data visualization of the number of confirmed cases in each country
![](https://i.imgur.com/rC5SFeU.png)


### References

Processing references:

- https://processing.org/reference/translate_.html

- https://processing.org/reference/fill_.html

- https://processing.org/reference/PVector.html

Images:

- https://www.wilsoncenter.org/sites/default/files/styles/embed_text_block/public/media/uploads/images/shutterstock_1662701254.jpg

- //https://visibleearth.nasa.gov/collection/1484/blue-marble

- https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/-122.4241,37.78,14.25,0,60/600x600?access_token=pk.eyJ1IjoibGVlaGVvbnllb25nIiwiYSI6ImNrOHl5ajAwZDFlN2YzZ29rM2ZtbGIwZTkifQ.5O3w9k8dAY2di-V_Zg0dtg

- https://docs.mapbox.com/api/maps/#static-images

Data:

- https://data.humdata.org/hxlproxy/api/data-preview.csv?url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv&filename=time_series_covid19_confirmed_global.csv

- https://covid.ourworldindata.org/data/owid-covid-data.csv

Code to create button:

- https://github.com/wizord-gaming/youtube/blob/master/button/button.pde

Wikipedia Pages Used to Obtain the Formualas:

- https://en.wikipedia.org/wiki/Web_Mercator_projection

- https://en.wikipedia.org/wiki/Spherical_coordinate_system

- https://en.wikipedia.org/wiki/Spherical_coordinate_system

Tutorial on How to Create the Data Visualizations:

- https://thecodingtrain.com/CodingChallenges/057-mapping-earthquake-data.html

- https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html
