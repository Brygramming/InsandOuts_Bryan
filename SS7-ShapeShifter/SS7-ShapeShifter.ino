//ShapeShifter by Bryan Santiago

const int LED1 = 2;
const int LED2 = 3;
const int LED3 = 4;
const int LED4 = 5;
const int SENSOR = A0;
int val = 0;

void setup()
{
	pinMode (LED1, OUTPUT);
  	pinMode (LED2, OUTPUT);
  	pinMode (LED3, OUTPUT);
  	pinMode (LED4, OUTPUT);
  	pinMode (SENSOR, INPUT);
  	Serial.begin(9600);
}

void loop()
{
  val = analogRead(SENSOR);
  val = val / 4;
  delay(100);

  if(val >= 250)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, HIGH);
  		digitalWrite(LED4, HIGH);
  	}
  	else if(val >= 127)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, HIGH);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val >= 85)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, HIGH);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val >= 64)
  	{
  		digitalWrite(LED1, HIGH);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}
  	else if(val < 64)
  	{
  		digitalWrite(LED1, LOW);
  		digitalWrite(LED2, LOW);
  		digitalWrite(LED3, LOW);
  		digitalWrite(LED4, LOW);
  	}

  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////
  
  //Serial. println(val); //to send human-readable data to Arduino monitor
  Serial.write(val);  //to send binary data to Processing
}
