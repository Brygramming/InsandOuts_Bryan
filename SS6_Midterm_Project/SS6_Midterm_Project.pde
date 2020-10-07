//Midterm Project by Bryan Santiago

//Cat Position;
PImage Cat01, Cat02, Cat03, Cat04;
String[] CatImages = {"Cat1.png", "Cat2.png", "Cat3.png", "Cat4.png"};
float Cat01X, Cat01Y, Cat01W, Cat01H;
float Cat02X, Cat02Y, Cat02W, Cat02H;
float Cat03X, Cat03Y, Cat03W, Cat03H;
float Cat04X, Cat04Y, Cat04W, Cat04H;

//Rectangles
float RectX1, RectY1, RectW1, RectH1;
float RectX2, RectY2, RectW2, RectH2;
float RectX3, RectY3, RectW3, RectH3;

String[] Questions = {"Who took the catnip? Click the images.", "Who destroy the pillow? Click the images.", "Who is the one that made a mess? Click the images?", "Who took your phone? Click the images."};

void setup()
{
  size(1080, 720);
  frameRate(60);
  //background(144, 20, 45);
  background(255);
  
  //Cat Image Location
  Cat01 = loadImage(CatImages[int(random(0, 3))]);
  Cat02 = loadImage(CatImages[int(random(0, 3))]);
  Cat03 = loadImage(CatImages[int(random(0, 3))]);
  Cat04 = loadImage(CatImages[int(random(0, 3))]);
}

void draw()
{
  //Images
  image(Cat01, Cat01X = -250, Cat01Y = 200, Cat01W = Cat01.width, Cat01H = Cat01.height);
  image(Cat02, Cat02X = 250, Cat02Y = 200, Cat02W = Cat02.width/2, Cat02H = Cat02.height/3);
  image(Cat03, Cat03X = 400, Cat03Y =200, Cat03W = Cat03.width, Cat03H = Cat03.height);
  image(Cat04, Cat04X = 810, Cat04Y = 250, Cat04W = Cat04.width/2, Cat04H = Cat04.height/2);
  
  for(int i = 0; i <= width; i += 280)
  {
    stroke(0);
    strokeWeight(2);
    line(250 + i, 0, 250 + i, height);
    //rect(0 +i, 0, width + i, height);
    noStroke();
  }
  
  //Middle Text
  fill(0);
  textSize(32);
  textAlign(CENTER);
  text(Questions[int(random(0, 3))], width/2, 45);
  noFill();
  
  /*StopSignWrong1();
  StopSignWrong2();
  StopSignWrong3();
  StopSignRight();*/
}

void StopSignWrong1()
{
  float CenterX = 120;
  float CenterY = height/2;
  float CenterW = 305 - 50;
  float CenterH = 125 - 20;
  
  //Stop Sign
  stroke(0);
  strokeWeight(20);
  line(CenterX, height/2, CenterX, height);
  noStroke();
  rectMode(CENTER);
   fill(144, 30, 34);
  rect(CenterX, CenterY, CenterW, CenterH);
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(90));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(-45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  circle(CenterX, CenterY, CenterW);
  noFill();
  
  //Stop Text
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text("Wrong", CenterX, 380);
}

void StopSignWrong2()
{
  float CenterX = 390;
  float CenterY = height/2;
  float CenterW = 305 - 50;
  float CenterH = 125 - 20;
  
  //Stop Sign
  stroke(0);
  strokeWeight(20);
  line(CenterX, height/2, CenterX, height);
  noStroke();
  rectMode(CENTER);
   fill(144, 30, 34);
  rect(CenterX, CenterY, CenterW, CenterH);
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(90));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(-45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  circle(CenterX, CenterY, CenterW);
  noFill();
  
  //Stop Text
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text("Wrong", CenterX, 380);
}

void StopSignWrong3()
{
  float CenterX = 670;
  float CenterY = height/2;
  float CenterW = 305 - 50;
  float CenterH = 125 - 20;
  
  //Stop Sign
  stroke(0);
  strokeWeight(20);
  line(CenterX, height/2, CenterX, height);
  noStroke();
  rectMode(CENTER);
   fill(144, 30, 34);
  rect(CenterX, CenterY, CenterW, CenterH);
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(90));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(-45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  circle(CenterX, CenterY, CenterW);
  noFill();
  
  //Stop Text
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text("Wrong", CenterX, 380);
}

void StopSignRight()
{
  float CenterX = 950;
  float CenterY = height/2;
  float CenterW = 305 - 50;
  float CenterH = 125 - 20;
  
  //Stop Sign
  stroke(0);
  strokeWeight(20);
  line(CenterX, height/2, CenterX, height);
  noStroke();
  rectMode(CENTER);
  fill(50, 200, 34);
  rect(CenterX, CenterY, CenterW, CenterH);
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(90));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  pushMatrix();
  translate(CenterX, CenterY);
  rotate(radians(-45));
  rect(0, 0, CenterW, CenterH);
  popMatrix();
  circle(CenterX, CenterY, CenterW);
  noFill();
  
  //Stop Text
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text("Right", CenterX, 380);
}

void mousePressed()
{
  rectMode(CORNER);
  if(mouseX > Cat01X && mouseX < Cat01X + Cat01W && mouseY > Cat01Y && mouseY < Cat01Y + Cat01H)
  {
    fill(0);
    rect(RectX1 = 0, RectY1 = 0, RectW1 = 250, RectH1 = height);
    noFill();
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("Not me", 125, 200);
    noFill();
    StopSignWrong1();
  } else if(mouseX > Cat03X && mouseX < Cat03X + Cat03W && mouseY > Cat03Y && mouseY < Cat03Y + Cat03H)
  {
    fill(0);
    rect(RectX3 = 530, RectY3 = 0, RectW3 = 280, RectH3 = height);
    noFill();
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("What? I was grooming", 670, 200);
    noFill();
    StopSignWrong3();
  } else if(mouseX > Cat02X && mouseX < Cat02X + Cat02W && mouseY > Cat02Y && mouseY < Cat02Y + Cat02H)
  {
    fill(0);
    rect(RectX2 = 250, RectY2 = 0, RectW2 = 280, RectH2 = height);
    noFill();
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("Don't look at me", 390, 200);
    noFill();
    StopSignWrong2();
  } else if(mouseX > Cat04X && mouseX < Cat04X + Cat04W && mouseY > Cat04Y && mouseY < Cat04Y + Cat04H)
  {
    fill(0);
    rect(RectX3 = 810, RectY3 = 0, RectW3 = 280, RectH3 = height);
    noFill();
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("I'm swwry", 950, 200);
    noFill();
    StopSignRight();
  }
}
