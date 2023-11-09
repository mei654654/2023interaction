PImage img;
int[][]pos = {{91,491},{246,525},{179,524},{162,491},{153,458},{195,490},{229,489},{263,491},{322,456},{298,491},{332,490},{366,491},{315,525},{279,525},{357,456},{390,457},{84,456},{185,456},{127,490},{219,457},{288,457},{212,523},{118,457},{144,523},{254,457},{108,524}};

void setup(){
  size(800,600);
  img = loadImage("keyboard.png");
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  image(img ,0,600-266);
  fill(255,0,0,128);
  rect(mouseX,mouseY,28,30,5);
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
   if(typing.charAt(0)-'a'==i)rect(pos[i][0],pos[i][1],28,30,5);
   if(pressed[i])rect(pos[i][0],pos[i][1],28,30,5);
  }
  fill(0);
  textSize(50);
  text(typing,50,50);
  text(typing.charAt(0),50,100);
}
String typing = "printf";
boolean[]pressed = new boolean[26];
void keyPressed(){
  if(key>='a'&&key<='z')pressed[key-'a']= true;
}
void keyReleased(){
  if(key>='a'&&key<='z')pressed[key-'a']=false;
}
/*void mousePressed(){
  println(mouseX,mouseY);
}*/
