class Object{
  
 PVector acceleration;
 PVector velocity;
 PVector location;
 Random rx;
 Random ry;
 float meanX = width /2;
 float meanY = height / 2;
 float std = 60;
 float sizeX;
 float sizeY;
 float mass;
 float hue;
 
 Object(){
  rx = new Random(); 
  ry = new Random();
  
  sizeX = random(15, 35);
  sizeY = random(15, 35);
  
  //calculate mass based on the average of the sizes
  mass = (sizeX + sizeY) / 2;
  hue = map(mass, 15, 35, 50 , 200);
  
  //set a location based on a gausian distribution
  location = new PVector((float)rx.nextGaussian() * std + meanX, (float)ry.nextGaussian() * std + meanY);
  velocity = new PVector(random(5, 20),random(5, 20));
  acceleration = new PVector(0,0);
 }
 //create a function that applies an acceleration to the particles with the mouse in the center
 void flyToMouse(){
  float x = 0;
  float y = 0;
   
  //changes the acceleration direction depending on what side the particle is on of the mouse
  if(location.x < mouseX){
  x = (pow(abs((location.x - mouseX)), 2) / 10000);
  }
  else if(location.x >= mouseX){
  x = -(pow(abs((location.x - mouseX)), 2) / 10000);
  }
  if(location.y < mouseY){
  y = (pow(abs((location.y - mouseY)), 2) / 10000);
  }
  else if(location.y >= mouseY){
  y = -(pow(abs((location.y - mouseY)), 2) / 10000);
  }
  PVector force = new PVector(x, y);
  acceleration.add(force);
 }
 
 //a method that opposes the velocity of each particle
 void applyDrag(){
  PVector drag = velocity.get();
  drag.normalize();
  drag.mult(-0.25);
  velocity.add(drag);
 }
 
 //checks to see if the particle has hit the border of the monitor
 //If yes, reduces and reverses velocity
 void checkEdges(){
  if(location.x < sizeX || location.x > width - sizeX){
   velocity.x *= -0.8; 
  }
  if(location.y < sizeY || location.y > height - sizeY){
   velocity.y *= -0.8; 
  }
 }
 
 //applies the chain of physics on the object
 //acceleration canceled at the end to not allow for velocity runaway
 void move(){
  acceleration.div(mass/2);
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
 }
 
 //a method that takes a PVector and applies it to the acceleration of the particle
 void applyForce(PVector force){
  acceleration.add(force);
 }
 
 //displays the end result of the particle on the screen
 void display(){
  fill(hue, 255, 255, 180);
  ellipse(location.x, location.y, sizeX, sizeY);
 }
}