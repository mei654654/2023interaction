ArrayList<PVector>pt;
void setup(){
  size(400,400,P3D);
  pt= new ArrayList <PVector>();
}//初始化，把大的資料結構準備好
void draw(){
  background(#FFFFF2);
  for(PVector p : pt){//特殊for迴圈，獲得小資料結構
    ellipse(p.x, p.y, 10, 10);
  }
}
void mousePressed(){
  pt.add( new PVector(mouseX,mouseY));
}//大的資料結構裡面放小PVector的物件
