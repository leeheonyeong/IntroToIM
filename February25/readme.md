## Karaoke Friend 

**Introduction**

This was fourth assignment for the course Intro to Interactive Media.
Our professor asked us to make a musical instrument using at least one servo and tone. 
We were allowed to use other components as well.

**Overall Project Concept**

In my work, I have used one switch toggle, two momentary switches, one buzzer, one servomotor, and a potentiometer.
First of all, the most important thing is the switch toggle. Without it turned on, the 2 momentary switches won't work
and not play any songs. Therefore, the switch toggle must first be turned on. After that, you ae given the choice to 
press the yellow button or the blue button. The yellow button will play "Old Macdonald Had A Farm" while the blue button 
will play "Mary Had A Little Lamb." After choosing a song, you can play along with the song by controlling the tambourines.
When you feel like you had enough "Karaoke Time", you can turn it off by turning the switch toggle off.

**Description of How the Circuit and the Code Accomplish the Concept**

I was able to achieve this through using if statements to control when the 2 songs will played. For example,
the yellow button will play "Old Macdonald At The Farm" as I referred the if statement to a variable created with pitches.h.
This goes the same for the blue button except the blue button plays a different song-"Mary Had A Little Lamb." 
The way I also created the melody for the songs was to just search up the music sheet online for each of them and jot down the 
notes while refererring to how they are called in pitches.h. It was also crucial to add the durations for each notes as 
the songs won't sound the same if notes are played unusually longer or shorter than other notes. Moreover, for the servo, I looked
at the example code of "knob" to include lines such as : #include <Servo.h>.

**Problems and Solutions**
While making this, I encountered some problems. One of the problems was that the servomotor(tambourine) would only move
when the note is being played even when I was turning the potentiometer nonstop. This caused some sort of rigid movement
with the servomotor but after testing the servomotor's sound along with the song multiple times, it actually sounded really nice
as the sounds from servomotor(tambourines) and the song was in harmony. 

Another problem that was irrelevant to the code or circuit was building the stand for the servomotor. I tried multiple ways to
build a stand that was strong enough to carry the servomotor and the shakers and soon found out that glue gun worked surprisingly
well in holding the stand together.

**Images and Video**

You could watch my project for this assignment in this short [video](https://youtu.be/7H3kJTmmnRE).

This is the schematic of my circuit:
![](https://i.imgur.com/OjBxz26.png)

This is how my overall project looked like:
![](https://i.imgur.com/dKK63Xi.png)

This is how my circuit looked like:
![](https://i.imgur.com/Rie1iJY.jpg)



