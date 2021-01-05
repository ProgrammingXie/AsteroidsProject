class EnemyBullets4 extends GameObject{
  
  EnemyBullets4(float X, float Y, float SpinX, float SpinY){
    Position = new PVector(X,Y);
    Velocity = new PVector (SpinX,SpinY);
    Hearts = 1;  
    
    if (TransAmMode){// under TransAm Mode
      Size = 6;
      Velocity.setMag(10);
    }
    else {
      Size = 5;
      Velocity.setMag(12);
    }
  }
  
  void act(){
    super.act();
    
    if (Shield && dist(Position.x,Position.y, myJet.Position.x,myJet.Position.y) <= 3 + myJet.ShieldExtend/2){
      Hearts = 0;
    }
    
    if (Position.x < 0 || Position.x > width || Position.y < 0 || Position.y > height){
      Hearts = 0;
    }  
  }
  
  void show(){
    fill(#0041FF);
    pushMatrix();
      translate(Position.x,Position.y);
      rotate(Velocity.heading());
      noStroke();
      ellipse(0,15,6,6);
      ellipse(0,-15,6,6);
    popMatrix();  
 
  } 
  

}
