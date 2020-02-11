**Digital Inputs and Outputs**

This was my second assignment for the course Intro to Interactive Media. 
Our professor asked us to create a circuit that combines multiple digital inputs and outputs. 
As we discussed in our previous class about some of the digital inputs in our kit, 
I decided to use the photoresistor instead of a switch in my assignment.

In my work, the digital output would be the photoresistor, also known as photocell. 
The digital output(photoresistor) then translates to a digital input that turns the blue and red LED on 
depending on the exposure of light on the photoresistor.

How a photoresistor works is through light intensity. In this [video](https://youtu.be/wxOB-EtKxAM), 
I show you how the LED lights up whenever I cover the photoresistor with my finger and how it blinks when 
my finger blocks the light from the photoresistor just a little bit.
This is because when I cover the photoresistor with my finger, the resistance becomes very big
due to the lack of exposure of light and vice-vera. Through looking at the serial monitor, I was able
to find the values when it is exposed to light and not so that I could enter the right values in my code.

Here are the values:
When my finger covered the photoresistor ![](https://i.imgur.com/HI1qqQ3.png)
When the photoresistor was left alone in a bright room ![](https://i.imgur.com/sQdpYTf.png)

Through these values, I knew that when my finger covers the photoresistor, 
the value drops from around 880 to around 535.

This is the arduino code 
![](https://i.imgur.com/vXirS72.png)

This is the schematic of my circuit
![](https://i.imgur.com/4wQ29J4.png)

This is how my circuit looked like
![](https://i.imgur.com/FKzJhnm.png)
