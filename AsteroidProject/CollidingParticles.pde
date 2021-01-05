class CollidingParticles extends GameObject{
  
  PVector SpinDirection = new PVector (1,1);
  int Colour;
  int Alpha;

  CollidingParticles(float X, float Y, int ColourOption){
    Position = new PVector (X,Y);
    Velocity = new PVector (2,0);
    Velocity.rotate(random(0,TWO_PI));
    Velocity.setMag((int) random(2,6));
    
    Hearts = 1;  
    Alpha = 255;
    Size = (int) random(3,12);
    Colour = ColourOption;
  
  }
//===============================================================================================================================================

  void act(){
    super.act();   
    SpinDirection.rotate(radians(random(40,140)));
  }
//===============================================================================================================================================
  
  void show(){
    pushMatrix();
      translate(Position.x,Position.y);
      if (Colour != 9){
        rotate(SpinDirection.heading());
      }
      
      
      noStroke();
      if (Colour == 0){// Ship Collide with asteroids Asteroids particles
        fill(124, random(51, 102),22);
        ellipse(0,0,Size,Size);
      }
      else if (Colour == 1){// Ship Collide Ship Blue Particles
        fill(0, random(0,255), 255);
        rect(0,0,Size,Size,(int) random(2,5));  
      }
      else if (Colour == 2){// Ship Collide Ship Yellow Particles
        fill(255, random(183,255), 0);
        rect(0,0,Size,Size,(int) random(2,5));  
      }
      else if (Colour ==3){//Ship Collide with Enemy 1 Spinning Enemy 1 Green Particles
        fill(random(26,117), 183, random(26,113));
        ellipse(0,0,Size,Size);
      }
      else if (Colour == 4){// Ship Collide with Enemy 1 Spinning Enemy 1 Gray Particles
        fill(random(150,255),Alpha);
        ellipse(0,0,Size+6,Size+6);
      }
      else if (Colour == 5){// Ship Collide with Enemy 2 Blue Enemy 2 Blue Particles
        fill(random(2,80), random(74,145), random(196,255));
        triangle(0,0, Size+6,Size+6, 0,Size+6);
      }
      else if (Colour == 6){// Ship Collide with Enemy 2 Blue Enemy 2 Gray Particles
        fill(random(150,255),Alpha);
        triangle(0,0, Size*2,Size*2, 0,Size*2);
      }
      else if (Colour == 7){// Ship Collide with Enemy 3 Yellow Enemy 3 Particles
        fill(255, random(100,255), 0);
        quad(0,0, Size/2,Size, Size,0, Size/2,-Size);
      }    
      else if (Colour == 8){
        fill(random(150,255),Alpha);
        quad(0,0, Size/2,Size, Size,0, Size/2,-Size);
      }
      else if (Colour == 9){// Ship Collide with Enemy 4 Yellow Enemy 4 Particles
        fill(0, random(88,200), 255,Alpha);
        ellipse(0,0,Size,Size);
      }   
      else if (Colour == 10){
        fill(255, random(64,246), 64, Alpha);
        quad(0,0, Size/2,Size, Size,0, Size/2,-Size);
        triangle(0,0, Size*2,Size*2, 0,Size*2);
        ellipse(0,0,Size+6,Size+6);
        fill(random(150,255),Alpha);
        rect(0,0,Size,Size,(int) random(2,5)); 
      }
      
      
      if (Colour == 9 || Colour == 10){
        Alpha = Alpha - 10;
      }
      else if (Colour == 7 || Colour == 8){
        Alpha = Alpha - (int) random(5,10);
      }
      else {
        Alpha = Alpha - (int) random(1,25);
      }
      if (Alpha <= 0){
        Alpha = 0;
        Hearts = 0;
      }
    popMatrix();
    
    //println(Alpha);
  
  }














}
