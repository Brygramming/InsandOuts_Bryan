//Neverending by Bryan Santiago
/*Instructions:
Hover over the rectangle*/

int RectX = 490, RectY = 330, RectW = 100, RectH = 50;

void setup()
{
  size(1080, 720);
  background(144, 30, 34);
  //rectMode(CENTER);
}

void draw()
{
  if(mouseX > RectX && mouseX < RectX + RectW && mouseY > RectY && mouseY < RectY + RectH)
  {
    stroke(144, 30, 34);
    strokeWeight(0);
    fill(144, 30, 34);
    rect(RectX, RectY, RectW, RectH);
    noStroke();
    
    //Background Circles
    for(int x = 0; x <= width; x += 275)
    {
      //circle(50 + i, 50, 100);
      for(int y = 0; y <= height; y += 100)
      {
        fill(127, 50, 0);
        //circle(50 + x, 50 + y, 100);
        
        //Stop Text
        fill(255);
        textSize(100);
        //textAlign(CENTER);
        text("STOP", 0 + x, 10 + y);
        noFill();
      }
    }
  }
  else
  {
    background(144, 30, 34);
    fill(0);
    rect(RectX, RectY, RectW, RectH);
  }
}
