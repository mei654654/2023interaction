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

void keyPressed(){
  if(key=='1')stroke(255,0,0);//如果按下1 筆觸是紅色
  if(key=='2')stroke(0,255,0);//如果按下2 筆觸是綠色
  if(key=='3')stroke(0,0,255);//如果按下3 筆觸是藍色
  if(key=='s'||key=='S')save("output.png");//按S就存檔
}
