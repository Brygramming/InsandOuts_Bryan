import processing.serial.*;

Serial myPort;
int val=0;

//Equalizer
float[] RectX = {10, 10 + 125 * 1, 10 + 125 * 2, 10 + 125 * 3, 10 + 125 * 4, 10 + 125 * 5, 10 + 125 * 6, 10 + 125 * 7};
float[] RectY = {350, 350 - 50 * 1, 350 - 50 * 2, 350 - 50 * 3, 350 - 50 * 4, 350 - 50 * 5, 350 - 50 * 6, 350 - 50 * 7};
float RectW = 100;
float RectH = 400;

//Color
int ColorR = 0, ColorR2 = 255, ColorG = 0, ColorG2 = 255, ColorB = 0, ColorB2 = 255, ColorRTotal, ColorGTotal, ColorBTotal;

void setup() 
{
  size(1000, 400);
  background(144, 30, 34);

  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw() 
{
  if (myPort.available() > 0) 
  {
    val = myPort.read();
  }
  
  Equalizer();
  SoundColor();
  
  //SoundPressing();
  //println (val); //prints to Processing console
}

void Equalizer()
{
  stroke(0);
  strokeWeight(1.25);
  rectMode(CORNER);
  /*for(int i = 0; i < width; i += 125)
  {
    rect(Rect1X = 10 + i, Rect1Y = 50, Rect1W = 100, Rect1H = 350);
  }*/
  
  rect(RectX[0], RectY[0], RectW, RectH);
  rect(RectX[1], RectY[1], RectW, RectH);
  rect(RectX[2], RectY[2], RectW, RectH);
  rect(RectX[3], RectY[3], RectW, RectH);
  rect(RectX[4], RectY[4], RectW, RectH);
  rect(RectX[5], RectY[5], RectW, RectH);
  rect(RectX[6], RectY[6], RectW, RectH);
  rect(RectX[7], RectY[7], RectW, RectH);
}

void SoundColor()
{
  if(val >= 250)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[7] , RectY[7], RectW, RectH);
      noFill();
    }
    else if(val >= 170)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[6] , RectY[6], RectW, RectH);
      noFill();
    }
    else if(val >= 125)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[5] , RectY[5], RectW, RectH);
      noFill();
    }
    else if(val >= 85)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[4] , RectY[4], RectW, RectH);
      noFill();
    }
    else if(val >= 63)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[3] , RectY[3], RectW, RectH);
      noFill();
    }
    else if(val >= 47)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[2] , RectY[2], RectW, RectH);
      noFill();
    }
    else if(val >= 32)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[1] , RectY[1], RectW, RectH);
      noFill();
    }
    else if(val >= 10)
    {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[0] , RectY[0], RectW, RectH);
      noFill();
    }
    else //if(val < 10)
    {
      fill(0);
      ColorRTotal = int(random(ColorR, ColorR2));
      ColorGTotal = int(random(ColorG, ColorG2));
      ColorBTotal = int(random(ColorB, ColorB2));
    }
}




//Completed, but Abandoned.
//This was suppose to create sound from the Piezo when you click on the equalizer bars.
/*void SoundPressing()
{ 
  if(mouseX > RectX[0] && mouseX < RectX[0] + RectW && mouseY > RectY[0] && mouseY < RectY[0] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[0] , RectY[0], RectW, RectH);
      noFill();
      //val = 10;
  }
  else if(mouseX > RectX[1] && mouseX < RectX[1] + RectW && mouseY > RectY[1] && mouseY < RectY[1] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[1] , RectY[1], RectW, RectH);
      noFill();
  }
  else if(mouseX > RectX[2] && mouseX < RectX[2] + RectW && mouseY > RectY[2] && mouseY < RectY[2] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[2] , RectY[2], RectW, RectH);
      noFill();
  }
  else if(mouseX > RectX[3] && mouseX < RectX[3] + RectW && mouseY > RectY[3] && mouseY < RectY[3] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[3] , RectY[3], RectW, RectH);
      noFill();
  }
  else if(mouseX > RectX[4] && mouseX < RectX[4] + RectW && mouseY > RectY[4] && mouseY < RectY[4] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[4] , RectY[4], RectW, RectH);
      noFill();
  }
  else if(mouseX > RectX[5] && mouseX < RectX[5] + RectW && mouseY > RectY[5] && mouseY < RectY[5] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[5] , RectY[5], RectW, RectH);
      noFill();
  }
  else if(mouseX > RectX[6] && mouseX < RectX[6] + RectW && mouseY > RectY[6] && mouseY < RectY[6] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[6] , RectY[6], RectW, RectH);
      noFill();
  }
  else if(mouseX > RectX[7] && mouseX < RectX[7] + RectW && mouseY > RectY[7] && mouseY < RectY[7] + RectH && mousePressed == true && mouseButton == LEFT)
  {
      fill(ColorRTotal, ColorGTotal, ColorBTotal);
      rect(RectX[7] , RectY[7], RectW, RectH);
      noFill();
  }
  else
  {
    fill(0);
    
    //Color Randomizer
    ColorRTotal = int(random(ColorR, ColorR2));
    ColorGTotal = int(random(ColorG, ColorG2));
    ColorBTotal = int(random(ColorB, ColorB2));
  }
}*/
