import java.util.*;

//create an array of objects and how many there will be
Object[] objects;
int count = 2000;

PVector gravity;


void setup(){
  fullScreen(P2D);
  fill(255);
  noStroke();
  colorMode(HSB);
  
  gravity = new PVector(0, 0.1);
  
  //iterate through the object array to initialize each object with it's constructor
  objects = new Object[count];
  for(int i = 0; i < objects.length; i++){
   objects[i] = new Object();
  }
}

void draw(){
  background(0);
  //each frame run all of these methods for all objects
  for(int i = 0; i < objects.length; i++){
   objects[i].flyToMouse();
   objects[i].checkEdges();
   objects[i].applyDrag();
   //objects[i].applyForce(gravity);
   objects[i].move();
   objects[i].display();
  }
}