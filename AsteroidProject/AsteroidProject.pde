import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Jet myJet;
//Enemy myEnemy;
//Bullets myBullets;
//Asteroids myAsteroids;
//Asteroids testAsteroids;
ArrayList <InstructionBackground> myInstructionBackground;
ArrayList <GameObject> myGameObjects;
ArrayList <GameObject> myAsteroidNumbers;
ArrayList <Enemy> myEnemies;
//ArrayList <GameObject> myEnemies;
//===============================================================================================================================================\\

Minim minim;
AudioPlayer WithoutFailFull, WithoutFailCut, TransAm, TransAmVoice, GNDrive, Name, Laser, Enemy2Laser, EnergyShield2, ShipAsteroidsCollision, ShipEnemyCollision, Enemy1Laser, Enemy3SpawnEnemy1, Friend2Explosion;

PImage SpaceShip;
PImage SpaceShipFriend1;
PImage SpaceShipFriend2;
PImage SpaceShipSmoke;
PImage TransAmShip;
PImage Enemy1;
PImage Enemy2;
PImage Enemy3;
PImage Enemy4;
PImage Enemy5;

//int EnemyTypes;

boolean BeginIntroAnimation = false;
int BeginTextNumber = 0;
int IntroScreenChange = 0;

int InstructionScreenFade = 255;
boolean InstructionClick = false;
int InstructionFill = 12;
boolean InstructionEnd = false;
int InstructionAlpha = 255;

int TransAmBackground = 50;// 130
int TransAmChange = 0;
float TransAmMoveIn = 30;

boolean BeforeGameAnimation = true;//  true
int GameAnimationShipY = 941;
int ChatBarX = 1450;
int ChatBoxInnerY = 0;
int ChatAlpha = 0;
int ChatWordFill = 0;
boolean RogerCheck = false;
int FriendShipRotate = 0;
int FriendShipHorizontal = 0;
boolean EnemyShipRandomPosition = false;

boolean MoveForward = false;
boolean MoveBackward = false;
boolean RotateLeft = false;
boolean RotateRight = false;
boolean TransAmMode = false;
boolean Shooting = false;
boolean Shield = false;
int ShipImmortal = 0;

int AddMoreEnemiesDelay = 1000;// 1000
int EnemyShotDown = 0;// 0 Enemy Shot Down
int AllowEnemyTypes = 0;

int AsteroidsHitParticlesDelay = 0;

int ShieldActivateTime = 2000;
int TransAmActivateTime = 1500;
int ShieldDelay = 0;
int TransAmDelay = 0;
float ShieldBarX = 0;
float TransAmBarX = 0;
float ShipHpBarX = 0;
int ShipHpDelay = 350;

int ShieldChargeWordFade = 0;
int TransAmChargeWordFade = 0;
int MissionTeskWordFade = 0;
int MyShipHeartsFade = 0;

boolean MidGameAnimation = false;// false
int MidGameAnimationBlackScrean = 0;
int MidAnimationFriendGrayX = 1640;
int MigAnimationMyShipAngle = 0;
int MidAnimationDialogueDelay1 = 0;
int MidAnimationDialogueDelay2 = 0;
int MidAnimationDialogueDelay3 = 0;
boolean EnemyBeamReady = false;
int RedBeamEdgeY = -10;
int OrangeBeamMiddleAlpha = 0;
int Friend2Explode = 0;
int MidAnimationEndBlackScreenAlpha = 0;
boolean FinalMusicPlay = false;// false

boolean NoMoreEnemySpawn = false;
boolean NoMoreAsteroids = false;
int GameEndDelay = 0;
int GameEndingBlackScreenAlpha = 0;

int GameSettingPause = 0;
int OptionBackgroundDarkness = 0;
int OptionSideBarX = -150;
int OptionQuitGame = 160;
int ReturnGame = 160;
int OptionAbleClick = 0;
boolean OptionQuitShow = false;
boolean QuitButtonShowGame = false; 
boolean ReturnButtonShowGame = false;

int PlayerDead = 0;// 0
int FinalAnimationFadeBlackScreen = 255;
int RestartMissionStroke = 120;

int WithoutFailCutPlaying = 0;
int TransAmPlaying = 0;
int TransAmVoicePlaying = 0;
int GNDrivePlaying = 0;
int NamePlaying = 0;
int LaserPlaying = 0;
int Enemy2LaserPlaying = 0;
int ShipAsteroidsCollisionPlaying = 0;
int ShipEnemyCollisionPlaying = 0;
int Enemy1LaserPlaying = 0;
int Enemy3SpawnEnemy1Playing = 0;
int Friend2ExplosionPlaying = 0;

int GameMode;
final int Intro = 0;
final int Instructions = 1;
final int Game = 2;
final int FinalAnimation = 3;

//===============================================================================================================================================

void setup(){
  
  size(1440,900);
  //fullScreen();
  imageMode(CENTER);
  smooth(100);
  frameRate(110);
  
  GameMode = Intro;
  //GameMode = Instructions;
  //GameMode = Game;
  //GameMode = FinalAnimation;
  
  myJet = new Jet();
  //myEnemy = new Enemy();
  //myBullets = new Bullets();   
  //myAsteroids = new Asteroids();
  //testAsteroids = new Asteroids();
  myInstructionBackground = new ArrayList<InstructionBackground>();
  for (int i = 0; i < 900; i++){
    myInstructionBackground.add(new InstructionBackground());
  }
  
  myEnemies = new ArrayList <Enemy>();
  //myEnemies = new ArrayList <GameObject>();
  //myEnemies.add(new Enemy());
  //myEnemies.add(new Enemy());
   //myEnemies.add(new Enemy());
   // myEnemies.add(new Enemy());
   //  myEnemies.add(new Enemy());
     

  myGameObjects = new ArrayList <GameObject>();
  
  myAsteroidNumbers = new ArrayList <GameObject>();
  for (int i = 0; i < 20; i++){
    myAsteroidNumbers.add(new Asteroids());
    //myEnemies.add(new Enemy());

  }
  
  minim = new Minim(this);
  //WithoutFailFull = minim.loadFile("WithoutFailFull.mp3");
  WithoutFailCut = minim.loadFile("WithoutFailCut.mp3");
  TransAm = minim.loadFile("TransAm.mp3");
  TransAmVoice = minim.loadFile("TransAmVoice.mp3");
  //GNDrive = minim.loadFile("GNDrive.mp3");
  Name = minim.loadFile("Name.mp3");
  Laser = minim.loadFile("Laser.mp3");
  Enemy2Laser = minim.loadFile("Enemy2Laser.mp3");
  ShipAsteroidsCollision = minim.loadFile("ShipAsteroidsCollision.mp3");
  ShipEnemyCollision = minim.loadFile("ShipEnemyCollision.mp3");
  Enemy1Laser = minim.loadFile("Enemy1Laser.mp3");
  Enemy3SpawnEnemy1 = minim.loadFile("Enemy3SpawnEnemy1.mp3");
  Friend2Explosion = minim.loadFile("Friend2Explosion.mp3");

  //TransAmVoice.setVolume(10);
  
  SpaceShip = loadImage("st51.png");//9
  SpaceShipSmoke = loadImage("st51Smoke.png");
  SpaceShipFriend1 = loadImage("Friend1.png");
  SpaceShipFriend2 = loadImage("Friend2.png");
  Enemy1 = loadImage("Enemy54.png");//1
  Enemy2 = loadImage("Enemy2.png");
  Enemy3 = loadImage("Enemy4.png");
  //Enemy4 = loadImage("Enemy4.png");

  
  
  
  
}
//===============================================================================================================================================

void draw(){ 
  //background(0);
  
  if (GameMode == Intro){
    Intro();
  }
  else if (GameMode == Instructions){
    Instruction();
  }
  else if (GameMode == Game){
    Game();    
  }
  else if (GameMode == FinalAnimation){
    FinalAnimation(); 
  }
 

  textAlign(CORNER,CORNER);
  fill(#00B474);
  textSize(18);
  text("fps:",10,23);
  text(frameRate,40,24);

  //fill(0,0,0,0);
  //stroke(0,255,0);
  //ellipse(0,height/2,100,100);
  //ellipse(70,height/2,40,40);
  //ellipse(width/2,800,160,160);
  //ellipse(0,height/2,width,height);
  
  //println(mouseX,mouseY);
  //println(myGameObjects.size());
  //println(myAsteroidNumbers.size());
  //println(myEnemies.size());
  //println(myAsteroidNumbers.size());
  //println(EnemiesAppearDelay);
  //println(AddMoreEnemiesDelay);
  //println(ShieldChargeWordFade);
  //println(GameSettingPause);
  //println(EnemyShotDown);
  //println(ShipHpDelay);
}
