## Dancing Sunflower

**Introduction**

This was midterm project for the course Intro to Interactive Media.
Our professor asked us to make something whimsical, delightful, surprising, wonderful, or fun.
Through watching videos on youtube, I was inspired to create a sunflower that moves to the side
where the light is shone (just like how a real sunflower moves to face where the sunlight is 
shining from). A RGB LED is also attached to the sunflower so that the user can control which 
color the user wants.

**Overall Project Concept**

In my work, I have used one servo motor, two photoresistors, three potentiometers and one RGB LED.
The inputs being the two photoresistors and three potentiometers and the outputs being the RGB LED
and the servor motor. The photoresistors are each placed on both sides of the box so that when the user
shines light on one side, the servomotor(which was coded to rotate 180degrees and 0degrees depending on 
the photoresistor receiving the most light) will rotate the sunflower to face towards the side where the light
is shining from. Three potentiometers were needed to make the RGB LED functional as it has three cathodes:
Red, Blue, and Pure Green.

**Description of How the Circuit and the Code Accomplish the Concept**

I was able to achieve this through using if and else statements to allow for the servo motor to rotate 180degress
when light is shone on one potentiometer and 0degree when the light is shone on the second potentiometer.
Moreover, for the servo, I looked at the example code of "knob" to include lines such as : #include <Servo.h>.
I also used soldering for the first time and this helped a lot me to accomplish my goal. Through soldering,
I was able to create a project with height because soldering enables you to have longer wires.

**Process**

What I first did was to draw a prototype of how I envisioned my final product to look like. The next thing I did was 
to first connect all the circuits including the inputs and the outputs on to my Arduino to see if they work along with 
the code. After knowing that everything worked, I then proceeded to solder the wires one by one and test each time to 
see if I soldered things properly. After making some wires to a length that I could work with, I got the measurements of my 
redboard and breadboard to make the inside of my container spacious enough to work with. After collecting the measurements,
I moved on to make my container using hot glue and tape. After the box was made, I decorated it by printing grass pictures 
to tape it around the sunflower.

**Problems and Solutions**

While making this, I encountered multiple problems. One of the problems was that when you solder the LED with a solid
wire first, it would make it really hard for the servo motor to move the sunflower as the LED is attached to the sunflower.
This caused the RGB LED wires to pop out of the breadboard whenever the servomotor turned. To fix this problem, I changed
the solid wires to stranded wires since stranded wires are very flexibile unlike the solid wires. 

The other problem was a careless mistake of mine. I thought that when you increase the temperature of the welding iron 
heating tool used to solder more than 350 degrees celsius, it would make my job much easier since the solder wire would melt
much quicker and easily. However, this backfired and I learned a lesson as my stranded wires had burnt causing some of the stuff
I soldered to not be functionable. Therefore, I had to solder all my stuff all over again which costed me a great amount of time.

One thing I learned was that the "Servo library supports up to 12 motors on most Arduino boards and 48 on the Arduino Mega. 
On boards other than the Mega, use of the library disables analogWrite() (PWM) functionality on pins 9 and 10, 
whether or not there is a Servo on those pins." - Arduino.cc

The other thing I learnt was how crucial it is to do layering when connecting stranded wires to solid wires as it prevents short circuits.

The other problem that I faced was that sometimes when you are stuck in a pit of not knowing what is causing the problem. It is important
to check if everything works one by one and that also includes the Arduino Redboard as mine had problems with it and I knew it way later
due to the Arduino redboard being faulty did not cross my mind.

One valuable thing I learnt through this project was the importance of taking pictures of the circuits along the process. 
Mistakes can happen where your wires might just pop out of the breadboard and you will have to place them back in again. 
This happened to me as I was using servo motors which was attached to some materials which caused some wires to pop out since the
wires were not long enough. If you do not have a reference to look back to, then you will have to spend more time manually looking through
your drawn schematic and placing them in again when time could have been saved if a picture of the circuit was taken to look back
as a reference.

**Images and Video**

You could watch my project for this assignment in this short [video](https://youtu.be/A-rIq97NQ0Q).

This is the schematic of my circuit:
![](https://i.imgur.com/j6VZhP2.png)

This is how my overall project looked like:
![](https://imgur.com/G5NdXqU)
![](https://imgur.com/OII10kq)
![](https://imgur.com/bNmFJfW)

This is how my circuit looked like:
![](https://i.imgur.com/Rie1iJY.jpg)

This is how my code looked like:
![](https://i.imgur.com/SlMhceM.png)
![](https://i.imgur.com/wocn6xV.png)
![](https://i.imgur.com/Xb6uHPe.png)
