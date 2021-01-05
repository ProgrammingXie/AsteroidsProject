class AsteroidParticles extends GameObject{
  
  int Alpha;
  int Colour;
  int AlphaChange;
  
  AsteroidParticles(float X, float Y, int size, int ColourOption, int AC){
    Position = new PVector (X,Y);
    Velocity = new PVector (2,0);
    Velocity.rotate(random(0,TWO_PI));
    Velocity.setMag(6);
    Hearts = 1;  
    Alpha = 255;
    Size = size;
    Colour = ColourOption;
    AlphaChange = AC;
  }
  
//===============================================================================================================================================

  void act(){
    super.act();

  }
  
//===============================================================================================================================================

  void show(){
    pushMatrix();
      if (Colour == 0){// Ship Bullets Partciles
        fill(random(64,245), random(64,212), 255, Alpha);
      }
      else if (Colour == 1){// Enemy 1 Spinning Bullets Particles;
        fill(random(25,62), random(103,255), 0, Alpha);
      }
      else if (Colour == 2){// Enemy 2 Blue Enemy Bullets Paricles
        fill(0, random(0,160), 255,Alpha);
      }
      else if (Colour == 10){// Everything hit by TransAm Mode asteroid particles
        fill(255, random(64,246), 64, Alpha);
      }
    
      translate(Position.x,Position.y);
      rotate(Velocity.heading());
      noStroke();
      //rect(0,Size,2,10);   
      
      if (AlphaChange == 0){
        Alpha = Alpha - 30;// 50  35
        rect(0,Size,2,10);
      }
      else {
        Alpha = Alpha - 20;
        rect(0,Size,3,20);
      }
      
      if (Alpha <= 0){
        Alpha = 0;
        Hearts = 0;
      }
    popMatrix();
  
    
  
  }
}
