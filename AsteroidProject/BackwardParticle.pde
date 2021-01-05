class BackwardParticle extends Particles{ 
  
  BackwardParticle(){
    Position = myJet.Position.copy();
    Velocity =  myJet.Direction.copy();
    Velocity.rotate(PI/2);
    Velocity.setMag(10);
    Size = (int) random(1,5);
    Hearts = 1;
    Alpha = 130;
    if (TransAmMode){
      ParticleColour = #C67B00;
    }
    else {
      ParticleColour = #0086C6;
    } 
  }
//===============================================================================================================================================

  void act(){
  
  }
//===============================================================================================================================================

  void show(){
    pushMatrix();
      //fill(random(150,255), random(150,255), random(150,255),Alpha);
      if (ShipImmortal >= 20){
        fill(150,Alpha);// gray smoke
      }
      else {
        fill(ParticleColour,Alpha);// regular flame
      }
      translate(Position.x,Position.y);
      rotate(Velocity.heading());
      noStroke();
      ellipse(random(-25,-15),-5,Size,Size+12);// Left backward 
      ellipse(random(15,25),-5,Size,Size+12);// right backward


      Alpha = Alpha - 10;//  20
      if (Alpha <= 0){
        Alpha = 0;
        Hearts = 0;
      }
    popMatrix(); 
  }
  
  
}
