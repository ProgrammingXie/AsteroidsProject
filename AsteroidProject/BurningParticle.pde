class BurningParticle extends Particles{

  
  BurningParticle(){
    Position = myJet.Position.copy();
    Velocity =  myJet.Direction.copy();
    Velocity.rotate(PI + random(-0.7,0.7));
    Velocity.setMag(random(4,15));
    Hearts = 1;
    Alpha = 200;
  }
//===============================================================================================================================================

  void act(){
    Position.add(Velocity);
    
  }
//===============================================================================================================================================  
  
  void show(){
    pushMatrix();
      fill(250,Alpha);
      translate(Position.x,Position.y);
      //rotate(Velocity.heading());
      //noStroke();
      //rotate(random(0,TWO_PI));
      rectMode(CENTER);
      noStroke();
      rect(0,0,6,6);// Smoke after colliding
      
      Alpha = Alpha - 60;
      if (Alpha <= 0){
        Alpha = 0;
        Hearts = 0;
      }
      rectMode(CORNER);
    popMatrix();
  
  }


}
