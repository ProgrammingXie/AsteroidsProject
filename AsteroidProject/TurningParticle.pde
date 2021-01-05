class TurningParticle extends Particles{


  TurningParticle(){
    Position = myJet.Position.copy();
    Velocity =  myJet.Direction.copy();
    Velocity.rotate(PI/2);
    Velocity.setMag(10);
    Size = (int) random(1,5);
    Hearts = 1;
    Alpha = 130;
    if (TransAmMode){
      ParticleColour = #FFC608;
    }
    else {
      ParticleColour = #00FFFF;
    }  
  }

//===============================================================================================================================================

  void act(){
    
  }
  
//===============================================================================================================================================

  void show(){
    pushMatrix();
      if (ShipImmortal >= 20){
        fill(200,Alpha);// gray smoke
      }
      else {
        fill(ParticleColour,Alpha);// regular colour flame colour
      }
      translate(Position.x,Position.y);
      rotate(Velocity.heading());
      noStroke();
      ellipse(random(-28,-23),15,Size,Size+5);// left backward particles
      ellipse(random(23,28),15,Size,Size+5); // right backward particles
        
      Alpha = Alpha - 8;// 10s
      if (Alpha <= 0){
        Alpha = 0;
        Hearts = 0;
      }
    popMatrix(); 
  }





}
