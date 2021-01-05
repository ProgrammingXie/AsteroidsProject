void keyPressed(){
  if (GameMode == Game){
    if (!MidGameAnimation && GameSettingPause == 0 && !BeforeGameAnimation && PlayerDead == 0){
      if (keyCode == 'w' || keyCode == 'W') MoveForward = true;
      if (keyCode == 's' || keyCode == 'S') MoveBackward = true;
      if (keyCode == 'a' || keyCode == 'A') RotateLeft = true;
      if (keyCode == 'd' || keyCode == 'D') RotateRight = true;
      if (keyCode == SHIFT){
        TransAmVoice.rewind();
        TransAmVoice.play();
        //GNDrive.play();
        TransAmMode = true;
      }
      if (keyCode == ' ') Shooting = true;
    }
  }
  else if (GameMode == Intro){
    if (key == ' ') BeginIntroAnimation = true;    
  }
  
}
//===============================================================================================================================================

void keyReleased(){
  if (GameMode == Game){
    if (!MidGameAnimation && GameSettingPause == 0 && !BeforeGameAnimation && PlayerDead == 0){
      if (keyCode == 'w' || keyCode == 'W') MoveForward = false;
      if (keyCode == 's' || keyCode == 'S') MoveBackward = false;
      if (keyCode == 'a' || keyCode == 'A') RotateLeft = false;
      if (keyCode == 'd' || keyCode == 'D') RotateRight = false;
      //if (keyCode == SHIFT){
      //  TransAmVoice.pause();
      //  TransAmVoice.rewind();
      //  //GNDrive.pause();
      //  //GNDrive.rewind();
      //  TransAmMode = false;
      //}
      if (keyCode == ' ') Shooting = false;
    }
    if (key == '`' || key == '~'){
      if (OptionQuitShow){
        OptionQuitShow = false;
      }
      else {
        GameSettingOption();
      }
    }
  }
}
//===============================================================================================================================================

void mouseReleased(){
  if (GameMode == Instructions){
    if (InstructionClick && !InstructionEnd && mouseX > 600 && mouseX < 840 && mouseY > 700 && mouseY < 780){// ready button
       InstructionEnd = true;
    }
  }
  else if (GameMode == Game){
    if (ChatAlpha == 255 && mouseX > ChatBarX+100 && mouseX < ChatBarX+220 && mouseY > 510 && mouseY < 570 && GameSettingPause == 0){
      RogerCheck = true;  
    }
    if (OptionAbleClick == 1){
      if ( dist(mouseX,mouseY,72,840) < 30){
        OptionQuitShow = true;
      }
      if ( dist(mouseX,mouseY,72,70) < 30){
        if (OptionQuitShow){
          OptionQuitShow = false;
        } 
        else {
          GameSettingOption();
        }
      }
      if (OptionQuitShow){
        if (mouseX > 755 && mouseX < 855 && mouseY > 470 && mouseY < 510){
          GameMode = Instructions;         
          Name.pause();
          TransAm.pause();
          WithoutFailCut.pause();
          TransAmVoice.pause();
          Laser.pause();
          Enemy2Laser.pause();
          ShipAsteroidsCollision.pause();
          ShipEnemyCollision.pause();       
          Enemy1Laser.pause();
          Enemy3SpawnEnemy1.pause();
          
          InstructionScreenFade = 255;
          InstructionClick = false;
          InstructionFill = 12;
          InstructionEnd = false;
          InstructionAlpha = 255;
          
          TransAmBackground = 50;// 130
          TransAmChange = 0;
          TransAmMoveIn = 30;
          
          BeforeGameAnimation = true;//  true
          GameAnimationShipY = 941;
          ChatBarX = 1450;
          ChatBoxInnerY = 0;
          ChatAlpha = 0;
          ChatWordFill = 0;
          RogerCheck = false;
          FriendShipRotate = 0;
          FriendShipHorizontal = 0;
          EnemyShipRandomPosition = false;
          
          MoveForward = false;
          MoveBackward = false;
          RotateLeft = false;
          RotateRight = false;
          TransAmMode = false;
          Shooting = false;
          Shield = false;
          ShipImmortal = 0;
          
          AddMoreEnemiesDelay = 1000;// 1000
          EnemyShotDown = 0;// 0
          AllowEnemyTypes = 0;
          
          AsteroidsHitParticlesDelay = 0;
          
          ShieldActivateTime = 2000;
          TransAmActivateTime = 1500;
          ShieldDelay = 0;
          TransAmDelay = 0;
          ShieldBarX = 0;
          TransAmBarX = 0;
          ShipHpBarX = 0;
          ShipHpDelay = 350;
          
          ShieldChargeWordFade = 0;
          TransAmChargeWordFade = 0;
          MissionTeskWordFade = 0;
          MyShipHeartsFade = 0;
          
          MidGameAnimation = false;// false
          MidGameAnimationBlackScrean = 0;
          MidAnimationFriendGrayX = 1640;
          MigAnimationMyShipAngle = 0;
          MidAnimationDialogueDelay1 = 0;
          MidAnimationDialogueDelay2 = 0;
          MidAnimationDialogueDelay3 = 0;
          EnemyBeamReady = false;
          RedBeamEdgeY = -10;
          OrangeBeamMiddleAlpha = 0;
          Friend2Explode = 0;
          MidAnimationEndBlackScreenAlpha = 0;
          FinalMusicPlay = false;// false
          
          NoMoreEnemySpawn = false;
          NoMoreAsteroids = false;
          GameEndDelay = 0;
          GameEndingBlackScreenAlpha = 0;
          
          GameSettingPause = 0;
          OptionBackgroundDarkness = 0;
          OptionSideBarX = -150;
          OptionQuitGame = 160;
          ReturnGame = 160;
          OptionAbleClick = 0;
          OptionQuitShow = false;
          QuitButtonShowGame = false; 
          ReturnButtonShowGame = false;
          
          PlayerDead = 0;
          FinalAnimationFadeBlackScreen = 255;
          RestartMissionStroke = 120;
          
          WithoutFailCutPlaying = 0;
          TransAmPlaying = 0;
          TransAmVoicePlaying = 0;
          GNDrivePlaying = 0;
          NamePlaying = 0;
          LaserPlaying = 0;
          Enemy2LaserPlaying = 0;
          ShipAsteroidsCollisionPlaying = 0;
          ShipEnemyCollisionPlaying = 0;
          Enemy1LaserPlaying = 0;
          Enemy3SpawnEnemy1Playing = 0;
          Friend2ExplosionPlaying = 0;
          
          //WithoutFailCutPlaying = 0;
          //TransAmPlaying = 0;
          //TransAmVoicePlaying = 0;
          //GNDrivePlaying = 0;
          //NamePlaying = 0;
          //LaserPlaying = 0;
          //Enemy2LaserPlaying = 0;
          //ShipAsteroidsCollisionPlaying = 0;
          //ShipEnemyCollisionPlaying = 0;
          //Enemy1LaserPlaying = 0;
          //Enemy3SpawnEnemy1Playing = 0;
          //Friend2ExplosionPlaying = 0;
          
          //InstructionScreenFade = 255;
          //InstructionClick = false;
          //InstructionFill = 12;
          //InstructionEnd = false;
          //InstructionAlpha = 255;
          
          //TransAmBackground = 50;// 130
          //TransAmChange = 0;
          //TransAmMoveIn = 30;
          
          //BeforeGameAnimation = true;//  true
          //GameAnimationShipY = 941;
          //ChatBarX = 1450;
          //ChatBoxInnerY = 0;
          //ChatAlpha = 0;
          //ChatWordFill = 0;
          //RogerCheck = false;
          //FriendShipRotate = 0;
          //FriendShipHorizontal = 0;
          //EnemyShipRandomPosition = false;
          
          //MoveForward = false;
          //MoveBackward = false;
          //RotateLeft = false;
          //RotateRight = false;
          //TransAmMode = false;
          //Shooting = false;
          //Shield = false;
          //ShipImmortal = 0;
          
          //AddMoreEnemiesDelay = 1000;// 1000
          //EnemyShotDown = 11;// 0
          //AllowEnemyTypes = 0;
          
          //AsteroidsHitParticlesDelay = 0;
          
          //ShieldActivateTime = 2000;
          //TransAmActivateTime = 1500;
          //ShieldDelay = 0;
          //TransAmDelay = 0;
          //ShieldBarX = 0;
          //TransAmBarX = 0;
          //ShipHpBarX = 0;
          //ShipHpDelay = 350;
          
          //ShieldChargeWordFade = 0;
          //TransAmChargeWordFade = 0;
          //MissionTeskWordFade = 0;
          //MyShipHeartsFade = 0;
          
          //NoMoreEnemySpawn = false;
          //NoMoreAsteroids = false;
          //GameEndDelay = 0;
          //GameEndingBlackScreenAlpha = 0;
          
          //PlayerDead = 0;
          //RestartMissionStroke = 120;
          
          //MidGameAnimation = false;// false
          //MidGameAnimationBlackScrean = 0;
          //MidAnimationFriendGrayX = 1640;
          //MigAnimationMyShipAngle = 0;
          //MidAnimationDialogueDelay1 = 0;
          //MidAnimationDialogueDelay2 = 0;
          //MidAnimationDialogueDelay3 = 0;
          //EnemyBeamReady = false;
          //RedBeamEdgeY = -10;
          //OrangeBeamMiddleAlpha = 0;
          //Friend2Explode = 0;
          //MidAnimationEndBlackScreenAlpha = 0;
          //FinalMusicPlay = false;// false
          
        }
        if (mouseX > 860 && mouseX < 960 && mouseY > 470 && mouseY <= 510){      
          OptionQuitShow = false;
        }
      }
    }
  }
  else if (GameMode == FinalAnimation){
    //if (PlayerDead == 1){
      if (mouseX > 570 && mouseX < 870 && mouseY > 635 && mouseY < 735){
        GameMode = Intro;
        BeginIntroAnimation = false;
        BeginTextNumber = 0;
        IntroScreenChange = 0;
        
        InstructionScreenFade = 255;
        InstructionClick = false;
        InstructionFill = 12;
        InstructionEnd = false;
        InstructionAlpha = 255;
        
        TransAmBackground = 50;// 130
        TransAmChange = 0;
        TransAmMoveIn = 30;
        
        BeforeGameAnimation = true;//  true
        GameAnimationShipY = 941;
        ChatBarX = 1450;
        ChatBoxInnerY = 0;
        ChatAlpha = 0;
        ChatWordFill = 0;
        RogerCheck = false;
        FriendShipRotate = 0;
        FriendShipHorizontal = 0;
        EnemyShipRandomPosition = false;
        
        MoveForward = false;
        MoveBackward = false;
        RotateLeft = false;
        RotateRight = false;
        TransAmMode = false;
        Shooting = false;
        Shield = false;
        ShipImmortal = 0;
        
        AddMoreEnemiesDelay = 1000;// 1000
        EnemyShotDown = 0;// 0
        AllowEnemyTypes = 0;
        
        AsteroidsHitParticlesDelay = 0;
        
        ShieldActivateTime = 2000;
        TransAmActivateTime = 1500;
        ShieldDelay = 0;
        TransAmDelay = 0;
        ShieldBarX = 0;
        TransAmBarX = 0;
        ShipHpBarX = 0;
        ShipHpDelay = 350;
        
        ShieldChargeWordFade = 0;
        TransAmChargeWordFade = 0;
        MissionTeskWordFade = 0;
        MyShipHeartsFade = 0;
        
        MidGameAnimation = false;// false
        MidGameAnimationBlackScrean = 0;
        MidAnimationFriendGrayX = 1640;
        MigAnimationMyShipAngle = 0;
        MidAnimationDialogueDelay1 = 0;
        MidAnimationDialogueDelay2 = 0;
        MidAnimationDialogueDelay3 = 0;
        EnemyBeamReady = false;
        RedBeamEdgeY = -10;
        OrangeBeamMiddleAlpha = 0;
        Friend2Explode = 0;
        MidAnimationEndBlackScreenAlpha = 0;
        FinalMusicPlay = false;// false
        
        NoMoreEnemySpawn = false;
        NoMoreAsteroids = false;
        GameEndDelay = 0;
        GameEndingBlackScreenAlpha = 0;
        
        GameSettingPause = 0;
        OptionBackgroundDarkness = 0;
        OptionSideBarX = -150;
        OptionQuitGame = 160;
        ReturnGame = 160;
        OptionAbleClick = 0;
        OptionQuitShow = false;
        QuitButtonShowGame = false; 
        ReturnButtonShowGame = false;
        
        PlayerDead = 0;
        FinalAnimationFadeBlackScreen = 255;
        RestartMissionStroke = 120;
        
        WithoutFailCutPlaying = 0;
        TransAmPlaying = 0;
        TransAmVoicePlaying = 0;
        GNDrivePlaying = 0;
        NamePlaying = 0;
        LaserPlaying = 0;
        Enemy2LaserPlaying = 0;
        ShipAsteroidsCollisionPlaying = 0;
        ShipEnemyCollisionPlaying = 0;
        Enemy1LaserPlaying = 0;
        Enemy3SpawnEnemy1Playing = 0;
        Friend2ExplosionPlaying = 0;
      }
    //}
    //else {
    
    //}
  }
}
//===============================================================================================================================================

void GameSettingOption(){
  if (GameSettingPause == 0){
    MusicCheck();
    GameSettingPause = 1;
    OptionBackgroundDarkness = 180;
    MoveForward = false;
    MoveBackward = false;
    RotateLeft = false;
    RotateRight = false;
    TransAmMode = false;
    Shooting = false;
    Shield = false;
  }
  else if (GameSettingPause == 1){
    GameSettingPause = 0;
    OptionBackgroundDarkness = 0;
    MusicPlayAgain();
    OptionSideBarX = -150;
    OptionAbleClick = 0;
    OptionQuitShow = false;
  }    
}
