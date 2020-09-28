//Array of Stops by Bryan Santiago

float CenterX = 1080/2;
float CenterY = 720/2;
float RectW = 350;
float RectH = 125;
String[] Messages = {"Please", "Stop", "The", "Car"};

void setup()
{
  size(1080, 720);
  smooth();
  frameRate(60);
  background(255);
}

void draw()
{
  ArrayColors();
  StopSign();
  
  //Stop Text
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("STOP", width/2, 400);
}

void StopSign()
{
  //Stop Sign
  stroke(0);
  strokeWeight(20);
  line(width/2, height/2, width/2, height);
  noStroke();
   fill(144, 30, 34);
  rectMode(CENTER);
  rect(CenterX, CenterY, 350, 125);
  rect(CenterX, CenterY, 125, 350);
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(45));
  rect(0, 0, 350, 125);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(-45));
  rect(0, 0, 350, 125);
  popMatrix();
  circle(CenterX, CenterY, 350);
  noFill();
}

void ArrayColors()
{ 
  rectMode(CORNER);
  fill(255);
  rect(0, 0, width/2, height/2);
  fill(255);
  rect(width/2, 0, width, height/2);
  fill(255);
  rect(0, height/2, width/2, height);
  fill(255);
  rect(width/2, height/2, width, height);
  if(dist(mouseX, mouseY, 0, 0) <= width/2)
  {
    if(dist(mouseX, mouseY, 0, 0) <= height/2)
    {
      fill(#ba9b1c);
      rect(0, 0, width/2, height/2);
      fill(0);
      textSize(80);
      textAlign(CENTER);
      text(Messages[0], width/4, height/4);
    } else
    {
      fill(255);
      rect(0, 0, width/2, height/2);
    }
  }
  if(dist(mouseX, mouseY, width/2, 0) <= width)
  {
    if(dist(mouseX, mouseY, width/2, 0) <= height/2)
    {
      fill(#51ba1c);
      rect(width/2, 0, width, height/2);
      fill(0);
      textSize(80);
      textAlign(CENTER);
      text(Messages[1], 820, height/4);
    } else
    {
      fill(255);
      rect(width/2, 0, width, height/2);
    }
  }
  if(dist(mouseX, mouseY, 0, height/2) <= width/2)
  {
    if(dist(mouseX, mouseY, 0, height/2) <= height)
    {
      fill(#561cba);
      rect(0, height/2, width/2, height);
      fill(0);
      textSize(80);
      textAlign(CENTER);
      text(Messages[2], width/4, 580);
    } else
    {
      fill(255);
      rect(0, height/2, width/2, height);
    }
  }
  if(dist(mouseX, mouseY, width/2, height/2) <= width)
  {
    if(dist(mouseX, mouseY, width/2, height/2) <= height)
    {
      fill(200, 0, 0);
      rect(width/2, height/2, width, height);
      fill(0);
      textSize(80);
      textAlign(CENTER);
      text(Messages[3], 820, 580);
    } else
    {
      fill(255);
      rect(width/2, height/2, width, height);
    }
  }
}
