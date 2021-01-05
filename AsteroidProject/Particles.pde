class Particles extends GameObject{
  
  int Alpha;
  int ParticleColour;
  
//===============================================================================================================================================

  Particles(){
    Position = myJet.Position.copy();
    Velocity =  myJet.Direction.copy();
    Velocity.rotate(PI/2 + random(-2,2));
    //Velocity.rotate(PI/2);
    Velocity.setMag(10);
    Size = 3;
    Hearts = 1;
    Alpha = 130;
    if (TransAmMode){
      ParticleColour = #FF954D;
    }
    else {
      ParticleColour = #03B1FF;
    }
  }
//===============================================================================================================================================

  void act(){
    //super.act();
    
  }
//===============================================================================================================================================

  void show(){

    pushMatrix();
      //fill(random(150,255), random(150,255), random(150,255),Alpha);
      fill(ParticleColour,Alpha);
      translate(Position.x,Position.y);
      rotate(Velocity.heading());
      noStroke();
      ellipse(random(-1,1),random(5,10),Size,Size+6);// Enginer particles


      Alpha = Alpha - 8;// 20
      if (Alpha <= 0){
        Alpha = 0;
        Hearts = 0;
      }
    popMatrix(); 
  }
  
}
