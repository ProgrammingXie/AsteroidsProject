class Asteroids extends GameObject{

  color AsteroidColour;
  int SizeOptions;
  int ShieldTransAmDamageDelay = 0;
  boolean ElectricStroke = false;
  boolean FlameStroke = false;
  //boolean BulletStroke = false;
  int Alpha;
  int AsteroidParticleNumber;
  int AsteroidsHitParticlesDelay;
  
//===============================================================================================================================================

  Asteroids(){
    Velocity = new PVector (2,0);
    Velocity.rotate(random(0,TWO_PI));
    SizeOptions = (int) random(0,5);
    ShieldTransAmDamageDelay = 0;
    AsteroidColour = 200;  
    Alpha = 255;
    AsteroidParticleNumber = 100;
    AsteroidsHitParticlesDelay = 0;
    if (SizeOptions >= 3 && SizeOptions <= 6){// Large asteroids
      AsteroidColour = #431A01;
      Hearts = 6;
      Size = 80;
    }
    else if (SizeOptions >= 1 && SizeOptions < 3){// Medium asteroids
      //println("hhhhhhh");
      AsteroidColour = #6A3B1C;
      Hearts = 3;
      Size = 40; 
    }
    else {// Smallest asteroids
      AsteroidColour = #AF571C;
      Hearts = 1;
      Size = 20; 
      //println("aaaaaaaaaaaaa");
    }
    Position = new PVector (random(width), -Size/2-15);
  }
//===============================================================================================================================================    
  Asteroids (int s, float x, float y, int h, color c){
    AsteroidColour = c;
    Hearts = h;
    Size = s;
    Position = new PVector (x,y);
    Velocity = new PVector (2,0);
    Velocity.rotate( random(0,TWO_PI));
    //println(c, #6A3B1C, #AF571C);    
    //println();
  }
//===============================================================================================================================================
  void act(){
    super.act();
    
    if (TransAmMode){
      Velocity.setMag(0.3); // TransAm Asteroids Speed decreases  0.5
    }
    else {
      Velocity.setMag(1);// Asteroids regular speed   2
    }
    
    ElectricStroke = false;
    FlameStroke = false;
    
    if (Position.x > width+Size/2+20) Position.x = (-Size/2)-19;// Asteroids go out of screen
    if (Position.x < -Size/2-20) Position.x = width+(Size/2)+19;
    if (Position.y > height+Size/2+20) Position.y = (-Size/2)-19;
    if (Position.y < -Size/2-20) Position.y = height+(Size/2)+19;

    for (int i = 0; i < myGameObjects.size(); i++){
      GameObject obj = myGameObjects.get(i);
      if (obj instanceof Bullets){
        //println("qqqqqqqqqqqq");
        if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= Size + obj.Size/2){// contact Ship BUllets
          obj.Hearts = 0;
          if (Size == 80 ){
            AsteroidParticleNumber = 120;
          }
          else if (Size == 40){
            AsteroidParticleNumber = 60;
          }
          else {
            AsteroidParticleNumber = 20;
          }  
          
          for (int k = 0; k < AsteroidParticleNumber; k++){// Asteroid Colliding Ship Bullets Particles
            if (TransAmMode){
              myGameObjects.add(new AsteroidParticles(Position.x,Position.y, Size/2,10,0));
            }
            else {
              myGameObjects.add(new AsteroidParticles(Position.x,Position.y, Size/2,0,0));
            }
          }
          
          //for ( int y = 0; y < 100; y++){// Test Colliding Particles
          //   myGameObjects.add(new CollidingParticles(Position.x,Position.y, 3));  
          //   myGameObjects.add(new CollidingParticles(Position.x,Position.y, 4));  
          //}
          
          //BulletStroke = true;
          if (obj.Size == 6){// Trans Am Bullets Extra damage 
            //println("yellowBullets");
            Hearts = Hearts - 2;            
          }
          else if (obj.Size == 5){// regular bullets 
            //println("regularBullets");
            Hearts--;            
          }
         
          if (Hearts <= 0 &&  Size == 40){// change into SMALLEST size asteroid
            //println("kkkkkkkkkkkkkkkkkk");
            myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
            myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
          }
          else if (Hearts <= 0 &&  Size == 80) {// change into MEDIUM size asteroid
            //println("aaaaaaaaaaaaa");
            myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
            myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
          }
        }
        //else {
        //  BulletStroke = false;
        //}
      }  
      else if (obj instanceof EnemyBullets || obj instanceof EnemyBullets2 || obj instanceof EnemyBullets3){
        if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= Size+ obj.Size/2){// contact Enemy 1 Spinning BUllets
          obj.Hearts = 0;
          if (Size == 80 ){
            AsteroidParticleNumber = 120;
          }
          else if (Size == 40){
            AsteroidParticleNumber = 60;
          }
          else {
            AsteroidParticleNumber = 20;
          }  
          for (int k = 0; k < AsteroidParticleNumber; k++){// Asteroid Colliding with Enemy Bullets Particles
            myGameObjects.add(new AsteroidParticles(Position.x,Position.y, Size/2,1,0));
          }
          
          Hearts--;            
         
          if (Hearts <= 0 &&  Size == 40){// change into SMALLEST size asteroid
            //println("kkkkkkkkkkkkkkkkkk");
            myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
            myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
          }
          else if (Hearts <= 0 &&  Size == 80) {// change into MEDIUM size asteroid
            //println("aaaaaaaaaaaaa");
            myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
            myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
          }
        }
      }
      else if (obj instanceof EnemyBullets4){
        if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= Size+ obj.Size/2){// contact Enemy 2 Blue Enemy  BUllets
          obj.Hearts = 0;
          if (Size == 80 ){
            AsteroidParticleNumber = 120;
          }
          else if (Size == 40){
            AsteroidParticleNumber = 60;
          }
          else {
            AsteroidParticleNumber = 20;
          }  
          for (int k = 0; k < AsteroidParticleNumber; k++){// Asteroid Colliding with Enemy Bullets Particles
            myGameObjects.add(new AsteroidParticles(Position.x,Position.y, Size/2,2,0));
          }
          
          Hearts--;            
         
          if (Hearts <= 0 &&  Size == 40){// change into SMALLEST size asteroid
            //println("kkkkkkkkkkkkkkkkkk");
            myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
            myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
          }
          else if (Hearts <= 0 &&  Size == 80) {// change into MEDIUM size asteroid
            //println("aaaaaaaaaaaaa");
            myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
            myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
          }
        }
      }
    }
    
    if (dist(Position.x,Position.y, myJet.Position.x,myJet.Position.y) <= Size/2 + myJet.ShieldExtend/2){// force shield
      //println(obj.Size);
      if (Shield){
        if (TransAmMode){// TransAm Flame Shield
          if (ShieldTransAmDamageDelay == 0){
            //AsteroidColour = #FF0000;
            FlameStroke = true;
            Hearts--;
            //println("kkkkkkkkkkkkk");
            ShieldTransAmDamageDelay = 1000;
            if (Hearts <= 0 &&  Size == 40){// change into SMALLEST size asteroid
              //println("nnnnnnnnn");
              myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,2,#AF571C));
              myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,2,#AF571C));              
            }
            else if (Hearts <= 0 &&  Size == 80) {// change into MEDIUM size asteroid
              //println("jjjjjjjjjjjjjjj");
              myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,4,#6A3B1C));
              myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,4,#6A3B1C));
            }
          }
        }
        else {            
          ElectricStroke = true;// Electric shield 
          Velocity.setMag(0.03);
        } 
      }
    }
    
    if (dist(Position.x,Position.y, myJet.Position.x,myJet.Position.y) <= Size/2 + 15){// Asteroids collision with Ship
      ShipAsteroidsCollision.play();
      if (ShipImmortal == 0){
        myJet.Hearts--;
        Hearts--;
        if (Hearts <= 0 &&  Size == 40){// change into SMALLEST size asteroid
          myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
          myAsteroidNumbers.add(new Asteroids(20, Position.x, Position.y,1,#AF571C));
        }
        else if (Hearts <= 0 &&  Size == 50) {// change into MEDIUM size asteroid
          myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
          myAsteroidNumbers.add(new Asteroids(40, Position.x, Position.y,3,#6A3B1C));
        }     
        
        for (int k = 0; k < 35; k++){// Asteroid Colliding Ship Particles
          myGameObjects.add(new CollidingParticles(myJet.Position.x,myJet.Position.y, 1));
          myGameObjects.add(new CollidingParticles(myJet.Position.x,myJet.Position.y, 2));
        }
        AsteroidsHitParticlesDelay = 60;
        ShipImmortal = 800;// ship immortal time
      }
      else {
        if (AsteroidsHitParticlesDelay == 0){
          for (int k = 0; k < 35; k++){
            myGameObjects.add(new CollidingParticles(myJet.Position.x,myJet.Position.y, 0));
          }
          AsteroidsHitParticlesDelay = 60;
        }
      }
      Velocity.rotate(PI);// change Velocity of asteroid.
      //Velocity.setMag(0);//
    }
    else {
      if (!ShipAsteroidsCollision.isPlaying()){
        ShipAsteroidsCollision.rewind();
        ShipAsteroidsCollision.pause();
      }  
      AsteroidsHitParticlesDelay--;
      if (AsteroidsHitParticlesDelay <= 0){
        AsteroidsHitParticlesDelay = 0;
      }  
    }
    
        
    
    
    
    
    
  }
//===============================================================================================================================================  

  void show(){
    
    if (TransAmMode){
      ShieldTransAmDamageDelay = ShieldTransAmDamageDelay - 9;// Shield Damage delay
      if (ShieldTransAmDamageDelay <= 0) ShieldTransAmDamageDelay = 0;
    }
    
   
    if (ElectricStroke){
      stroke(random(200,255), random(0,255),random(0,255));// electric shield stroke
      strokeWeight(3);
    }
    else if (FlameStroke){// flame shield stroke
      stroke(255,255,0);
      strokeWeight(4);
    }
    //else if (BulletStroke){
    //  if (TransAmMode){
    //    stroke(#980000);
    //  }
    //  else {
    //    stroke(#06D67D);
    //  }
    //  strokeWeight(6);
    //}
    else {
      noStroke();
    }
    fill(AsteroidColour);
    //stroke(255);
    ellipse(Position.x,Position.y,Size,Size);
    
    
    //fill(#4D1C05);
    //stroke(0);
    //strokeWeight(1);
    //ellipse(Position.x-5,Position.y,10,10);
    
   
    
    //println(Velocity.x);
    //println(Velocity.y);
    //println(Hearts);
    //println(ShieldTransAmDamageDelay);
    //println(obj.Size);
    //println(Velocity);
    //println(ShieldTransAmDamageDelay);
    //println(AsteroidColour);
    //println(AsteroidsHitParticlesDelay);
    //print(AsteroidsParticlesShip);
    //println(ShipImmortal);
  }

}
