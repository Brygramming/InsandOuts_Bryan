//TheStressGame Final by Bryan Santiago

#include<Servo.h>

//LEDs All have Blue Wires
const int LED1 = 2;
const int LED2 = 3;
const int LED3 = 4;
const int LED4 = 5;

//Task and Sound
const int AnalogTask = A0; //Orange Wire
int val = 0;
const int ButtonTask = 12; //Orange Wire
int ButtonLH = 0;
const int Alerter = 9; //Orange Wire
float AlertSound = 0;

//Servo Controls
const int ServoPin = 10;
Servo timer;
float TimeLeft = 0;

void setup()
{
	pinMode(LED1, OUTPUT);
  	pinMode(LED2, OUTPUT);
  	pinMode(LED3, OUTPUT);
  	pinMode(LED4, OUTPUT);
  	pinMode(AnalogTask, INPUT);
  	pinMode(ButtonTask, INPUT);
  	pinMode(Alerter, OUTPUT);
  	timer.attach(ServoPin);
  	Serial.begin(9600);
}

void loop()
{
  val = analogRead(AnalogTask);
  ButtonLH = digitalRead(ButtonTask);
  AlertSound = digitalRead(Alerter);
  //timer.read(TimeLeft);
  val = val / 4;
  delay(100);

  //Testing to see the button works
  if(ButtonLH == HIGH)
  {
  	tone(Alerter, 2000);
  	timer.write(90);
  }
  else
  {
  	noTone(Alerter);
  	timer.write(0);
  }

  //Testing to see the analog works
  if(val >= 250)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, HIGH);
  		digitalWrite(LED4, HIGH);
  	}
  	else if(val >= 125)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, HIGH);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val >= 63)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val >= 32)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
  	else //if(val < 32)
  	{
  		//OffState
  		digitalWrite(LED1, LOW);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}

  //Serial.println(val);
  //Serial.println(ButtonLH);
  //Serial.println(TimeLeft);
  Serial.write(val);
  Serial.write(ButtonLH);
  //Serial.write(TimeLeft);
}
