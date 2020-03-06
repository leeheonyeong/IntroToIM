#include <Servo.h> //from "Knob" code examples

Servo myservo;

// 3 potentiometers to control the color of the RGB LED
int pot1 = A0;
int pot2 = A1;
int pot3 = A2;

// RGB LED
int LED1 = 13; //led G
int LED2 = 12; //led R
int LED3 = 11; //led B

const int inMinVal = 0, inMaxVal = 1023;  // Values that define the maximum and minimum value returned from the potentiometer reading

int sensorPin = A3; // analog pin used to connect potentiometer 1
int sensorPin2 = A5; // analog pin used to connect potentiometer 2
int servoPin  = 5; //servo to 5

int sensorValue = 0;
int servoGrad = 90;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  // Loop on all pins ( 3 values: Red, Green and Blue )
  pinMode(pot1, INPUT);
  pinMode(pot2, INPUT);
  pinMode(pot3, INPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode( sensorPin, INPUT);
  pinMode( sensorPin2, INPUT);
  myservo.attach( servoPin );
  myservo.write( servoGrad );
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int TMP1 = analogRead(A0);
  int TMP2 = analogRead(A1);
  int TMP3 = analogRead(A2);

// Using potentiometers to control RGB LED color range
  int new1 = map(TMP1, 0, 1023, 0, 255);
  int new2 = map(TMP2, 0, 1023, 0, 255);
  int new3 = map(TMP3, 0, 1023, 0, 255);

// enables A0 potentiometer to control LED G, enables A1 potentiometer to control LED R, enables A2 potentiometer to control LED B
  analogWrite(LED1, new1);
  analogWrite(LED2, new2);
  analogWrite(LED3, new3);
  
// Used to check if the potentiometers work using serial monitor
  //  Serial.print("potentiometer1 = ");
  //  Serial.print(TMP1);
  //  Serial.print(" | ");
  //  Serial.print("potentiometer2 = ");
  //  Serial.print(TMP2);
  //  Serial.print(" | ");
  //  Serial.print("potentiometer3 = ");
  //  Serial.println(TMP3);
  int tmp1 = analogRead(A3);
  // Serial.print(tmp1);
  int tmp2 = analogRead(A5);
  // Serial.print("\t");
  //  Serial.println(tmp2);

// allows for the servo motor to rotate 180degress when light is shone on one potentiometer and 0degree when the light is shone on the second potentiometer.
  if (tmp1 > tmp2)
  {
    Serial.println("180");
    myservo.write(180);
  }
  else
  {
    Serial.println("0");
    myservo.write(0);
  }
  //100ms delay
  delay(100);
}
