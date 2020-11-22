//SoundBarrier by Bryan Santiago

#include<Servo.h>

//LEDs
const int LED1 = 2;
const int LED2 = 3;
const int LED3 = 4;
const int LED4 = 5;

//Analog and Sound
const int SENSOR = A0;
const int Buzzer = 9;

//Servo Controls
const int ServoPin = 10;
Servo servo;

int val = 0;

void setup()
{
	pinMode(LED1, OUTPUT);
  	pinMode(LED2, OUTPUT);
  	pinMode(LED3, OUTPUT);
  	pinMode(LED4, OUTPUT);
  	pinMode(SENSOR, INPUT);
  	pinMode(Buzzer, OUTPUT);
  	servo.attach(ServoPin);
  	Serial.begin(9600);
}

void loop()
{
  val = analogRead(SENSOR);
  val = val / 4;
  delay(100);

  //Sound will play A minor Scale
  if(val >= 250)
  	{
  		tone(Buzzer, 1760); //A6
  		servo.write(90);
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, HIGH);
  		digitalWrite(LED4, HIGH);
  	}
  	else if(val >= 170)
  	{
  		tone(Buzzer, 1661.22f); //G#6
  		servo.write(78.75f);
  	}
  	else if(val >= 125)
  	{
  		tone(Buzzer, 1396.91f); //F6
  		servo.write(67.5f);
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, HIGH);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val >= 85)
  	{
  		tone(Buzzer, 1318.51f); //E6
  		servo.write(56.25f);
  	}
  	else if(val >= 63)
  	{
  		tone(Buzzer, 1174.66f); //D6
  		servo.write(45);
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val >= 47)
  	{
  		tone(Buzzer, 1046.5f); //C6
  		servo.write(33.75f);
  	}
  	else if(val >= 32)
  	{
  		tone(Buzzer, 987.77f); //B5
  		servo.write(22.5f);
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val >= 10)
  	{
  		tone(Buzzer, 880); //A5
  		servo.write(11.25f);
  	}
  	else //if(val < 10)
  	{
  		//OffState
  		noTone(Buzzer);
  		servo.write(0);
  		digitalWrite(LED1, LOW);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
  	
  	//Serial.println(val);
  	Serial.write(val);
}
