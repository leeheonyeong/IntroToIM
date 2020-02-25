//toneMelody and servoKnob example codes used as reference

#include "pitches.h" //from "toneMelody" code examples
#include <Servo.h> //from "Knob" code examples

Servo myservo;  // create servo object to control a servo

int potpin = A0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin
const int slideswitch = 7; //turns on and off the 2 colored buttons
const int yellow_button = 5; //plays Old Macdonald Had A Farm when pressed
const int blue_button = 6; //plays Marry Had A Little Lamb when pressed
const int buzzer = 12; 

// Old Macdonald Had A Farm notes:
int firstmelody[] = {
  NOTE_G5, NOTE_G5, NOTE_G5, NOTE_D5, NOTE_E5, NOTE_E5, NOTE_D5, NOTE_B5, NOTE_B5, NOTE_A5, NOTE_A5, NOTE_G5, 0,
  NOTE_D5, NOTE_G5, NOTE_G5, NOTE_G5, NOTE_D5, NOTE_E5, NOTE_E5, NOTE_D5, NOTE_B5, NOTE_B5, NOTE_A5, NOTE_A5, NOTE_G5
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int othernoteDurations[] = {
  4, 4, 4, 4, 4, 4, 2, 4, 4, 4, 4, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 4, 4, 4, 4, 2
};
// Mary Had A Little Lamb notes:
int secondmelody[] = {
  NOTE_E5, NOTE_D5, NOTE_C5, NOTE_D5, NOTE_E5, NOTE_E5, NOTE_E5, NOTE_D5, NOTE_D5, NOTE_D5, NOTE_E5, NOTE_G5, NOTE_G5,
  NOTE_E5, NOTE_D5, NOTE_C5, NOTE_D5, NOTE_E5, NOTE_E5, NOTE_E5, NOTE_E5, NOTE_D5, NOTE_D5, NOTE_E5, NOTE_D5, NOTE_C5
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 4, 4, 4, 4, 4, 2, 4, 4, 2, 4, 4, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1
};

void setup() {
  Serial.begin(9600);
  pinMode(yellow_button, INPUT);
  pinMode(blue_button, INPUT);
  pinMode(slideswitch, INPUT);
  myservo.attach(3);
}

void loop() {
  servo_rotate();
  
  int yellow_buttonstate = digitalRead(yellow_button);
  //  Serial.print(yellow_buttonstate);
  //  Serial.print('\n');
  int blue_buttonstate = digitalRead(blue_button);
  int slide_buttonstate = digitalRead(slideswitch);
  Serial.print(blue_buttonstate);

  if (slide_buttonstate) {
    if (yellow_buttonstate) {
      for (int thisNote = 0; thisNote < 26; thisNote++) {
        servo_rotate(); //allows the servo to rotate during the song

        // to calculate the note duration, take one second divided by the note type.
        //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
        int othernoteDuration = 1000 / othernoteDurations[thisNote];
        tone(12, firstmelody[thisNote], othernoteDuration);

        // to distinguish the notes, set a minimum time between them.
        // the note's duration + 30% seems to work well:
        int pauseBetweenNotes = othernoteDuration * 1.30;
        delay(pauseBetweenNotes);
        // stop the tone playing:
        noTone(12);
      }

    }
    if (blue_buttonstate) {
      for (int thisNote = 0; thisNote < 26; thisNote++) {
        servo_rotate(); //allows the servo to rotate during the song
        // to calculate the note duration, take one second divided by the note type.
        //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
        int noteDuration = 1000 / noteDurations[thisNote];
        tone(12, secondmelody[thisNote], noteDuration);

        // to distinguish the notes, set a minimum time between them.
        // the note's duration + 30% seems to work well:
        int pauseBetweenNotes = noteDuration * 1.30;
        delay(pauseBetweenNotes);
        // stop the tone playing:
        noTone(12);
      }

    }
  }

  else {
    noTone(12);
  }

}

void servo_rotate() {
  val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo.write(val);                  // sets the servo position according to the scaled value
  delay(15);                           // waits for the servo to get there
}
