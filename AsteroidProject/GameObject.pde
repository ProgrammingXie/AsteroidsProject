class GameObject{

  PVector Position;
  PVector Velocity;
  int Size;
  int Hearts;

//===============================================================================================================================================
  GameObject(){
    
  }

//===============================================================================================================================================
  void act(){
    Position.add(Velocity);
    
  }
//===============================================================================================================================================

  void show(){
    //pushMatrix();
    //  translate(Position.x,Position.y);
    //popMatrix();
  }


}
