## Data Visualization

**Introduction**

For this assignment, our professor asked us to create either a data visualization or a generative text. I was intrigued with
the idea of creating a data visualization because in our last class, we were taught how to fetch data from the Internet in the 
form of a csv file to create a, somewhat, of an artistic piece that express the data selected. I looked through the Internet 
to see what kind of data I could use and in which form I wanted to express it in. The first thing I came across was this video 
by TheCodingTrain (Daniel Shiffman from NYU) in which he created an Earthquake Data Visualization. I really liked his idea of 
using magnitude of the earthquakes around the world and the way he arranged the box shapes (representing an
earthquake) depending on the the latitude and longitude of where the earthquakes occured. That is when I came up an idea to
use the public data on the Internet of the number of infected cases of COVID-19. 

**Process**

After I decided what I was going to do, I first needed to understand the concept behind how Professor Shiffman made it
possible for his earthquake boxes to appear in the exact location of the globe by using the longitude and latitude coordinates
from the csv file he chose. Professor Shiffman explained really well in his 40 minute video in how he did that by using 
formulas as shown:
"The Cartesian coordinates may be retrieved from the spherical coordinates (radius r, inclination θ, azimuth φ), where 
r ∈ [0, ∞), θ ∈ [0, π], φ ∈ [0, 2π), by"

![](https://i.imgur.com/gaLtJ7Q.png)

Source: Wikipedia

So what this does is calculate the locations for where the boxes representing the number of infected cases of COVID-19 in
each country should be in the globe. He also pinpointed something very important in the video which was the measurements of 
each values were, since the values in the code consists of values being in radians and degrees. 

I also used the power function to help in representing the number of infected cases per country through the height of the 
boxes, which is something that was mentioned by Professor Shiffman.

The other things that had to be done was add a texture to the globe as it will appear as just a plain sphere rotating. NASA
provides a lot of Earth maps along with topographies so all that was needed to pick one image and get the dimensions of the 
image.

I also added a text and a background which was fairly simple by looking through the processing website on text() and 
loadImage(). 

Something that I want to add is how I unintentionally made the text also rotate from the center of the globe which I found
to be really cool. 

**Challenges**

My main challenge in this code was that the height of the boxes do not accurately represent the number of infected cases. For
some bizarre reason, the boxes all look to be the same height as one another and some boxes seem to not appear within the 
globe, despite the longitue and latitude coordinates existing in the csv file.

**Images and Video**

You could watch my project for this assignment in this short [video](https://youtu.be/q03zNv2bxUE).

Here is a screenshot of what my assignment looked like:
![](https://i.imgur.com/tOU3spc.png)

**References**

//https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html

//https://en.wikipedia.org/wiki/Spherical_coordinate_system

//https://processing.org/reference/translate_.html

//https://processing.org/reference/fill_.html
