///互動模式 Interactive Mode (Active Mode)
//大一大二學 int main(){}
void setup(){
  size(500,500);
  background(255,255,0);
}

void draw(){//每秒畫60次
  ellipse(mouseX, mouseY, 8, 8);
}
