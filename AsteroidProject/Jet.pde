class Jet extends GameObject{

  //PVector Position;
  //PVector Velocity;
  PVector Direction;
  PVector ReverseDirection;
  //int Hearts;
  int ShootDelay;
  int ShootReady;
  int ShieldColour1;
  int ShieldColour2;
  int ShieldExtend;

//===============================================================================================================================================

  Jet(){
    Position = new PVector (width/2,510);
    ShootDelay = 0;
    ShootReady = 0;
    Velocity = new PVector (0,0);
    Direction = new PVector (0,-0.15);
    ReverseDirection = new PVector (0,0.15);
    Hearts = 30;
    //Hearts = 1;
    ShieldColour1 = 0;
    ShieldColour2 = 255;
    ShieldExtend = 200;
  }

//===============================================================================================================================================

  void act(){
    super.act();
    
    if (Hearts <= 0){
      Hearts = 0; 
      PlayerDead = 1;
    }
    
    if (ShieldDelay == 0 && mousePressed){// Activate Shield
      Shield = true;
      ShieldActivateTime--;
      if (ShieldActivateTime <= 0){
        ShieldActivateTime = 0;
        ShieldDelay = 100;
        Shield = false;
      }
      ShieldBarX = map(ShieldActivateTime,2000,0,0,240);
    }
    else {
      Shield = false;
      ShieldDelay--;
      if (ShieldDelay <= 0){
        ShieldDelay = 0;
        ShieldActivateTime++;
        if (ShieldActivateTime >= 2000){
          ShieldActivateTime = 2000;
        }
        ShieldBarX = map(ShieldActivateTime,0,2000,240,0);
      }      
    }   
    
    if (TransAmMode){      
      TransAmActivateTime--;
      if (TransAmActivateTime <= 0){
        TransAmActivateTime = 0;
        TransAmDelay = 240;
        TransAmMode = false;
      }
      TransAmBarX = map(TransAmActivateTime,1500,0,0,240);   
    }
    else {
      TransAmDelay--;
      if (TransAmDelay <= 0){
        TransAmDelay = 0;
        TransAmActivateTime++;
        if (TransAmActivateTime >= 1500){
          TransAmActivateTime = 1500;
        }
        TransAmBarX = map(TransAmActivateTime,0,1500,240,0);
      }
    }
    
    if (Hearts < 30 && ShipImmortal == 0){
      ShipHpDelay--;
      if (ShipHpDelay <= 0){
        ShipHpDelay = 350;
        Hearts++;
      }
    }
    ShipHpBarX = map(Hearts,30,0,0,345);
    
    if (ShipImmortal != 0){
      ShipHpDelay = 350;
    }

    
    if (MoveForward){// Moving forward
      Velocity.add(Direction);
      for (int i = 0; i < 5; i++){// Forward engine flame
        if (ShipImmortal < 20){
          myGameObjects.add(new Particles());// regular engine flame, NO collision
        }
        myGameObjects.add(new TurningParticle());// turning wing flame
      }
      if (!TransAmMode){
        if (Velocity.mag() > 3) Velocity.setMag(3);// regular forward speed 6
      }
      else {
        if (Velocity.mag() > 2.5) Velocity.setMag(2.5);// TransAm forward speed 4
      }
    }   
    if (MoveBackward){// Moving Backward
      Velocity.add(ReverseDirection);
      for (int i = 0; i < 3; i++){// Backwarc engine flame
        myGameObjects.add(new BackwardParticle());
      }
      if (!TransAmMode){
        if (Velocity.mag() > 3) Velocity.setMag(3);// regular backward speed 6
      }
      else {
        //if (Velocity.x >= 4) Velocity.x = 4;
        //if (Velocity.y >= 4) Velocity.y = 4;
        //if (Velocity.x <= -4) Velocity.x = -4;
        //if (Velocity.y <= -4) Velocity.y = -4;
        if (Velocity.mag() > 2.5) Velocity.setMag(2.5);// TransAm backward speed 4
      }
    }
    if (RotateLeft){// Turning Left
      for (int i = 0; i < 1; i++){// Turning left wing flame
        myGameObjects.add(new TurningParticle());
      }
      if (TransAmMode){
        Direction.rotate(-radians(2.2));// TransAm Turning Speed 4
        ReverseDirection.rotate(-radians(2.2)); 
      }
      else {
        Direction.rotate(-radians(1.9));// Regular Turning speed 3
        ReverseDirection.rotate(-radians(1.9)); 
      }
    }
    if (RotateRight){// Turning Right
      for (int i = 0; i < 1; i++){// Turning Right wing flame
        myGameObjects.add(new TurningParticle());
      }
      if (TransAmMode){
        Direction.rotate(radians(2.2));// TransAm Turning Speed 4 
        ReverseDirection.rotate(radians(2.2)); 
      }
      else {
        Direction.rotate(radians(1.9));// Regular Turning speed 3
        ReverseDirection.rotate(radians(1.9)); 
      }
    }
    
    ShootDelay--;
    if (ShootDelay <= 0) ShootDelay = 0; // Shooting Delays
    if (Shooting && ShootDelay == ShootReady){
      Laser.play();
      myGameObjects.add(new Bullets());
      //myGameObjects.add(new Bullets(12));
      //myGameObjects.add(new Bullets(-13));
      if (TransAmMode){
        ShootDelay = 33;// TransAm Shooting Delay
      }
      else {
        ShootDelay = 40;// Regular Shooting Delay
      }
    }
    else {
      if (!Laser.isPlaying()){
        Laser.rewind();
      }
    }
    
    if (Shield){// Shield ACTIVATED Ship outside screen
      if (Position.x < -ShieldExtend/2-3) Position.x = width+ShieldExtend/2+2;
      if (Position.x > width+ShieldExtend/2+3) Position.x = -ShieldExtend/2-2;
      if (Position.y < -ShieldExtend/2-3) Position.y = height+ShieldExtend/2+2;
      if (Position.y > height+ShieldExtend/2+3) Position.y = -ShieldExtend/2-2; 
    }
    else {// Ship outside of screen only
      if (Position.x < -42) Position.x = width+41;
      if (Position.x > width+42) Position.x = -41;
      if (Position.y < -42) Position.y = height+41;
      if (Position.y > height+42) Position.y = -41;
    }
    
    if (!TransAmMode){
      TransAmMoveIn++;// TransAm Red cover moving in
      if (TransAmMoveIn >= 30){
        TransAmMoveIn = 30;
      }
      TransAmChange = TransAmChange - 4;// TransAm cover transparency
      if (TransAmChange <= 0){
        TransAmChange = 0;
      }
      TransAmBackground = TransAmBackground + 2;// Changing Black Background
      if (TransAmBackground >= 130){
        TransAmBackground = 130;
      }
    }
    else {
      TransAmMoveIn--;
      if (TransAmMoveIn <= 0){
        TransAmMoveIn = 0;
      }
      TransAmChange = TransAmChange + 4;
      if (TransAmChange >= 170){
        TransAmChange = 170;
      }
      TransAmBackground = TransAmBackground - 2;
      if (TransAmBackground <= 40){
        TransAmBackground = 40;
      }   
   }
   
   for (int i = 0; i < myGameObjects.size(); i++){
      GameObject obj = myGameObjects.get(i);
      if (obj instanceof EnemyBullets || obj instanceof EnemyBullets2 || obj instanceof EnemyBullets3){// Hit by Enemy 1 Spinning Bullets
        if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= 30 + 3){
          if (ShipImmortal == 0){
            //println("mmmmmmmmmmmmm");
            Hearts--;
            for (int k = 0; k < 200; k++){
              myGameObjects.add(new AsteroidParticles(Position.x,Position.y,20,1,0));
            }
            ShipImmortal = 800;// ship immortal time
          }
          obj.Hearts = 0;
        }  
      }
      else if (obj instanceof EnemyBullets4){// Hit by Enemy 2 Blue Enemy Bullets
        if (dist(Position.x,Position.y, obj.Position.x,obj.Position.y) <= 30 + 3){
          if (ShipImmortal == 0){
            //println("mmmmmmmmmmmmm");
            Hearts--;
            for (int k = 0; k < 200; k++){
              myGameObjects.add(new AsteroidParticles(Position.x,Position.y,20,2,0));
            }
            ShipImmortal = 800;// ship immortal time
          }
          obj.Hearts = 0;
        } 
      }
   }

    
  }
  
//=============================================================================================================  

  void show(){
    pushMatrix();
      translate(Position.x, Position.y);
      rotate(Direction.heading());
      
      //stroke(0,255,255);// Engine Blue Line
      //strokeWeight(3);
      //line(-8,25, -8,-25);
      
      
      if (ShipImmortal >= 40){
        image(SpaceShipSmoke,10,-5,110,95);// Gray Smoke Ship
      }
      else {
        image(SpaceShip,10,-5,110,95);// Regular Ship
      }
      
      //triangle(-50,-25, 50,0, -50,25);
      //fill(#701FFF);
      //ellipse(40,-13,8,8);// bullets
      //ellipse(40,12,8,8);
      //ellipse(0,0,8,8);// Centre Dot
      //if (ShipHit == true) filter(INVERT);
      if (ShipImmortal >= 20){
        for (int i = 0; i < 6; i++){
          myGameObjects.add(new BurningParticle());// Smoke engine
        }
      }
       
      
      //stroke(255);
      //noFill();
      //ellipse(0,0,60,60);// Jet Hitbox
      
      pushMatrix();// TransAm Cover
        translate(13-TransAmMoveIn,-5);
        fill(255,0,0,TransAmChange);
        noStroke();
        rect(-33,-10,29,30,5);
        triangle(-46,-36, -28,-5, 37,-5);// Left TransAm Triangle
        triangle(-46,45, -28,15, 37,14);// Right TransAm Triangle
        ellipse(-4,5,55,12);    
      popMatrix();     
    popMatrix();
    
    
    
    if (TransAmMode){// Changing back to TransAm Shield Colouor
      fill(#EAAC0E,random(0,15));
      //stroke(ShieldColour1,ShieldColour2,ShieldColour2);    
      //strokeWeight(2);
      //ellipse(0,0,ShieldExtend,ShieldExtend);
          
      //ShieldParticle.ShieldExtendParticle = 0;
      ShieldColour1 = ShieldColour1 + 6;
      if (ShieldColour1 >= 255) ShieldColour1 = 255;
      ShieldColour2 = ShieldColour2 - 6;
      if (ShieldColour2 <= 0) ShieldColour2 = 0;
      ShieldExtend = ShieldExtend + 2;
      if (ShieldExtend >= 240) ShieldExtend = 240;      
    }
    else {// Changing back to regular shield colour
      fill(#008AFF,random(0,30));         
      ShieldColour1 = ShieldColour1 - 6;
      if (ShieldColour1 <= 0) ShieldColour1 = 0;
      ShieldColour2 = ShieldColour2 + 6;
      if (ShieldColour2 >= 255) ShieldColour2 = 255;
      ShieldExtend = ShieldExtend - 2;
      if (ShieldExtend <= 200) ShieldExtend = 200;
    }
    
    if (Shield){
      pushMatrix();
        for (int i = 0; i < 23; i++){// Shield Outside Particles
          myGameObjects.add(new ShieldParticle());
        }
        translate(Position.x, Position.y); 
        stroke(ShieldColour1,ShieldColour2,ShieldColour2);
        strokeWeight(2);
        ellipse(0,0,ShieldExtend,ShieldExtend);// Shield actual circle
      popMatrix();  

    }
    
    
    fill(34,34,34,MissionTeskWordFade);
    stroke(200,MissionTeskWordFade);
    strokeWeight(1);
    rect(1040,830,160,35);
    rect(1040,865,160,40);
    rect(1200,730,250,100);
    rect(0,865,95,40);    
    
    fill(200,MissionTeskWordFade);
    textAlign(CORNER,CORNER);
    textSize(22); 
    text("Mission:", 1213,760);
    
    fill(70,70,70,MissionTeskWordFade);
    rect(1200,830,250,35);
    rect(1200,865,250,40);
    rect(95,865,345,40);
    
    noStroke();
    textAlign(CORNER,CORNER);
    textSize(18);      
    
    if (NoMoreEnemySpawn){
      fill(#00DB29);
    }
    else {
      fill(200,MissionTeskWordFade);
    }
    text("Eliminate All Enemies",1240,788);
    ellipse(1220,781,10,10);    
    
    
    if (NoMoreAsteroids){
      fill(#00DB29);
    }
    else {
      fill(200,MissionTeskWordFade);
    }
    text("Clear All Asteroids",1240,815);
    ellipse(1220,808,10,10);
    
    
    if (Shield){// Shield Activated Shield Bright Words
      fill(ShieldColour1,255,ShieldColour2,180);
    }
    else {// Shield NOT Activated Darker Words
      fill(ShieldColour1,255,ShieldColour2,ShieldChargeWordFade);
    }
    textAlign(CORNER,CORNER);
    textSize(20);
    text("Shield Charge:",1050,890);
    noStroke();
    rect(1201,866,240-ShieldBarX,40);
    
    if (TransAmMode){// TransAm Activated Shield Bright Words
      fill(255,0,0,150);
    }
    else {// TransAm NOT Activated Darker Words
      fill(255,0,0,TransAmChargeWordFade);
    }
    textAlign(CORNER,CORNER);
    textSize(18);
    text("TransAm Mode:",1050,855);
    noStroke();
    rect(1201,831,240-TransAmBarX,34);
    
    fill(#FC4CD4,MyShipHeartsFade);
    textSize(25);
    text("Heath:",10,892);
    noStroke();
    rect(95,866,345-ShipHpBarX,34);
    
    for (int L = 1; L < 30; L++){
      stroke(200,MissionTeskWordFade);
      strokeWeight(1);
      line(95+11.5*L,866,95+11.5*L,905);
    }
    
    //image(Enemy2,300,500,100,100);
    //image(Enemy3,700,445,240,240);
    //image(Enemy1,700,500,90,90);
    
    //println(Velocity);
    //println(Direction);
    //println(ReverseDirection);
    //println(Position.x);
    //println(Position.y);
    //println(Velocity.x);
    //println(Velocity.y);
    //println(TransAmChange);   
    //println(Hearts);
    //println(ShieldExtend);
    //println(ShieldActivateTime);
    //println(ShieldBarX);
    //println(Hearts);
  }
  
  
  
  
}
