void setup(){
  size(400,400);
}
float x=50, y=250, vx=2, vy=-20;//-20倍數
void draw(){
    ellipse(x,y,10,10);
    x += vx;
    y += vy;
    vy+=0.98;///重力加速度
}
