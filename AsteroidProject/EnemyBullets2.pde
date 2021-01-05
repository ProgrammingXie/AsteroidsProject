class EnemyBullets2 extends GameObject{
  
  EnemyBullets2(float X, float Y, float SpinX, float SpinY){
    Position = new PVector(X,Y);
    Velocity = new PVector (SpinX,SpinY);
    Velocity.rotate(radians(120));
    Hearts = 1;  
    
    if (TransAmMode){// under TransAm Mode
      Size = 6;
      Velocity.setMag(3);
    }
    else {
      Size = 5;
      Velocity.setMag(6);
    }
  }
  
  void act(){
    super.act();
    
    if (Shield && dist(Position.x,Position.y, myJet.Position.x,myJet.Position.y) <= 32 + myJet.ShieldExtend/2){
      Hearts = 0;
    }
       
    if (Position.x < 0 || Position.x > width || Position.y < 0 || Position.y > height){
      Hearts = 0;
    }  
  }
  
  void show(){
    fill(#00BF34);
    pushMatrix();
      translate(Position.x,Position.y);
      rotate(Velocity.heading());
      noStroke();
      ellipse(32,0,6,6);
    popMatrix();  
 
  } 
  

}
