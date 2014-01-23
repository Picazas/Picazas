import SimpleOpenNI.*;
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import toxi.geom.*; // toxiclibs shapes and vectors
import toxi.processing.*; // toxiclibs display
import processing.opengl.*; // opengl
import blobDetection.*; // blobs

SimpleOpenNI kinect;
PBox2D box2d;

ArrayList<Box> boxes;
int cuenta=0;
PVector jointPos = new PVector();

void setup(){
  size (640,480,OPENGL);
  kinect= new SimpleOpenNI(this);
  
  if (kinect.isInit()==false){
   println("Nada de nada chato");
   exit();
   return; 
  }
  
  box2d = new PBox2D(this);
  box2d.step();
  box2d.createWorld();
  box2d.setGravity(0, -20);
  
  boxes = new ArrayList<Box>();
  
  kinect.enableDepth();
  kinect.enableUser();
  background(200,0,0);
  stroke(0,0,255);
  strokeWeight(3);
  smooth(); 
}

void draw(){
  //box2d.step();
  kinect.update();
  image(kinect.userImage(),0,0);
  
  int[] userList = kinect.getUsers();
  
  kinect.getJointPositionSkeleton(1,SimpleOpenNI.SKEL_LEFT_HAND,jointPos);
   
  if (cuenta>20){
    cuenta = 0;
    Box p = new Box(jointPos.x,jointPos.y);
    Box p2 = new Box(0,0);
    boxes.add(p);
    boxes.add(p2);
    println("¡Ahora!");
  }
  else { cuenta++;}
  
  fill(255);
  rect(320,240,640,480);
  for (Box b: boxes) {
    b.display();
  }
}


void keyPressed()
{
  switch(key)
  {
  case ' ':
    kinect.setMirror(!kinect.mirror());
    break;
  }
}  

