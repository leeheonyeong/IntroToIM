## Recreating an Old Computer Art

**Introduction**

For this assignment, our professor asked us to recreate an old computer art from an issue of 
“Computer Graphics and Art” [Triangulation has a bunch of the old issues of the magazine as pdfs](http://recodeproject.com/).
He told us that it does not have to be an exact duplicate and that we could make it dynamic, if we wished to.
He also provided us with 3 more sources to inspire us in what we should create for this assignment:

• [1st source](http://dada.compart-bremen.de/docUploads/COMPUTER_GRAPHICS_AND_ART_Aug1977.pdf)

• [2nd source](http://dada.compart-bremen.de/docUploads/ProgrammInformation21_PI21.pdf)

• [2nd source](http://dada.compart-bremen.de/docUploads/ProgrammInformation21_PI21.pdf)

**Process**

For this assignment, I tried to replicate an art created by Herbert Franke called "Random Squares." This is how it looks like:
![](https://i.imgur.com/hPUTIiF.png)

Therefore, my first idea was when I run the code, it will create rectangles of different sizes across the canvas. But this idea
seemed a bit boring so, unlike like the original art piece, I added a little twist of my own which was enabling the user to interact 
with the art by moving the cursor around. The user will be able to move the cursor around the board which will create a trail of
rectangles of different sizes. With this idea in mind, I still decided to leave some features of the original art in to my
project which was generating random rectangles of different sizes across the board. This was possible by using the random function
for both the size of the rectangle(height and width) and the position of where they generate. I also decided to use the knowledge 
I have in using RGB and HSB colors to change the background color whenever space is pressed. 

I tried to also change the color of the border of the rectangles but this turned out be harder than I thought. By using similar 
functions to what I did for changing the background color, the rectangles became not clearly visible to the eye due to the color 
of the background clashing with the color of the shape. This means that rectangles were still generated across the canvas but it was
too hard to be seen because of the nofill function I used for the rectangles. If the nofill function was removed for the rectangles,
the rectangles were more visible but that was not I was going for so I decided to stick to the color white for the border color of the
rectangles.

I also added a code that when you click the mouse, everything in the screen stops(freeze) so that the user could take a screenshot
of the art when the rectangles are positioned to their liking. Something small that I also added was a key to clear everything in the 
screen and start over.

**Images and Video**

You could watch my project for this assignment in this short [video](https://youtu.be/1INdZ3HvWRw).

These are some of the art pieces I created while playing around with my code:
![](https://i.imgur.com/04aP39T.png)

![](https://i.imgur.com/HMJjFJR.png)

**References**
https://www.youtube.com/watch?time_continue=330&v=_NJqfZUQ3i4&feature=emb_logo
https://processing.org/reference/stroke_.html
https://processing.org/examples/easing.html
https://processing.org/reference/noFill_.html
https://www.youtube.com/watch?v=spGP0B8SGnk
https://processing.org/tutorials/transform2d/
