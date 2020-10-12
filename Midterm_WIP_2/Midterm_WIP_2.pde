//Midterm Project by Bryan Santiago

//Image Position and List;
PImage[] Images = new PImage[8];
String[] ImageNames = {"Images/Cats/Cat1.png", "Images/Cats/Cat2.png", "Images/Cats/Cat3.png", "Images/Cats/Cat4.png", "Images/Dogs/Dog1.png", "Images/Dogs/Dog2.png", "Images/Dogs/Dog3.png", "Images/Dogs/Dog4.png"};
float Image1X, Image1Y, Image1W, Image1H;
float Image2X, Image2Y, Image2W, Image2H;
float Image3X, Image3Y, Image3W, Image3H;
float Image4X, Image4Y, Image4W, Image4H;

//StopSign position
float[] StopSignPositionX = {120, 390, 670, 950};
float StopSignStaticX;

//Next Game
float NextX = 1000, NextY = 40, NextW = 60, NextH = 30;
boolean NextQuiz = false;

//Random Questions
String[] Questions = {"Who took the blanket? Click the images.", "Who destroy the pillow? Click the images.", "Who is the one that made a mess? Click the images.", "Who took your phone? Click the images."};
String[] WrongAnswers = {"Don't look at me", "What? I was grooming", "Not me"};
String QuestionStatic;

void setup()
{
  size(1080, 720);
  frameRate(60);
  //background(144, 20, 45);
  background(255);
  
  //Image Location
  Images[0] = loadImage(ImageNames[int(random(0, 8))]);
  Images[1] = loadImage(ImageNames[int(random(0, 8))]);
  Images[2] = loadImage(ImageNames[int(random(0, 8))]);
  Images[3] = loadImage(ImageNames[int(random(0, 8))]);
  /*Images[4] = loadImage(ImageNames[int(random(0, 8))]);
  Images[5] = loadImage(ImageNames[int(random(0, 8))]);
  Images[6] = loadImage(ImageNames[int(random(0, 8))]);
  Images[7] = loadImage(ImageNames[int(random(0, 8))]);*/
  
  //Images
  image(Images[0], Image1X = 280*0, Image1Y = 200, Image1W = 270, Image1H = 280);
  image(Images[1], Image2X = 280*1, Image2Y = 200, Image2W = 270, Image2H = 300);
  image(Images[2], Image3X = 280*2, Image3Y = 200, Image3W = 270, Image3H = 280);
  image(Images[3], Image4X = 280*3, Image4Y = 200, Image4W = 270, Image4H = 280);
  
  //This will not overlay questions
  QuestionStatic = Questions[int(random(0, 3))];
  
  //This sets the position of the stopsigns
  //StopSignStaticX = StopSignPositionX[int(random(0, 4))];
}

void draw()
{
  //A button to start the quiz again
  int ButtonWhite = 0;
  if(NextQuiz == true)
  {
    //frameRate(5);
    if(ButtonWhite >= 255)
    {
      ButtonWhite -= 1;
    } else if(ButtonWhite <= 0)
    {
      ButtonWhite += 1;
    } else
    {
      ButtonWhite += ButtonWhite;
    }
    fill(ButtonWhite, 255, ButtonWhite);
    rect(NextX, NextY, NextW, NextH);
    noFill();
    fill(255);
    textSize(23);
    textAlign(CENTER);
    text("NEXT", 1000, 45);
    noFill();
  } else
  {
    NextQuiz = false;
  }
  
  //To create section
  for(int i = 0; i <= width; i += 280)
  {
    stroke(0);
    strokeWeight(2);
    line(250 + i, 0, 250 + i, height);
    noStroke();
  }
  
  //Middle Text Question
  fill(255, 0, 0);
  textSize(32);
  textAlign(CENTER);
  text(QuestionStatic, width/2, 45);
  noFill();
}

void StopSignWrong()
{
  float CenterX = StopSignStaticX;
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
  float CenterX = StopSignStaticX;
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
  
  //Answer Text
  fill(255);
  textSize(24);
  textAlign(CENTER);
  text("I'm swwry", /*950*/CenterX, 200);
  noFill();
  
  NextQuiz = true;
}

void mousePressed()
{
  rectMode(CORNER);
  if(mouseX > Image1X && mouseX < Image1X + Image1W && mouseY > Image1Y && mouseY < Image1Y + Image1H)
  {
    fill(127);
    rect(0, 0, 250, height);
    noFill();
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text(WrongAnswers[int(random(0, 3))], 125, 200);
    noFill();
    //Images
    image(Images[0], Image1X = 280*0, Image1Y = 200, Image1W = 270, Image1H = 300);
    StopSignStaticX = StopSignPositionX[0];
    StopSignWrong();
  } else if(mouseX > Image3X && mouseX < Image3X + Image3W && mouseY > Image3Y && mouseY < Image3Y + Image3H)
  {
    fill(127);
    rect(530, 0, 280, height);
    noFill();
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text(WrongAnswers[int(random(0, 3))], 670, 200);
    noFill();
    //Images
    image(Images[2], Image3X = 280*2, Image3Y =200, Image3W = 270, Image3H = 300);
    StopSignStaticX = StopSignPositionX[2];
    StopSignWrong();
  } else if(mouseX > Image2X && mouseX < Image2X + Image2W && mouseY > Image2Y && mouseY < Image2Y + Image2H)
  {
    fill(127);
    rect(250, 0, 280, height);
    noFill();
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text(WrongAnswers[int(random(0, 3))], 390, 200);
    noFill();
    //Images
    image(Images[1], Image2X = 280*1, Image2Y = 200, Image2W = 270, Image2H = 300);
    StopSignStaticX = StopSignPositionX[1];
    StopSignWrong();
  } else if(mouseX > Image4X && mouseX < Image4X + Image4W && mouseY > Image4Y && mouseY < Image4Y + Image4H)
  {
    fill(127);
    rect(810, 0, 280, height);
    noFill();
    //Images
    image(Images[3], Image4X = 280*3, Image4Y = 200, Image4W = 270, Image4H = 300);
    //StopSignWrong();
    StopSignStaticX = StopSignPositionX[3];
    StopSignRight();
  }
  
  //This will start the quiz again once the button is pressed.
  if(mouseX > NextX && mouseX < NextX + NextW && mouseY > NextY && mouseY < NextY + NextH && NextQuiz == true)
    {
      //frameRate(60);
      background(255);
    
      //Image Location
      Images[0] = loadImage(ImageNames[int(random(0, 8))]);
      Images[1] = loadImage(ImageNames[int(random(0, 8))]);
      Images[2] = loadImage(ImageNames[int(random(0, 8))]);
      Images[3] = loadImage(ImageNames[int(random(0, 8))]);
      
      //Images
      image(Images[0], Image1X = 280*0, Image1Y = 200, Image1W = 270, Image1H = 280);
      image(Images[1], Image2X = 280*1, Image2Y = 200, Image2W = 270, Image2H = 300);
      image(Images[2], Image3X = 280*2, Image3Y = 200, Image3W = 270, Image3H = 280);
      image(Images[3], Image4X = 280*3, Image4Y = 200, Image4W = 270, Image4H = 280);
      
      //This will not overlay questions
      QuestionStatic = Questions[int(random(0, 3))];
      
      NextQuiz = false;
    }
}
