import SimpleOpenNI.*;
SimpleOpenNI kinect;

int player=-1;
boolean calibrated = false;

void setup() {
  size( 1024, 768, P3D);
  kinect= new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableUser();
  
  
}

void draw() {
  background(255);
  kinect.update();
  
  drawHUD();
  
  translate (width/2,height/2,0);
  rotateX(PI);
  
  scale(0.5);
  translate(0,-100,-400);
  rotateY(radians(30));
  

  drawDancer();
  drawFloor();
  
}

void drawHUD() {
  
  image( kinect.depthImage(), 0, 0, 160, 120);
  if (kinect.getNumberOfUsers() > 0) { 
  loadPixels();
  scale(0.25);
//  if ( player != -1 ) {
    int[] userList = kinect.getUsers();
    int[] up = kinect.userMap();
    for (int i = 0; i < up.length; i++) { 
      for(int z = 0; z < userList.length; z++) { 
        // if the current pixel is on a user
            if (up[i] != 0) {
        // make it green
       pixels[i] = color(0, 255, 0); //The color you want for all pleople
      }
      }
    }
    }
  updatePixels();
}


void drawDancer() {
  if ( player != -1) {
 
    scale( .1 );
    stroke(0);
    strokeWeight(2);
    fill(0);
    PVector v1 = new PVector();
    PVector v2 = new PVector();
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_HEAD, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_NECK, v2 );
    pushMatrix();
    translate( v1.x, v1.y, v1.z );
    scale( .5, .5, 1);
    sphere( v1.dist( v2 ));
    popMatrix();
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_NECK, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_SHOULDER, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_NECK, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_SHOULDER, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_NECK, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_TORSO, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_SHOULDER, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_ELBOW, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_ELBOW, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_HAND, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_SHOULDER, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_ELBOW, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_ELBOW, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_HAND, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_TORSO, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_HIP, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_TORSO, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_HIP, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_HIP, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_HIP, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_HIP, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_KNEE, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_KNEE, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_LEFT_FOOT, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_HIP, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_KNEE, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_KNEE, v1 );
    kinect.getJointPositionSkeleton( player,SimpleOpenNI.SKEL_RIGHT_FOOT, v2 );
    line( v1.x, v1.y, v1.z, v2.x, v2.y, v2.z );
    popMatrix();
    }
  }

void drawFloor() {
  noStroke();
  fill( 128 );
  beginShape(QUADS);
  vertex( -400, -100, -400 );
  vertex( -400, -100, 400 );
  vertex( 400, -100, 400 );
  vertex( 400, -100, -400 );
  endShape();
}

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  
  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
 // println("onVisibleUser - userId: " + userId);
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
