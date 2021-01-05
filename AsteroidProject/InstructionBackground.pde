class InstructionBackground{
  
  float x;
  float y;
  int Size;
  int NumberOption;
  int Speed;
  
  InstructionBackground(){
    x = random(0,width);
    y = random(0,height);
    Size = (int) random(10,30);
    NumberOption = (int) random(0,10);
    Speed = (int) random(10,15);
  }
  
  void act(){
    y = y + Speed;
    if (y > height){
      y = 0;
      x = random(0,width);
    }

  }
  
  void show(){
    
    fill(#004D09);
    noStroke();
    //ellipse(x,y,Size,Size);
    textSize(Size);
    if (NumberOption==0){
      text("0",x,y);
    }
    else if (NumberOption==1){
      text("1",x,y);
    }
    else if (NumberOption==2){
      text("2",x,y);
    }
    else if (NumberOption==3){
      text("3",x,y);
    }
    else if (NumberOption==4){
      text("4",x,y);
    }
    else if (NumberOption==5){
      text("5",x,y);
    }
    else if (NumberOption==6){
      text("6",x,y);
    }
    else if (NumberOption==7){
      text("7",x,y);
    }
    else if (NumberOption==8){
      text("8",x,y);
    }
    else if (NumberOption==9){
      text("9",x,y);
    }    
  }


}
