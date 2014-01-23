import SimpleOpenNI.*;
import processing.opengl.*;
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
SimpleOpenNI kinect;
PBox2D box2d;

int kinectWidth = 640;
int kinectHeight = 480;
// to center and rescale from 640x480 to higher custom resolutions
float reScale;
int clickedDepth,clickPosition;
int maxValue;
int cuenta=0;
int cuentae=0;
int fin_estrellas=0;
int[] anterior1=new int[307200];
int[] anterior2=new int[307200];
int[] distintos=new int[307200];
ArrayList<Luz> luces;
int qwe = 0;
int qwer = 0;

void setup(){
  size(640,480,P3D);
  background(0);
  kinect= new SimpleOpenNI(this);
  reScale = (float) width / kinectWidth;
  luces = new ArrayList<Luz>();
  
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0, 9.8);
  
  if (kinect.isInit()==false){
   println("Nada de nada chato");
   exit();
   return; 
  }
  
  kinect.setMirror(true);
  kinect.enableDepth();

  maxValue = 2500;
}

void draw(){
      println("qwe"+qwer);
     qwer++;
  kinect.update();
  box2d.step();
  fill(0);
  rect(0,0,1280,720);
  
  // find out which pixels have users in them
  PImage cam = createImage(640,480,RGB);

  int[] depthValues = kinect.depthMap();  //Save the Depth's values in an array
  
 if(cuenta==20){ 
   for(int r=0; r<depthValues.length; r++){
  anterior2 [r] = anterior1[r];
  anterior1 [r]= depthValues[r];}
  cuenta=0;
  
  for (int l=0; l<depthValues.length; l++){

    if (anterior2[l]==depthValues[l]){
      distintos[l]=0;
    } else { distintos[l]=1;}
  }
  
 
  cam.loadPixels(); 
    
   for(int x = 0; x < 640; x++){           //See all the pixels
    for(int y = 0; y < 480; y++){
      clickPosition = x + (y*640);        //We see which pixel we are working on
      clickedDepth = depthValues[clickPosition];    //See the pixel's value 
      if (clickedDepth > 455){
      if (maxValue > clickedDepth){
        cam.pixels[ clickPosition] = color(0, 255, 0);}}
    }
  }
    
    cam.updatePixels();
    
    
    while(fin_estrellas<1){
    int s = int(random(0,307200));
    if (distintos[s]==1){
      translate(320,240,0);
      rotateX(radians(180));
      int Y = int(s / 640);
      int X = s - (Y*640);
     Luz p = new Luz(X,Y);
     luces.add(p);
     cuentae++; 
     println(qwe);
     qwe++;
    }
    if (cuentae==10){fin_estrellas=2; }    
  }
  fin_estrellas=0;
  cuentae=0;
  }
  else{cuenta++;}
  
  translate(0, (height-kinectHeight*reScale)/2);
  scale(reScale);
  image(cam,0,0); 
  
  for (Luz b: luces){
    b.display();
  }
 
}


