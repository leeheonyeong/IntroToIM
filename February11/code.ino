const int pResistor = A0; 
const int ledPin=10;       

int value;          

void setup(){
 pinMode(ledPin, OUTPUT);  
 pinMode(pResistor, INPUT);
 Serial.begin(9600);
}

void loop(){
  value = analogRead(pResistor);
  Serial.println(value);
  //You can change value "25"
  if (value > 600){
    digitalWrite(ledPin, LOW);  //Turn led off
  }
  else{
    digitalWrite(ledPin, HIGH); //Turn led on
  }

  delay(50); 
}

