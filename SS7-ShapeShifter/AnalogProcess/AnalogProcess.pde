import processing.serial.*;

Serial myPort;
int val=0;

void setup() {
  size(1000, 400);

  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if ( myPort.available() > 0) 
  {
    val = myPort.read();
  }
  
  background(255);
  fill (0);
  rectMode(CENTER);
  if(val >= 250)
  {
    rect(width/5, height/2, val, val);
    ellipse(width/2, height/2, val, val);
    rect(800, height/2, val, val);
  }
  else if(val >= 127)
  {
    ellipse(width/5, height/2, val, val);
    rect(width/2, height/2, val, val);
    ellipse(800, height/2, val, val);
  }
  else if(val >= 85)
  {
    rect(width/5, height/2, val, val);
    ellipse(width/2, height/2, val, val);
    rect(800, height/2, val, val);
  }
  else if(val >= 64)
  {
    ellipse(width/5, height/2, val, val);
    rect(width/2, height/2, val, val);
    ellipse(800, height/2, val, val);
  }
  else if(val < 64)
  {
    rect(width/5, height/2, val, val);
    ellipse(width/2, height/2, val, val);
    rect(800, height/2, val, val);
  }
  
  //println (val); //prints to Processing console
}
