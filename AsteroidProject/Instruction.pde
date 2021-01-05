void Instruction(){
  background(0);
  
  for (int i = 0; i < 900; i++){
    InstructionBackground s = myInstructionBackground.get(i); 
    s.act();
    s.show();
  }

  
  fill(#00FF4E,InstructionAlpha);
  textSize(40);
  textAlign(CORNER,CORNER);
  
  text("[W]: Forward",300,200);
  text("[A]: Turn Left",300,300);
  text("[D]: Backward",300,400);
  text("[D]: Turn Right",300,500);
  
  text("[SHIFT]: Activate TransAm Mode",700,200);
  text("[SPACE]: Shoot",700,350);
  text("[MOUSE CLICK]: Activate Shield",700,450);
  text("[ ` or ~ ]: Pause Game",700,550);
  
  fill(#00FF9F,InstructionAlpha);
  textSize(20);
  text("(Increase bullet damage)",860,230);
  text("(Increase fire rate)",860,260);
  text("(Shield delivers burning damage to asteroids)",860,290);
  text("(Shield slows asteroids)",860,480);

  if (InstructionClick){
    fill(InstructionFill,InstructionAlpha);
    stroke(#086F27,InstructionAlpha);
    strokeWeight(5);
    rect(600,700,240,80,4);
    fill(#086F27,InstructionAlpha);
    textSize(30);
    textAlign(CENTER,CENTER);
    text("Ready",720,737);
  }
  
  fill(0,InstructionScreenFade);
  noStroke();
  rect(0,0,width,height); 
   
  if (InstructionClick && !InstructionEnd && mouseX > 600 && mouseX < 840 && mouseY > 700 && mouseY < 780){// ready button
    InstructionFill = 35;
  }
  else {
    InstructionFill = 12;
  }
  
  if(!InstructionEnd){
    InstructionScreenFade--;
    if(InstructionScreenFade<=0){// starting fade
      InstructionScreenFade = 0;
      InstructionClick = true;  
    }
  }
  else if (InstructionEnd && InstructionAlpha == 0){
    InstructionScreenFade++;
    if (InstructionScreenFade >= 455){
      InstructionScreenFade = 455;
      GameMode = Game;
    }
  }
  
  if (InstructionEnd){// end letterfade
    InstructionAlpha--;
    if (InstructionAlpha <= 0){
      InstructionAlpha = 0;
    }  
  }

}
