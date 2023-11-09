PImage img;
int [][] pos ={{83,456},{116,456},{152,457},{188,457},{220,456},{253,456},{291,456},{323,457},{359,457},{393,456},{93,489},{127,491},{162,491},{196,491},{230,490},{264,490},{302,490},{334,490},{367,490},{110,523},{143,524},{181,524},{213,524},{247,524},{280,524},{316,526}};
void setup(){
  size(800,600);
  img =loadImage("keyboard.png");
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  image(img, 0, 600-266);
  fill(255,0,0,128);
  rect( mouseX, mouseY, 28, 30, 5);
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
    rect(pos[i][0],pos[i][1],28,30,5);
  }
}
void mousePressed(){
  println(mouseX,mouseY);
}
