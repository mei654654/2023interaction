void setup()
{
  size(400, 400);
}
float MarioX=50, MarioY=250, vx=0, vy=0;
void draw()
{
  background(108, 137, 255); // blue
  MarioX += vx; 
  if(flying){
    MarioY += vy;
    vy +=0.89;
    if(MarioY >= 250){
      MarioY = 250;
      flying = false;
    }
  }
  
  fill(255, 0, 0); ellipse(MarioX, MarioY, 15, 25);
  fill(229, 119, 42); rect(0, 260, 400, 150);
}
boolean flying = false;
void keyPressed()
{
  if (keyCode == RIGHT) vx=2;
  if (keyCode == LEFT) vx=-2;
  if (keyCode == UP && flying == false) {
    vy=-20;
    flying = true;
  }
}
void keyReleased()
{
  if (keyCode == LEFT || keyCode == RIGHT ) vx=0;
}
