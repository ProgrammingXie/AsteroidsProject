class Enemy extends GameObject{
  
  PVector Direction;
  PVector ReverseDirection;
  PVector SpinDirection;
  int ShootDelay;
  int Hearts; 
  int EnemyTypes;
  int EnemyBorder;
  int GoFromPosition;
  float EnemiesAppearDelay;
  int SpinningEnemyFireDelay;
  int EnemyAsteroidsCollisionParticlesDelay;
  int EnemyGetHitLimit;
  boolean Enemy3SpawnField;
  
  Enemy(){
    Velocity = new PVector(0,0);
    GoFromPosition = (int) random(1,4); 
    EnemiesAppearDelay = 0;
    SpinningEnemyFireDelay = 100;
    EnemyAsteroidsCollisionParticlesDelay = 0;
    Enemy3SpawnField = true;
    //EnemyTypes = 3;
    
    if (AllowEnemyTypes == 0){
      EnemyTypes = 1;
    }
    else if (AllowEnemyTypes == 1){
      EnemyTypes = 2;
    }
    else if (AllowEnemyTypes == 2){
      EnemyTypes = 3;
    }
    
    //Position = new PVector (width/2-200,height/2);
    
    if (EnemyTypes == 1){// Spinning 3 way enemy 
      EnemyBorder = 45;
    }
    else if (EnemyTypes == 2){
      EnemyBorder = 50;
    }
    else if (EnemyTypes == 3){
      EnemyBorder = 120;
    }
    
    if (GoFromPosition == 0){
      Position = new PVector (random(300,width-300),-EnemyBorder-5);
    }
    else if (GoFromPosition == 1){
      Position = new PVector (random(300,width-300),height+EnemyBorder+5);
    }
    else if (GoFromPosition == 2){
      Position = new PVector (-EnemyBorder-5,random(300,height-300));
    }
    else {
      Position = new PVector (width+EnemyBorder+5,random(300,height-300));
    } 
    
    if (EnemyTypes == 1){// Spinning 3 way enemy 
      SpinDirection = new PVector (0,-0.15);
      EnemyGetHitLimit = 30;
      EnemyBorder = 45;
      Hearts = 20;
    }
    else if (EnemyTypes == 2){
      SpinDirection = new PVector(myJet.Position.x - Position.x, myJet.Position.y - Position.y);
      EnemyGetHitLimit = 35;
      EnemyBorder = 50;
      Hearts = 36;
    }
    else if (EnemyTypes == 3){
      EnemyGetHitLimit = 100;
      EnemyBorder = 120;
      Hearts = 50;
    }

    if (GoFromPosition == 0){
      Direction = new PVector (random(-1,1),2);
    }
    else if (GoFromPosition == 1){
      Direction = new PVector (random(-1,1),-2);
    }
    else if (GoFromPosition == 2){
      Direction = new PVector (2,random(-1,1));
    }
    else {
      Direction = new PVector (-2,random(-1,1));
    }  
    
    ShootDelay = 0;   
  }
//=============================================================================================================

  Enemy(float X, float Y, float VX, float VY, int Enemy){
    Position = new PVector (X,Y);
    Velocity = new PVector(0,0);
    Direction = new PVector(VX+random(-1,1),VY+random(-1,1));
    //SpinDirection = new PVector (0,-0.15);
    EnemyTypes = Enemy;  
    ShootDelay = 0;
    EnemyBorder = 45;
    Hearts = 14;
    SpinningEnemyFireDelay = 100;
  }

//=============================================================================================================
  
  void act(){
    EnemiesAppearDelay--;
    if (EnemiesAppearDelay <= 0){
      EnemiesAppearDelay = 0;
      Position.add(Velocity);
      Velocity.add(Direction);

      
      SpinningEnemyFireDelay--;
      if (SpinningEnemyFireDelay <= -600) SpinningEnemyFireDelay = -600;
      
      if (EnemyTypes == 1){// Spinning 3 way enemy spinning animation
        //println(">>>>>>>>>>>>>>>");
        SpinDirection.rotate(radians(2));
        if (!TransAmMode){// Regular Enemy 1 Speed
          if (Velocity.mag() > 3) Velocity.setMag(3);
        }
        else {// TransAm Enemy 2 Speed
          if (Velocity.mag() > 2.2) Velocity.setMag(2.2);
        }
      }
      else if (EnemyTypes == 2){// Blue Enemy 2
        SpinDirection = new PVector(myJet.Position.x - Position.x, myJet.Position.y - Position.y);
        if (!TransAmMode){// Regular Enemy 2 Speed
          if (Velocity.mag() > 2.2) Velocity.setMag(2.2);
        }
        else {// TransAm Enemy 2 Speed
          if (Velocity.mag() > 1.8) Velocity.setMag(1.8);
        }
      }
      else if (EnemyTypes == 3){
        //println("]]]]]]]]]]]]]]]]]]]");
        if (!TransAmMode){// Regular Enemy 3 Speed
          if (Velocity.mag() > 1) Velocity.setMag(1);
        }
        else {// TransAm Enemy 3 Speed
          if (Velocity.mag() > 0.5) Velocity.setMag(0.5);
        }
      }



      
      if (Position.x < -EnemyBorder-15 || Position.x > width+EnemyBorder+15 || Position.y < -EnemyBorder-15 || Position.y > height+EnemyBorder+15){
        Enemy3SpawnField = true;
        SpinningEnemyFireDelay = 150;
        GoFromPosition = (int) random(0,4);
        //GoFromPosition = 3;
        if (GoFromPosition == 0){// go from top
          Position.x = random(400,width-400);
          Position.y = -EnemyBorder-10;
          Direction = new PVector (random(-1,1),2);
        }
        else if (GoFromPosition == 1){// go from bottom
          Position.x = random(400,width-400);
          Position.y = height+EnemyBorder+10;
          Direction = new PVector (random(-1,1),-2);
        }
        else if (GoFromPosition == 2){// go from left
          Position.x = -EnemyBorder-10;
          Position.y = random(300,height-300);
          Direction = new PVector (2,random(-1,1));
        }
        else {// go from right
          Position.x = width+EnemyBorder+10;
          Position.y = random(300,height-300);
          Direction = new PVector (-2,random(-1,1));
        }
        EnemiesAppearDelay = random(300,500);
        //EnemiesAppearDelay = 60;
      }
    } 
    
    
    
    
    ShootDelay--;
    if (EnemyTypes == 1){// Spinning 3 way enemy shooting delay
      if (SpinningEnemyFireDelay <= 30 && SpinningEnemyFireDelay > -130){
        if (ShootDelay <= 0){
          Enemy1Laser.play();
          myGameObjects.add(new EnemyBullets(Position.x,Position.y, SpinDirection.x,SpinDirection.y));
          myGameObjects.add(new EnemyBullets2(Position.x,Position.y, SpinDirection.x,SpinDirection.y));
          myGameObjects.add(new EnemyBullets3(Position.x,Position.y, SpinDirection.x,SpinDirection.y));
          ShootDelay = 5;
        }
        else {
          if (!Enemy1Laser.isPlaying()){
            Enemy1Laser.rewind();
            Enemy1Laser.pause();
          }
        }
      }
    }
    else if (EnemyTypes == 2){// Enemy 2 Blue Shooting Delay
      if (SpinningEnemyFireDelay < 0 && SpinningEnemyFireDelay > -300){
        if (ShootDelay <= 0){
          Enemy2Laser.play();
          myGameObjects.add(new EnemyBullets4(Position.x,Position.y, SpinDirection.x,SpinDirection.y));
          ShootDelay = 25;
        }
        else {
          if (!Enemy2Laser.isPlaying()){
            Enemy2Laser.rewind();
            Enemy2Laser.pause();
          }
        }
      }
    }
    else if (EnemyTypes == 3){
      if (SpinningEnemyFireDelay == -300){
        Enemy3SpawnEnemy1.play();
        myEnemies.add(new Enemy(Position.x, Position.y, Velocity.x, Velocity.y, 2));
        Enemy3SpawnField = false;
      }
      else {
        if (!Enemy3SpawnEnemy1.isPlaying()){
          Enemy3SpawnEnemy1.rewind();
          Enemy3SpawnEnemy1.pause();
        }
      }
    }
    
    
    
    
    if (dist(Position.x,Position.y, myJet.Position.x,myJet.Position.y) <= EnemyGetHitLimit + 30){// Enemy Colliding Ship Particles
      ShipEnemyCollision.play();
      //println("bbbbbbbbbb");
      if (ShipImmortal == 0){
         Hearts--;
         myJet.Hearts--;
         for (int k = 0; k < 40; k++){
           myGameObjects.add(new CollidingParticles(myJet.Position.x,myJet.Position.y, 1));
           myGameObjects.add(new CollidingParticles(myJet.Position.x,myJet.Position.y, 2));        
           if (EnemyTypes == 1){
             myGameObjects.add(new CollidingParticles(Position.x,Position.y, 3));  
             myGameObjects.add(new CollidingParticles(Position.x,Position.y, 4));  
           }
           else if (EnemyTypes == 2){
             myGameObjects.add(new CollidingParticles(Position.x,Position.y, 5));  
             myGameObjects.add(new CollidingParticles(Position.x,Position.y, 6));  
           }
           else if (EnemyTypes == 3){
             myGameObjects.add(new CollidingParticles(Position.x,Position.y, 7));  
             myGameObjects.add(new CollidingParticles(Position.x,Position.y, 8));  
           }
         }
         ShipImmortal = 800;// ship immortal time
       }
     }
     else {
       if (!ShipEnemyCollision.isPlaying()){
         ShipEnemyCollision.rewind();
         ShipEnemyCollision.pause();
       }
     }
   
             
  
     
     
    for (int i = 0; i < myGameObjects.size(); i++){
      GameObject obj = myGameObjects.get(i);
      if (obj instanceof Bullets){// Hit By Ship Bullets
        if (EnemyTypes == 1){  
          if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= 60 + obj.Size){
            if (obj.Size == 6){// Trans Am Bullets Extra damage 
              //println("yellowBullets");
              Hearts = Hearts - 2;            
            }
            else if (obj.Size == 5){// regular bullets 
              //println("regularBullets");
              Hearts--;            
            }
            for (int k = 0; k < 100; k++){// Enemy Colliding Ship Bullets Particles
              if (TransAmMode){
                myGameObjects.add(new AsteroidParticles(Position.x,Position.y, EnemyBorder/2,10,0));
              }
              else {
                myGameObjects.add(new AsteroidParticles(Position.x,Position.y, EnemyBorder/2+10,0,0));
              }
              //myGameObjects.add(new CollidingParticles(Position.x,Position.y, 3));  
              //myGameObjects.add(new CollidingParticles(Position.x,Position.y, 4));  
            }
            obj.Hearts = 0;
          }
        }
        else if (EnemyTypes == 2){
          if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= 70 + obj.Size){
            if (obj.Size == 6){// Trans Am Bullets Extra damage 
              //println("yellowBullets");
              Hearts = Hearts - 2;            
            }
            else if (obj.Size == 5){// regular bullets 
              //println("regularBullets");
              Hearts--;            
            }
            for (int k = 0; k < 100; k++){// Enemy Colliding Ship Bullets Particles
              if (TransAmMode){
                myGameObjects.add(new AsteroidParticles(Position.x,Position.y, EnemyBorder/2,10,0));
              }
              else {
                myGameObjects.add(new AsteroidParticles(Position.x,Position.y, EnemyBorder/2+10,0,0));
              }
              //myGameObjects.add(new CollidingParticles(Position.x,Position.y, 5));  
              //myGameObjects.add(new CollidingParticles(Position.x,Position.y, 6));  
            }
            obj.Hearts = 0;
          }
        }
        else if (EnemyTypes == 3){
          if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= 140 + obj.Size){
            if (obj.Size == 6){// Trans Am Bullets Extra damage 
              //println("yellowBullets");
              Hearts = Hearts - 2;            
            }
            else if (obj.Size == 5){// regular bullets 
              //println("regularBullets");
              Hearts--;            
            }
            for (int k = 0; k < 100; k++){// Enemy Colliding Ship Bullets Particles
              if (TransAmMode){
                myGameObjects.add(new AsteroidParticles(Position.x,Position.y, EnemyGetHitLimit,10,1));
              }
              else {
                myGameObjects.add(new AsteroidParticles(Position.x,Position.y, EnemyGetHitLimit,0,1));
              }
              //myGameObjects.add(new CollidingParticles(Position.x,Position.y, 7));  
              //myGameObjects.add(new CollidingParticles(Position.x,Position.y, 8));  
              //myGameObjects.add(new CollidingParticles(Position.x,Position.y, 9)); 
            }
            obj.Hearts = 0;
          }
        }        
      }
    }  
    
    
    
    
    EnemyAsteroidsCollisionParticlesDelay--;
    if (EnemyAsteroidsCollisionParticlesDelay <= 0){
      EnemyAsteroidsCollisionParticlesDelay = 0;
    }
    
    for (int k = 0; k < myAsteroidNumbers.size(); k++){
      GameObject obj = myAsteroidNumbers.get(k);
      if (obj instanceof Asteroids && EnemyAsteroidsCollisionParticlesDelay == 0 && (EnemyTypes == 1 || EnemyTypes == 2) ){// Hit by Asteroids Paticles Only NO DAMAGE
        if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= EnemyGetHitLimit + obj.Size/2){
          for (int a = 0; a < 35; a++){
            if (EnemyTypes == 1){
              myGameObjects.add(new CollidingParticles(obj.Position.x,obj.Position.y, 0));
              myGameObjects.add(new CollidingParticles(Position.x,Position.y, 3));  
              myGameObjects.add(new CollidingParticles(Position.x,Position.y, 4));            
            }
            else if (EnemyTypes == 2){
              myGameObjects.add(new CollidingParticles(obj.Position.x,obj.Position.y, 0));
              myGameObjects.add(new CollidingParticles(Position.x,Position.y, 5));  
              myGameObjects.add(new CollidingParticles(Position.x,Position.y, 6));  
            }
          }    
          EnemyAsteroidsCollisionParticlesDelay = 60;
          obj.Velocity.rotate(PI);// change Velocity of asteroid.
          //obj.Velocity.setMag(0);
        }
      }
    }
    
    
    
    
    
  }
//=============================================================================================================

  void show(){
    pushMatrix();
      if (EnemyTypes == 1){
        translate(Position.x,Position.y);// Spinning 3 way enemy
        rotate(SpinDirection.heading());
        image(Enemy1,0,0,90,90);
        
        //noFill();
        //stroke(255);
        //ellipse(0,0,60,60);// hit box enemy 1
      }
      else if (EnemyTypes == 2){
        translate(Position.x,Position.y);// Blue Enemy
        rotate(SpinDirection.heading() + PI/2);
        image(Enemy2,0,-10,100,100);
        
        //noFill();
        //stroke(255);
        //ellipse(0,0,70,70);// hit box enemy 2
      }
      else if (EnemyTypes == 3){
        translate(Position.x,Position.y);// Enemy Mother Ship
        rotate(Direction.heading() + PI/2);
        image(Enemy3,0,0,240,240);
        
        if (Enemy3SpawnField){
          fill(0,255,255,random(10,70));
          noStroke();
          ellipse(0,0,200,200);
        }
        
        //noFill();
        //stroke(255);
        //ellipse(0,0,200,200);// hit box enemy 3  
      }
    popMatrix();

    //println(SpinDirection);
    //println(Position);
    //println(Hearts);
    //println(Velocity);
    //println(SpinDirection.heading());
    //println(SpinDirection);
    //println(GoFromPosition);
    //println(EnemyGetHitLimit);
  }
}
