class ShieldParticle extends GameObject{
  
  int ShieldExtendParticle;

//===============================================================================================================================================

  ShieldParticle(){
    Position = myJet.Position.copy();
    Hearts = 100;
    ShieldExtendParticle = 0;
  }

//===============================================================================================================================================

  void act(){
   if (TransAmMode){
      fill(random(200,255),random(0,255),0);
      //ShieldExtendParticle++;
    }
    else {
      fill(0, random(0,255), random(0,255));
      //ShieldExtendParticle--;
    }
    
    Hearts = Hearts - 20;//  40
    if (Hearts <= 0) Hearts = 0;
   
  }

//===============================================================================================================================================

  void show(){
    
    pushMatrix();
      translate(Position.x,Position.y);
      noStroke();
      rotate(random(0,360));
      if (TransAmMode){
        ShieldExtendParticle = 20;// TransAm Shield particles extend distance
      }
      else {
        ShieldExtendParticle = 0;// Regular Shield particles distance 
      }
      rect(random(-20,20),100+ShieldExtendParticle,4,4);
    popMatrix();
    
    //println(ShieldExtendParticle);
   
   
 }


}
