class Bullets extends GameObject{

  //PVector Position;
  //PVector Velocity;
  //PVector Hearts;
  //int Size;
    int BulletColour;
//===============================================================================================================================================

  Bullets(){
    Position = new PVector (myJet.Position.x,myJet.Position.y);
    Velocity = new PVector (myJet.Direction.x,myJet.Direction.y);
    Hearts = 1;  
    if (TransAmMode){// TransAm Mode
      BulletColour = #FFE603;
      Size = 6;
      Velocity.setMag(8);
    }
    else {
      BulletColour = #E83BFF;
      Size = 5;
      Velocity.setMag(10);
    }
    
  }
//===============================================================================================================================================
  
  void act(){ 
    super.act();
    if (Position.x < 0 || Position.x > width || Position.y < 0 || Position.y > height){
      Hearts = 0;
    }
  }
//===============================================================================================================================================

  void show(){
    fill(BulletColour);
    pushMatrix();
      translate(Position.x,Position.y);
      rotate(Velocity.heading());
      noStroke();
      ellipse(40,-13,Size,Size);// left bullets
      ellipse(40,12,Size,Size);// right bullets
      //ellipse(40,0,Size,Size);
    popMatrix();     
    
  }
 




}
