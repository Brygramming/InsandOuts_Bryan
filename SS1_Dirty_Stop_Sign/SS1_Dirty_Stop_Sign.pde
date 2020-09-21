//Dirty Stop Sign by Bryan Santiago

float RectX = 1080/2;
float RectY = 720/2;
float RectW = 300;
float RectH = 100;

void setup()
{
  size(1080, 720);
  smooth();
  frameRate(60);
}

void draw()
{
  background(144, 30, 34);
  //Rectangle
  fill(#ba9b1c);
  strokeWeight(2);
  rectMode(CENTER);
  rect(RectX, RectY, RectW, RectH);
  
  //Stop Text
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("STOP", 1080/2, 720/2);
  
  //Circle
  fill(#51ba1c);
  strokeWeight(5);
  circle(100, 200, 150);
  
  //Triangle
  fill(#561cba);
  strokeWeight(3);
  triangle(1000, 100, 800, 700, 1080, 720);
}
