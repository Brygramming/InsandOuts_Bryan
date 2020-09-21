//New Dirty Stop Sign by Bryan Santiago

float RectX = 1080/2, RectY = 720/2, RectW = 300, RectH = 100;
int ColorR = 0, ColorR2 = 255, ColorG = 0, ColorG2 = 255, ColorB = 0, ColorB2 = 255, ColorRTotal, ColorGTotal, ColorBTotal;
float CircleX = 100, CircleY = 200, CircleR = 150;

void setup()
{
  size(1080, 720);
  smooth();
  frameRate(15);
  noFill();
}

void draw()
{
  background(144, 30, 34);

  //Rectangle
  //fill(#ba9b1c);
  fill(ColorRTotal, ColorGTotal, ColorBTotal);
  strokeWeight(2);
  rectMode(CENTER);
  rect(RectX, RectY, RectW, RectH);
  noFill();

  //Circle
  //fill(#51ba1c);
  fill(ColorRTotal, ColorGTotal, ColorBTotal);
  strokeWeight(5);
  circle(CircleX, CircleY, CircleR);
  noFill();

  //Triangle
  /*fill(#561cba);
   strokeWeight(3);
   triangle(1000, 100, 800, 700, 1080, 720);
   noFill();*/

  //Stop Text
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("STOP", 1080/2, 720/2);
  noFill();

  if(mousePressed == true && mouseButton == RIGHT)
   {
   fill(random(ColorR, ColorR2), random(ColorG, ColorG2), random(ColorB, ColorB2));
   rect(RectX, RectY, RectW, RectH);
   circle(CircleX, CircleY, CircleR);
   ColorRTotal = int(random(ColorR, ColorR2));
   ColorGTotal = int(random(ColorG, ColorG2));
   ColorBTotal = int(random(ColorB, ColorB2));
   }
   else if(ColorRTotal <= 0 && ColorGTotal <= 0 && ColorBTotal <= 0)
   {
     fill(#ba9b1c);
     rect(RectX, RectY, RectW, RectH);
     noFill();
     fill(#51ba1c);
     circle(CircleX, CircleY, CircleR);
     noFill();
   }
   else
   {
     stroke(85);
   }
}

void mouseDragged()
{
  //Rectangle Drag
  if (dist(mouseX, mouseY, RectX, RectY) < RectW / 2 && mouseButton == LEFT)
  {
    RectX += mouseX - pmouseX;
    RectY += mouseY - pmouseY;
    //fill(random(ColorR, ColorR2), random(ColorG, ColorG2), random(ColorB, ColorB2));
    if (dist(mouseX, mouseY, RectX, RectY) < RectH / 2)
    {
      RectX += mouseX - pmouseX;
      RectY += mouseY - pmouseY;
      //fill(random(ColorR, ColorR2), random(ColorG, ColorG2), random(ColorB, ColorB2));
    }
  }

  //Circle Drag
  if (dist(mouseX, mouseY, CircleX, CircleY) < CircleR / 2 && mouseButton == LEFT)
  {
    CircleX += mouseX - pmouseX;
    CircleY += mouseY - pmouseY;
    //fill(random(ColorR, ColorR2), random(ColorG, ColorG2), random(ColorB, ColorB2));
  }
}

/*void mousePressed()
{
  if (mouseButton == RIGHT)
  {
    fill(random(ColorR, ColorR2), random(ColorG, ColorG2), random(ColorB, ColorB2));
    rect(RectX, RectY, RectW, RectH);
    circle(CircleX, CircleY, CircleR);
  }
}*/
