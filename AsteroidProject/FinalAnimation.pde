void FinalAnimation(){
  background(0);
  FinalAnimationFadeBlackScreen--; 
  if (FinalAnimationFadeBlackScreen <= 0){
    FinalAnimationFadeBlackScreen = 0;
  }
  
  if (PlayerDead == 1){// Player Dead
    fill(#C60000);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("Mission Failed",width/2,300);
    textSize(28);
    text("You Have Been Shot Down By Enemy Ships",width/2, 400);
    fill(#FFB4B4);
    textSize(18);
    text("You Will Be Sent Back In Time To When",width/2, 500);
    text("The Attack Had Just Began",width/2, 530);
    text("Save Your People For You Are Their Only Hope",width/2, 560);  
  }
  else {// Player Survived
    fill(#81DCFF);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("The Prophets Were Pushed Back",width/2,300);
    fill(0,255,255);
    textSize(28);
    text("Thanks To You",width/2, 400);
    fill(#81DCFF);
    textSize(18);
    text("The 2nd Fleet from Jupiter Had Enough Time",width/2, 460);
    text("To Attack The Enemies From Behind",width/2, 490);
    text("Earth Is Saved For Now, But When They Come Again",width/2, 520);  
    fill(0,255,255);
    textSize(28);
    text("We Need You",width/2, 580);  
  }
  
  fill(30);
  strokeWeight(2);
  stroke(RestartMissionStroke);
  rect(570,635,300,100,3);
  fill(RestartMissionStroke);
  textSize(30);
  text("Restart Mission",width/2,682);   
  
  if (FinalAnimationFadeBlackScreen == 0 && mouseX > 570 && mouseX < 870 && mouseY > 635 && mouseY < 735){
    RestartMissionStroke = 255;
  }
  else {
    RestartMissionStroke = 120;
  }
}
