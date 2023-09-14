///互動模式 Interactive Mode (Active Mode)
//大一大二學 int main(){}
void setup(){
  size(500,500);
  background(255);///白色
}

void draw(){//每秒畫60次
  if(mousePressed){
    line(mouseX, mouseY, pmouseX, pmouseY);
  }///畫線(滑鼠座標mouseX, mouseY,到之前滑鼠座標pmouseX, pmouseY)
}
