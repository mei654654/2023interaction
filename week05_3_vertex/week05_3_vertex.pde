void setup(){
  size(400,400,P3D);//3D的功能
}
void draw(){
  background(#FFFFF2);//鵝黃色
  pushMatrix();//備份矩陣
    translate(mouseX,mouseY);//移動
    rotateY(radians(mouseX));
    fill(0,255,0);//綠色
    box(100);//3D方塊
    
    noFill();//面不要填
    scale(2);//放大2倍
    box(100);//雖然是100，但上面有放大
  popMatrix();//還原矩陣
}
