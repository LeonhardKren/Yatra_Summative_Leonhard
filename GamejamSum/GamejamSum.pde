int Scene = 1;
float playerX = 350;
float playerY = 400;
float bonuspush = 0;
int Collisiontime = -1;
PImage Kayak;
PImage Water;
int COUNT = 40;
boolean right, up, down = false;
float StonesX[] = new float[COUNT];
float StonesY[] = new float [COUNT];
float speed = 1;
void setup()
{
  size(800,800);
  Kayak=loadImage("Kayak.png");
  Kayak.resize(80,80);
  Water=loadImage("Water.png");
  Water.resize(800,800);
  for(int i=0;i<COUNT;i++)
  {
   StonesX[i] = random(800,1600);
   StonesY[i] = random(0,height);
  }
}

void draw()
{
 if(Scene==1)
 {
   Lvl1();
 }
 if(Scene==2)
 {
   Win();
 }
  if(Scene==3)
 {
   Lose();
 }
}
void Win()
{
  background(0,0,0);
  textSize(40);
  text("You win!",325,400);
    text("Press E for challenge mode",150,450);
}
void Lose()
{
  background(0,0,0);
  textSize(40);
  text("You lose!",325,400);
  text("Press R to restart",275,450);
}
void Lvl1()
{
  background(Water);
  image(Kayak,playerX,playerY);
  playerX-=speed+bonuspush;
  for(int i=0;i<COUNT;i++)
  {
    fill(167,167,167);
    ellipse(StonesX[i],StonesY[i],30,30);
    StonesX[i]-=1;
    
    if(StonesX[i]<0)
    {
      StonesX[i]+=800;
      StonesY[i]=random(0,800);
    }
    if(dist(StonesX[i],StonesY[i],playerX+40,playerY+40)<15+15)
    {
            //Scene=3;
      bonuspush=3;
      Collisiontime=millis();
    }
  }  
  
  if(bonuspush>0)
  {
    if(millis()-Collisiontime>500)
    {
      bonuspush=0;
    }
  }
  if(playerX>800)
  {
   Scene=2; 
  }
  if(playerX<0)
  {
   Scene=3; 
  }
  
}

void Reset()
{
   for(int i=0;i<COUNT;i++)
  {
   StonesX[i] = random(800,1600);
   StonesY[i] = random(0,height);
  } 
   playerX=350;
   playerY=400;
}

void keyPressed()
{
  if(keyCode==RIGHT)
  {
    playerX+=15;
  }
  if(keyCode==UP)
  {
    playerY-=5;
  }
  if(keyCode==DOWN)
  {
    playerY+=5; 
  }
  if(key=='r'||key=='R')
  {
   Scene=1;
   Reset();
  }
  if(key=='E'||key=='e')
  {
    Scene=1;
    Reset();
    speed+=0.3;
  }
}
