
int x = 0;
int my = 0;
int mz = 0;


void setup(){
  size(700,500,P3D);
  background(0);
  
}

void draw(){
  fill(0,0,0,30);
  rect(-1,-1,width+4,height+4);
  
  rotateX(radians(x));
  my = int((height/2)*cos(radians(x)));
  mz = int((-1)*(height/2)*sin(radians(x)));
  translate(0,my,mz);
  stroke(0,0,255);
  ellipse(width/2,height/2,100,100);
  x++;
  
  println("X: " + x);
  println("MY: " + my);
  println("MZ: " + mz);
  
  if(x == 180){
    x = 0;
  }  
}
