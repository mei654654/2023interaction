ArrayList<PVector>pt;
void setup(){
  size(400,400,P3D);
  pt= new ArrayList <PVector>();
}//初始化，把大的資料結構準備好
void draw(){
  background(#FFFFF2);
  pushMatrix();
    if(mousePressed && mouseButton == RIGHT){
      translate(200,200);
      rotateY(radians(frameCount));
      translate(-200,-200);
    }
    for(PVector p : pt){//特殊for迴圈，獲得小資料結構
      ellipse(p.x, p.y, 10, 10);
    }
    beginShape();
    for(PVector p : pt){//特殊for迴圈，獲得小資料結構
      vertex(p.x, p.y);
    }
    endShape();
  popMatrix();
}
void mousePressed(){
  pt.add( new PVector(mouseX,mouseY));
}//大的資料結構裡面放小PVector的物件
