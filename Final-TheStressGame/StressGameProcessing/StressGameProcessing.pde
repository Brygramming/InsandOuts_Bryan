//TheStressGame Final by Bryan Santiago

import processing.serial.*;

Serial myPort;
int val = 0; //Matching
int RandomVal = 0; //Matching
int ButtonNeed = 0; //Button True or False
int TimeLeft = 90; //Timer
int GetReady = 0; //Device At Ready
int LevelState = 1; //Level

boolean GameStart = true;
boolean GameOn = false;

void setup()
{
  size(1000, 800);

  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if(myPort.available() > 0)
  {
    val = myPort.read();
    RandomVal = myPort.read();
    ButtonNeed = myPort.read();
    TimeLeft = myPort.read();
    GetReady = myPort.read();
  }
  println(TimeLeft);
  
  //Starting Game Menu
  if(GameStart == true)
  {
    GameMenu();
  }
  
  //Starting Game
  if( GetReady == 1)
  {
    GameStart = false;
    GameOn = true;
    Game();
  }
  
  //Both Task Completed
  if(val == RandomVal && ButtonNeed == 0)
  {
    GameOn = false;
    GameStart = true;
    //LevelState += 1;
  }
  else if(TimeLeft == -2) //GameOver
  {
    GameOn = false;
    GameStart = false;
    GameEnd();
  }
}

//Title Screen
void GameMenu()
{
  //float RectStartX = 450, RectStartY = 375, RectStartW = 100, RectStartH = 50;
  
  background(0);
  fill(255);
  textSize(52);
  textAlign(CENTER);
  text("Stress Game", width/2, 300);
  noFill();
  /*fill(230);
  noStroke();
  rect(RectStartX, RectStartY, RectStartW, RectStartH);
  noFill();
  fill(0);
  textSize(30);
  text("Start", width/2, 410);
  noFill();*/
  fill(255);
  textSize(20);
  text("Turn the analog to zero to get the device ready.", width/2, 450);
  noFill();
  
  /*if(mouseX > RectStartX && mouseX < RectStartX + RectStartW && mouseY > RectStartY && mouseY < RectStartY + RectStartH && mousePressed == true && mouseButton == LEFT)
  {
    fill(0);
    rect(RectStartX, RectStartY, RectStartW, RectStartH);
    noFill();
    fill(255);
    textSize(30);
    text("Start", width/2, 410);
    noFill();
    GameOn = true;
    GameStart = false;
  }*/
}

void Game()
{
  background(255);
  
  //Pontentiometer Matching
  //Match the number using the pontentiometer
  if(val == RandomVal) //This will make player match the number
  {
    fill(0, 127, 0);
    textSize(35);
    text(RandomVal, 770, 520);
    circle(770, 600, 125);
    noFill();
    fill(255);
    text(val, 770, 610);
    noFill();
  }
  else
  {
    fill(0);
    textSize(35);
    text(RandomVal, 770, 520);
    circle(770, 600, 125);
    noFill();
    fill(255);
    text(val, 770, 610);
    noFill();
  }
  
  //Button
  //Push button when needed
  if(ButtonNeed == 1)
  {
    fill(0);
    square(130, 545, 100);
    textSize(35);
    text("Press!", 180, 520);
    noFill();
  }
  else if(ButtonNeed == 0)
  {
    fill(0, 127, 0);
    textSize(35);
    text("Good", 180, 520);
    square(130, 545, 100);
    noFill();
  }
  
  //Levels will show up here
  /*fill(0);
  textAlign(CENTER);
  textSize(50);
  text("Level " + LevelState, width/2, 70);
  noFill();*/
}

//Game Over Screen
void GameEnd()
{
  float RectEndX = 365, RectEndY = 375, RectEndW = 270, RectEndH = 50;
  
  background(144, 30, 34);
  fill(255);
  textSize(52);
  textAlign(CENTER);
  text("Game Over", width/2, 300);
  noFill();
  fill(255);
  noStroke();
  rect(RectEndX, RectEndY, RectEndW, RectEndH);
  noFill();
  fill(0);
  textSize(30);
  text("To The Beginning", width/2, 410);
  noFill();
  
  if(mouseX > RectEndX && mouseX < RectEndX + RectEndW && mouseY > RectEndY && mouseY < RectEndY + RectEndH && mousePressed == true && mouseButton == LEFT)
  {
    fill(0);
    rect(RectEndX, RectEndY, RectEndW, RectEndH);
    noFill();
    fill(255);
    textSize(30);
    text("To The Beginning", width/2, 410);
    noFill();
    GameOn = false;
    GameStart = true;
  }
}
