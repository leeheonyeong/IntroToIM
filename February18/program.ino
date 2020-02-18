int slideSwitch = 7;
int LEDpin1 = 9;
int LEDpin2 = 10;
int LEDpin3 = 11;
int pushButton = 4; // yellow button
int brightness = 255;
int pinPotentiometer = A2;

void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(pushButton, INPUT);
  // make the LEDs outputs
  pinMode(LEDpin1, OUTPUT);
  pinMode(LEDpin2, OUTPUT);
  pinMode(LEDpin3, OUTPUT);
  pinMode(slideSwitch, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:

  int buttonState = digitalRead(pushButton);
  int slideSwitchValue = digitalRead(slideSwitch);
  Serial.print("value of slide = ");
  Serial.println(slideSwitchValue);
  //Serial.println(slideSwitchValue);
  int potentiometer = analogRead(pinPotentiometer);
  // constantly randomly generate a number between 9 and 11, in which each number
  // is connected to each of the four LEDs
  int randomNumber = random(9, 12); //maximum (12) is exclusive
  brightness = potentiometer / 4;
  // make the LED (chosen from the random number generater) blink for 0.1sec
  if (slideSwitchValue == 1 && buttonState == 1) {
    analogWrite(randomNumber, brightness);
    delay(100);
    digitalWrite(randomNumber, LOW);
    delay(100);
  }

  // if the switch is not on, turn off all LEDs
  else {
    digitalWrite(LEDpin1, LOW);
    digitalWrite(LEDpin2, LOW);
    digitalWrite(LEDpin3, LOW);
  }
  // print out the state of the button:
  Serial.println(buttonState);
  Serial.println(potentiometer);
  delay(1);        // delay in between reads for stability
}
