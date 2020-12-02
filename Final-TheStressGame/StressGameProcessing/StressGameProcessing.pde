import processing.serial.*;

Serial myPort;
int val = 0;
int ButtonLH = 0;

//Color
//int ColorR = 0, ColorR2 = 255, ColorG = 0, ColorG2 = 255, ColorB = 0, ColorB2 = 255, ColorRTotal, ColorGTotal, ColorBTotal;

boolean GameStart = true;
boolean GameOn = false;

void setup() 
{
  size(1000, 800);
  
  //Will go to game menu when it starts
  GameStart = true;
  GameOn = false;

  //printArray(Serial.list());
  //String portName = Serial.list()[1];
  //myPort = new Serial(this, portName, 9600);
}

void draw() 
{
  /*if(myPort.available() > 0) 
  {
    val = myPort.read();
    ButtonLH = myPort.read();
  }*/
  //println (val); //prints to Processing console
  
  //Starting Game Menu
  if(GameStart == true)
  {
    GameMenu();
  }
  
  if(GameOn == true)
  {
    Game();
  }
  
  /*if(ButtonLH != 0 && GameStart == false)
  {
    rect(width/2, height/2, 110, 200);
  }
  else if(ButtonLH == 0)
  {
    background(255);
  }*/
}

void GameMenu()
{
  float RectStartX = 450, RectStartY = 375, RectStartW = 100, RectStartH = 50;
  
  background(144, 30, 34);
  fill(255);
  textSize(52);
  textAlign(CENTER);
  text("Stress Game", width/2, 300);
  noFill();
  fill(230);
  noStroke();
  rect(RectStartX, RectStartY, RectStartW, RectStartH);
  noFill();
  fill(0);
  textSize(30);
  text("Start", width/2, 410);
  noFill();
  
  if(mouseX > RectStartX && mouseX < RectStartX + RectStartW && mouseY > RectStartY && mouseY < RectStartY + RectStartH && mousePressed == true && mouseButton == LEFT && GameStart == true)
  {
    fill(0);
    rect(RectStartX, RectStartY, RectStartW, RectStartH);
    noFill();
    fill(255);
    textSize(30);
    text("Start", width/2, 410);
    noFill();
    GameStart = false;
    GameOn = true;
  }
}

void Game()
{
  background(255);
}
