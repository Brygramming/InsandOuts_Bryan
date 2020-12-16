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
int RandomVal = 0; //Random potentiometer Set
const int ButtonTask = 12; //Orange Wire
int ButtonLH = 0;
const int Alerter = 9; //Orange Wire
float AlertSound = 0;

//Servo Controls and Timer
const int ServoPin = 10;
Servo timer;
int TimeLeft = 90;
int TimeRate = 200;
int RememberTime = 0;

//Randomize button bool
bool ButtonNeed;
bool ButtonNeedArray[] = {false, true};
int RandomNeed; //Random Button Set

//To get the game ready
bool GetReady = false;

//Levels
int LevelState = 1;

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
  	RandomVal = random(0, 256);
  	RandomNeed = random(0, 2);
  	Serial.begin(9600);
}

void loop()
{
	val = analogRead(AnalogTask);
	ButtonLH = digitalRead(ButtonTask);
  	val = val / 4;
  	delay(100);

  	//This will start the game along with processing
  	if(GetReady == true)
  	{
  		TimeofGame();
  		TaskofButton();
  		TaskofAnalog();
  	}
  	else
  	{
  		TimeLeft = 90;
  		timer.write(TimeLeft);
  		RandomVal = random(0, 256);
  		RandomNeed = random(0, 2);

  		//OffState
  		digitalWrite(LED1, LOW);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}

  	//Game Starter
  	if(val <= 0 && GetReady == false)
  	{
  		GetReady = true;
  	}

  	//Both task is completed
  	if(val == RandomVal && ButtonNeed == ButtonNeedArray[0])
  	{
  		tone(Alerter, 5000);
		delay(10);
		tone(Alerter, 9000);
		delay(10);
		noTone(Alerter);
		GetReady = false;
  	}

  	//Serial.println(val);
  	//Serial.println(RandomVal);
  	//Serial.println(ButtonNeed);
  	//Serial.println(TimeLeft);
  	//Serial.println(GetReady);
  	Serial.write(val);
  	Serial.write(RandomVal);
  	Serial.write(ButtonNeed);
  	Serial.write(TimeLeft);
  	Serial.write(GetReady);
}

void Levels()
{
	if(LevelState == 10)
	{
		TimeRate = 110;
	}
	else if(LevelState == 9)
	{
		TimeRate = 120;
	}
	else if(LevelState == 8)
	{
		TimeRate = 130;
	}
	else if(LevelState == 7)
	{
		TimeRate = 140;
	}
	else if(LevelState == 6)
	{
		TimeRate = 150;
	}
	else if(LevelState == 5)
	{
		TimeRate = 160;
	}
	else if(LevelState == 4)
	{
		TimeRate = 170;
	}
	else if(LevelState == 3)
	{
		TimeRate = 180;
	}
	else if(LevelState == 2)
	{
		TimeRate = 190;
	}
	else if(LevelState == 1)
	{
		TimeRate = 200;
	}
}

//This is the timer for the servo
void TimeofGame()
{
	if(TimeLeft >= 0)
  	{
  		if(millis() - RememberTime >= TimeRate)
  		{
  			timer.write(TimeLeft);
  			TimeLeft -= 1;
  			RememberTime = millis();
  		}
  	}
  	else
  	{
  		//OnState
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, HIGH);
  		digitalWrite(LED4, HIGH);
  		tone(Alerter, 300);
  		delay(800);
  		noTone(Alerter);
  		delay(800);
  		tone(Alerter, 300);
  		delay(800);
  		noTone(Alerter);
  		delay(800);
  		//OffState
  		digitalWrite(LED1, LOW);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  		LevelState = 1;
  		GetReady = false;
  	}
}

//Task of Button
void TaskofButton()
{
	ButtonNeed = ButtonNeedArray[RandomNeed]; //Button Randomizer

	if(ButtonNeed == ButtonNeedArray[1])
	{
		if(ButtonLH == HIGH)
  		{
  			//tone(Alerter, 6000);
  			ButtonNeed = ButtonNeedArray[0];
  			RandomNeed = 0;
  		}
  		else
  		{
  			noTone(Alerter);
  		}
	}
}

//Task of Analog
void TaskofAnalog()
{
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
  	else
  	{
  		//OffState
  		digitalWrite(LED1, LOW);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
}
