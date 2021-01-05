void Game() {

  fill(0, TransAmBackground);
  noStroke();
  rect(0, 0, width, height);
  
  if (GameSettingPause == 0){
    ShipImmortal--;
  }
  if (ShipImmortal<= 0) ShipImmortal = 0;

  //image(SpaceShip,300,-42,110,95);
  //image(TransAmShip,300,-42,110,95);
  //testAsteroids.show();
  //testAsteroids.act();

  //myJet.act();
  //myJet.show();

  if (BeforeGameAnimation) {
    pushMatrix();    
    translate(width/2-5, GameAnimationShipY);
    rotate(-PI/2);
    image(SpaceShip, 0, 0, 110, 95);// Regular your Ship  
    popMatrix();
    
    pushMatrix();
      translate(width/2-145, GameAnimationShipY+140);
      rotate(-PI/2 + radians(FriendShipRotate*-1));
      image(SpaceShipFriend1,FriendShipHorizontal,0,110,95);// Friend 1 pink
    popMatrix();
    
    pushMatrix();
      translate(width/2+135, GameAnimationShipY+140);
      rotate(-PI/2 + radians(FriendShipRotate));
      image(SpaceShipFriend2,FriendShipHorizontal,0,110,95);// Friend 2 gray;
    popMatrix();

    fill(10);
    stroke(#F7F000);
    strokeWeight(1);
    rect(ChatBarX+20, 200, 300, ChatBoxInnerY);// chat box drop

    fill(40);
    stroke(#F7F000);
    strokeWeight(2);
    rect(ChatBarX, 200, 300, 20, 6);// chat box top box

    textSize(18);
    textAlign(CORNER, CORNER);
    fill(#FF3EBF, ChatAlpha);
    text("- John, go up the middle, fill", ChatBarX+30, 250);
    text("   the hole.", ChatBarX+30, 270);
    text("- I will go to the left wing", ChatBarX+30, 350);
    text("- Good luck guys.", ChatBarX+30, 430);

    fill(#3ECAFF, ChatAlpha);
    text("- We need to start fighting", ChatBarX+30, 300);
    text("   back!", ChatBarX+30, 320);
    text("- Our right wing is being", ChatBarX+30, 380);
    text("   pushed back. I will go help.", ChatBarX+30, 400);
    text("- I will buy the first drink", ChatBarX+30, 460);
    text("   when we are back.", ChatBarX+30, 480);
    
    if (!RogerCheck){// roger check box
      fill(40, ChatAlpha);
      stroke(ChatWordFill, ChatAlpha);
      rect(ChatBarX+100, 510, 120, 60, 6);
      fill(ChatWordFill, ChatAlpha);
      textSize(22);
      textAlign(CENTER, CENTER);
      text("Roger", ChatBarX+162, 537);
    }
    else {
      fill(255);
      text("- Roger.",ChatBarX+30,510);
    }

    if (GameSettingPause == 0){
      GameAnimationShipY -= 2;
    }
    if (GameAnimationShipY <= 500) {
      GameAnimationShipY = 500;
      if (!RogerCheck){
        if (GameSettingPause == 0){
          ChatBarX -= 2;
        }
        if (ChatBarX<=1150) {
          ChatBarX = 1150;
          if (GameSettingPause == 0){
            ChatBoxInnerY += 4;
          }
          if (ChatBoxInnerY >= 400) {
            ChatBoxInnerY = 400;
            if(GameSettingPause == 0){
              ChatAlpha += 2;
            }
            if (ChatAlpha >= 255) {
              ChatAlpha = 255;   
              if (mouseX > ChatBarX+100 && mouseX < ChatBarX+220 && mouseY > 510 && mouseY < 570 && GameSettingPause == 0){
                ChatWordFill = 255;
              } else {
                ChatWordFill = 0;
              }
            }
          }
        }
      }
      else {
        if (GameSettingPause == 0){
          FriendShipRotate += 3;
        }
        if (FriendShipRotate >= 90){
          FriendShipRotate = 90;
          if (GameSettingPause == 0){
            FriendShipHorizontal += 3;
          }
          if (FriendShipHorizontal >= 660){
            FriendShipHorizontal = 660;
            if (GameSettingPause == 0){
              ChatBarX += 2;
            }
            if (ChatBarX >= 1450){
              ChatBarX = 1450;
              BeforeGameAnimation = false;
            }
          }
        }
      }
    }
  } 
  else {// Actual Game Play

    
    if (ShieldChargeWordFade == 100 && TransAmChargeWordFade == 100){      
      for (int i = 0; i < myAsteroidNumbers.size(); i++){
        GameObject obj = myAsteroidNumbers.get(i);
        if (obj.Hearts > 0){
          if (!MidGameAnimation && GameSettingPause == 0 && PlayerDead == 0){
            obj.act();
          }
          if (MidGameAnimationBlackScrean < 300){
            obj.show();
          }
          //obj.show();
        }
        else {
          myAsteroidNumbers.remove(i);
        }
      }
      
      
      if(myAsteroidNumbers.size() < 15 && GameSettingPause == 0 && !NoMoreEnemySpawn && PlayerDead == 0){
        //println("}}}}}}}}}");
        for (int k = 0; k < 15; k++){
          myAsteroidNumbers.add(new Asteroids());
        }
      }
      

      for (int i = 0; i < myEnemies.size(); i++){
        Enemy obj = myEnemies.get(i);
        //GameObject obj = myEnemies.get(i);
        if (obj.Hearts > 0){
          if (!MidGameAnimation && GameSettingPause == 0 && PlayerDead == 0){
            obj.act();
          }
          if (MidGameAnimationBlackScrean < 300){
            obj.show();
          }
          //println(">>>>>>>>>>>>>>>>>");
        }
        else {
          myEnemies.remove(i);
          EnemyShotDown++;
        }
      }     
      
      if (!MidGameAnimation && GameSettingPause == 0 && !NoMoreEnemySpawn && PlayerDead == 0){
        AddMoreEnemiesDelay--;
        if (AddMoreEnemiesDelay <= 0){
          AddMoreEnemiesDelay = 0;
          if (EnemyShotDown <= 5){
            AllowEnemyTypes = 0;
            myEnemies.add(new Enemy());
            AddMoreEnemiesDelay = 1200;
          }
          else if (EnemyShotDown < 12){
            int e = (int) random(0,11);
            if (e >= 0 && e <= 3){
              AllowEnemyTypes = 0;
            }
            else {
              AllowEnemyTypes = 1;
            }
            myEnemies.add(new Enemy());
            AddMoreEnemiesDelay = 1800;
          }
          else if (EnemyShotDown > 12 && EnemyShotDown <= 28){
            int e = (int) random(0,11);
            if (e >= 0 && e < 5){
              AllowEnemyTypes = 0;
            }
            else if (e >= 5){
              AllowEnemyTypes = 2;           
            }   
            
            myEnemies.add(new Enemy());
            if (AllowEnemyTypes == 0){
              AddMoreEnemiesDelay = 1800;
            }
            else {
              AddMoreEnemiesDelay = 3000;// 5000
            }    
          }
        }     
      }
      
      
      
      if (EnemyShotDown > 28 && myEnemies.size() == 0){
        NoMoreEnemySpawn = true;
      }      
      if (NoMoreEnemySpawn && myAsteroidNumbers.size() == 0){// 0 Enemy, No More Asteroids Spawn
        NoMoreAsteroids = true;
      }      
      
      
      
      if (PlayerDead == 0){
        if (NoMoreAsteroids && NoMoreEnemySpawn && myEnemies.size() == 0 && myAsteroidNumbers.size() == 0){// No More Enemies and Asteroids
          GameEndDelay++;
          if (GameEndDelay >= 600){
            GameEndDelay = 600;
            GameEndingBlackScreenAlpha+=2;
            if (GameEndingBlackScreenAlpha >= 400){
              GameEndingBlackScreenAlpha = 400;
              GameMode = FinalAnimation;
            }
          }
        }
      }
      else {
        GameEndDelay++;
        Friend2Explosion.play();
        if (GameEndDelay < 10){
          for (int e = 0; e < 60; e++){
            myGameObjects.add(new CollidingParticles(myJet.Position.x, myJet.Position.y, 10)); 
          }
        }
        if (GameEndDelay >= 200){
          GameEndDelay = 200;
          
          GameEndingBlackScreenAlpha+=2;
          if (GameEndingBlackScreenAlpha >= 500){
            GameEndingBlackScreenAlpha = 500;
            GameMode = FinalAnimation;
          }
        }
      }
      
      
      
      if (EnemyShotDown == 12){
        Shooting = false;
        TransAmMode = false;
        TransAmBackground = 255;// 130
        MoveForward = false;
        MoveBackward = false;
        RotateLeft = false;
        RotateRight = false;
        Shield = false;
        ShipImmortal = 0;       
        ShieldActivateTime = 1500;
        ShieldBarX = 0;
        MidGameAnimation = true;
        if (GameSettingPause == 0){
          MidGameAnimationBlackScrean++;
        }
        if (MidGameAnimationBlackScrean >= 350){
          MidGameAnimationBlackScrean = 350;
        }      
      }
      else {
        MidGameAnimation = false;
      }
      
      if (!MidGameAnimation && GameSettingPause == 0 && PlayerDead == 0){
        myJet.act();
      }
    }

    
    if (GameSettingPause == 0){
      ShieldChargeWordFade++;
      TransAmChargeWordFade++;
      MissionTeskWordFade++;
      MyShipHeartsFade++;
    }
    if (ShieldChargeWordFade >= 100) ShieldChargeWordFade = 100;
    if (TransAmChargeWordFade >= 100) TransAmChargeWordFade = 100;
    if (MissionTeskWordFade >= 100) MissionTeskWordFade = 100;
    if (MyShipHeartsFade >= 100) MyShipHeartsFade = 100;
    
    
    if (MidGameAnimation || GameSettingPause == 1 || GameEndingBlackScreenAlpha > 255){
      Name.pause();
      TransAm.pause();
      WithoutFailCut.pause();
      TransAmVoice.pause();  
      Laser.pause();
      Enemy2Laser.pause();
      ShipAsteroidsCollision.pause();
      ShipEnemyCollision.pause();       
      Enemy1Laser.pause();
    }
    
    if (!MidGameAnimation && GameSettingPause == 0 && GameEndingBlackScreenAlpha <= 255){
      if (!FinalMusicPlay){
        Name.play();
        TransAm.play();
        if (!TransAm.isPlaying()){
          TransAm.rewind();
          TransAm.play();
        }
      }
      else {
        WithoutFailCut.play();
        if (!WithoutFailCut.isPlaying()){
          WithoutFailCut.rewind();
          WithoutFailCut.play();
        }
      }
    }
    
    
    if (MidGameAnimationBlackScrean == 350){
      pushMatrix();
        translate(width/2, 510);
        rotate(-PI/2 + radians(MigAnimationMyShipAngle));
        image(SpaceShip,0,0,110,95); 
      popMatrix();
      
      pushMatrix();
        translate(MidAnimationFriendGrayX,510);
        rotate(-PI);
        image(SpaceShipFriend2,0,0,110,95);// Friend 2 gray;
      popMatrix();
      
      if(GameSettingPause == 0){
        MidAnimationFriendGrayX-=3;
      }
      if (MidAnimationFriendGrayX <= 920){
        MidAnimationFriendGrayX = 920;
        if(GameSettingPause == 0){
          MigAnimationMyShipAngle+=2;
        }
        if (MigAnimationMyShipAngle >= 90){
          MigAnimationMyShipAngle = 90; 
          fill(40);
          stroke(200);
          strokeWeight(2);
          if (!EnemyBeamReady){
          beginShape();
            vertex(916,466);
            vertex(908,452);
            vertex(878,452);
            vertex(878,302);
            vertex(1250,302);
            vertex(1250,452);
            vertex(924,452);
          endShape(CLOSE);
          fill(#3ECAFF);
          textSize(18);
          textAlign(CORNER,CORNER);
          text("- John, are you doing ok?",895,328);
          text("- Jenna's ship got shot down, they have",895,360);
          text("   taken her back to the base.", 895, 380);
          }
          fill(40);
          stroke(200);
          strokeWeight(2);
          if (GameSettingPause == 0){
            MidAnimationDialogueDelay1++;
          }
          if (MidAnimationDialogueDelay1 >= 460){
            MidAnimationDialogueDelay1 = 460;
            if (!EnemyBeamReady){
              beginShape();
                vertex(730,466);
                vertex(718,452);
                vertex(680,452);
                vertex(680,410);
                vertex(800,410);
                vertex(800,452);
                vertex(742,452);            
              endShape(CLOSE);
              fill(255);
              textSize(18);
              textAlign(CORNER,CORNER);
              text("- Copy.",693,436);
            }
            if (GameSettingPause == 0){
              MidAnimationDialogueDelay2++;
            }
            if (MidAnimationDialogueDelay2 >= 260){
              MidAnimationDialogueDelay2 = 260;
              fill(#3ECAFF);
              textSize(18);
              textAlign(CORNER,CORNER);
              if (!EnemyBeamReady){
                text("- Alright, let's finish this, I...", 895, 412);
              }
              if (GameSettingPause == 0){
                MidAnimationDialogueDelay3++;
              }
              if (MidAnimationDialogueDelay3 >= 260){
                MidAnimationDialogueDelay3 = 260;
                EnemyBeamReady = true;
                fill(#FF8D40,OrangeBeamMiddleAlpha);
                noStroke();
                rect(847,0,154,900);
                
                stroke(255,0,0);
                strokeWeight(5);
                line(847,-10,847,RedBeamEdgeY);
                line(998,-10,998,RedBeamEdgeY);
                if (GameSettingPause == 0){
                  RedBeamEdgeY+=20;
                }
                if (RedBeamEdgeY >= 960){
                  RedBeamEdgeY = 960;
                  if (GameSettingPause == 0){
                    OrangeBeamMiddleAlpha+=1;
                  }
                  if (OrangeBeamMiddleAlpha >= 255){
                    OrangeBeamMiddleAlpha = 255;
                    if (Friend2Explode != 350 && GameSettingPause == 0){
                      Friend2Explosion.play();
                    }
                    if (GameSettingPause == 0){
                      Friend2Explode++;
                    }
                    if (Friend2Explode < 60 ){
                      for (int i = 0; i < 50; i++){
                        myGameObjects.add(new CollidingParticles(920,510,10)); 
                      }
                    }
                    fill(40);
                    stroke(200);
                    strokeWeight(2);
                    beginShape();
                      vertex(730,466);
                      vertex(718,452);
                      vertex(520,452);
                      vertex(520,410);
                      vertex(800,410);
                      vertex(800,452);
                      vertex(742,452);            
                    endShape(CLOSE);
                    fill(255);
                    textSize(18);
                    textAlign(CORNER,CORNER);
                    text("- NOOOOOOOOOOOOOOO!",533,436);
                    if (Friend2Explode >= 350){
                      Friend2Explode = 350;
                      Friend2Explosion.pause();
                      fill(0,0,0,MidAnimationEndBlackScreenAlpha);
                      noStroke();
                      rect(0,0,width,height);
                      if (GameSettingPause == 0){
                        MidAnimationEndBlackScreenAlpha++;
                      }
                      if (MidAnimationEndBlackScreenAlpha > 280){
                        TransAmVoice.rewind();
                        Friend2Explosion.rewind();
                        ShieldBarX = 0;
                        TransAmBarX = 0;
                        ShieldActivateTime = 2000;
                        TransAmActivateTime = 1000;
                        TransAmBackground = 130;
                        FinalMusicPlay = true;
                        MidGameAnimation = false;
                        MidGameAnimationBlackScrean = 0;
                        EnemyShotDown = 13;
                      }
                    }
                  }
                }
              }               
            }  
          }
        }
      }
    }
    
    if (ShieldChargeWordFade == 100 && TransAmChargeWordFade == 100){
      for (int i = 0; i < myGameObjects.size(); i++) {// Game Particles etc
        GameObject obj = myGameObjects.get(i);
        if (obj.Hearts > 0) {
          if (GameSettingPause == 0){
            obj.act();
          }
          obj.show();
        } 
        else {
          myGameObjects.remove(i);
        }
      }
    }
    
    if (MidGameAnimationBlackScrean < 300 && PlayerDead == 0){
      myJet.show();
    }
  
    
    //image(Enemy1,550,550,90,90);
    //image(Enemy2,500,500,100,100);
    //println(myEnemies.size());    
    //println(AddMoreEnemiesDelay);
    //println(EnemyShotDown);
    //println(myAsteroidNumbers.size());
    //println(AddMoreEnemiesDelay);
    //println(MidGameAnimationBlackScrean);
    //println(MidAnimationEndBlackScreenAlpha);
    //println(myGameObjects.size());
    //println(TransAmBackground);

    
  }
  
  if (MidGameAnimationBlackScrean < 350){
    fill(0,0,0,MidGameAnimationBlackScrean);// Mid Animation Blakc Screen
    noStroke();
    rect(0,0,width,height);
  }  
  
  fill(0,0,0,GameEndingBlackScreenAlpha);
  noStroke();
  rect(0,0,width,height);
    
  if (GameSettingPause == 1){
    GamePauseSetting();      
  } 

  
  
}
//======================================================================================================================

void MusicCheck(){
    if (WithoutFailCut.isPlaying()){
      WithoutFailCutPlaying = 1;   
    }
    else {
      WithoutFailCutPlaying = 0; 
    }
    if (TransAm.isPlaying()){
      TransAmPlaying = 1;
    }
    else {
      TransAmPlaying = 0;
    }
    if (TransAmVoice.isPlaying()){
      TransAmVoicePlaying = 1;
    }
    else {
      TransAmVoicePlaying = 0;
    }
    if (Name.isPlaying()){
      NamePlaying = 1;
    }
    else {
      NamePlaying = 0;
    }
    if (Laser.isPlaying()){
      LaserPlaying = 1;
    }
    else {
      LaserPlaying = 0;
    }
    if (Enemy2Laser.isPlaying()){
      Enemy2LaserPlaying = 1;
    }
    else {
      Enemy2LaserPlaying = 0;
    }
    if (ShipAsteroidsCollision.isPlaying()){
      ShipAsteroidsCollisionPlaying = 1;
    }
    else {
      ShipAsteroidsCollisionPlaying = 0;
    }
    if (ShipEnemyCollision.isPlaying()){
      ShipEnemyCollisionPlaying = 1;
    }
    else {
      ShipEnemyCollisionPlaying = 0;
    }
    if (Enemy1Laser.isPlaying()){
      Enemy1LaserPlaying = 1;
    }
    else {
      Enemy1LaserPlaying = 0;
    }
    if (Enemy3SpawnEnemy1.isPlaying()){
      Enemy3SpawnEnemy1Playing = 1;
    }
    else {
      Enemy3SpawnEnemy1Playing = 0;
    }
    if (Friend2Explosion.isPlaying()){
      Friend2ExplosionPlaying = 1;
    }
    else {
      Friend2ExplosionPlaying = 0;
    }
}
//======================================================================================================================

void MusicPlayAgain(){
  if (WithoutFailCutPlaying == 1){
    WithoutFailCut.play();
  }
  if (TransAmPlaying == 1){
    TransAm.play();
  }
  if (TransAmVoicePlaying == 1){
    TransAmVoice.play();
  }
  if (NamePlaying == 1){
    Name.play();
  }
  if (LaserPlaying == 1){
    Laser.play();
  }
  if (Enemy2LaserPlaying == 1){
    Enemy2Laser.play();
  }
  if (ShipAsteroidsCollisionPlaying == 1){
    ShipAsteroidsCollision.play();
  }
  if (ShipEnemyCollisionPlaying == 1){
    ShipEnemyCollision.play();
  }
  if (Enemy1LaserPlaying == 1){
    Enemy1Laser.play();
  }
  if (Enemy3SpawnEnemy1Playing == 1){
    Enemy3SpawnEnemy1.play();
  }
  if (Friend2ExplosionPlaying == 1){
    Friend2Explosion.play();
  }
}

void GamePauseSetting(){
      fill(0,0,0,OptionBackgroundDarkness);
      noStroke();
      rect(0,0,width,height);
      Friend2Explosion.pause();
      pushMatrix();
        translate(OptionSideBarX,0);
        fill(#0E2E8B);
        stroke(#19C4E0);
        strokeWeight(4);
        rect(0,-5,150,910);// option side bar base
        
        fill(OptionQuitGame);
        stroke(30);
        strokeWeight(3);
        ellipse(72,840,60,60);// leave game button
        line(58,826, 86,852);
        line(58,852, 86,826);
        
        fill(ReturnGame);// return game button
        ellipse(72,70,60,60);
        fill(0);
        noStroke();
        rect(69,66,26,8);
        triangle(53,69, 69,58, 69,84);
      popMatrix();
      
      OptionSideBarX = OptionSideBarX + 20;
      if (OptionSideBarX >= -5){
        OptionSideBarX = -5;
        OptionAbleClick = 1;
      }
      
      if (OptionAbleClick == 1){
        if ( dist(mouseX,mouseY,72,840) < 30){
          OptionQuitGame = 255;
        }
        else {
          OptionQuitGame = 160;
        }
        
        if ( dist(mouseX,mouseY,72,70) < 30){
          ReturnGame = 255;
        }
        else {
          ReturnGame = 160;
        }
      }
      
      if (OptionQuitShow){
        fill(44);
        stroke(160);
        strokeWeight(2);
        rect(470,270,500,250);// Exit Light Base
        fill(37);
        noStroke();
        rect(472,272,496,76);// Exit Top Dark Rect
        
        fill(151);
        textSize(24);
        textAlign(CORNER,CORNER);
        text("Game Restart",500,324);
        fill(204);
        textSize(17);
        text("Are you sure you want to restart the game?",500,390);
        
        fill(30);
        if (QuitButtonShowGame){
          rect(755,470,100,40);// Quit Box
        }
        if (ReturnButtonShowGame){
          rect(860,470,100,40);// Return Box
        }
        
        fill(255);
        text("YES",790,496);
        text("NO",896,496);
        
        if (mouseX > 755 && mouseX < 855 && mouseY > 470 && mouseY < 510){
          QuitButtonShowGame = true;
        }
        else {
          QuitButtonShowGame = false;
        }
        if (mouseX > 860 && mouseX < 960 && mouseY > 470 && mouseY <= 510){      
          ReturnButtonShowGame = true;
        }
        else {
          ReturnButtonShowGame = false;
        }
      } 
}
