//4 LED Pattern by Bryan Santiago

//Button
const int Button = 13;
int ButtonState = 0;

//Lights
const int LightOne = 2;
const int LightTwo = 3;
const int LightThree = 4;
const int LightFour = 5;

void setup()
{
  pinMode(Button, INPUT);
  pinMode(LightOne, OUTPUT);
  pinMode(LightTwo, OUTPUT);
  pinMode(LightThree, OUTPUT);
  pinMode(LightFour, OUTPUT);
}

void loop()
{
	ButtonState = digitalRead(Button);
	delay(10);

	if(ButtonState == HIGH)
	{
		OnLightTrain();
		OnLightTrain();
  		TrainCrash();
  		TrainCrash();

  	} else
  	{
  		digitalWrite(LightOne, LOW);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, LOW);
  	}
}

//LED Pattern 1
void OnLightTrain()
{
		//Up to on
		digitalWrite(LightOne, HIGH);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, LOW);
    	delay(100);

    	digitalWrite(LightOne, HIGH);
    	digitalWrite(LightTwo, HIGH);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, LOW);
    	delay(100);

    	digitalWrite(LightOne, HIGH);
    	digitalWrite(LightTwo, HIGH);
    	digitalWrite(LightThree, HIGH);
    	digitalWrite(LightFour, LOW);
    	delay(100);

    	digitalWrite(LightOne, HIGH);
    	digitalWrite(LightTwo, HIGH);
    	digitalWrite(LightThree, HIGH);
    	digitalWrite(LightFour, HIGH);
    	delay(100);

    	//Down to off
    	digitalWrite(LightOne, LOW);
    	digitalWrite(LightTwo, HIGH);
    	digitalWrite(LightThree, HIGH);
    	digitalWrite(LightFour, HIGH);
    	delay(100);

    	digitalWrite(LightOne, LOW);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, HIGH);
    	digitalWrite(LightFour, HIGH);
    	delay(100);

    	digitalWrite(LightOne, LOW);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, HIGH);
    	delay(100);

    	digitalWrite(LightOne, LOW);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, LOW);
    	delay(100);
}

//LED Pattern 2
void TrainCrash()
{
		digitalWrite(LightOne, HIGH);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, HIGH);
    	delay(200);

    	digitalWrite(LightOne, HIGH);
    	digitalWrite(LightTwo, HIGH);
    	digitalWrite(LightThree, HIGH);
    	digitalWrite(LightFour, HIGH);
    	delay(200);

    	digitalWrite(LightOne, HIGH);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, HIGH);
    	delay(200);

    	digitalWrite(LightOne, LOW);
    	digitalWrite(LightTwo, LOW);
    	digitalWrite(LightThree, LOW);
    	digitalWrite(LightFour, LOW);
    	delay(200);
}
