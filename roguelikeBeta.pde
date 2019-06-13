//mode framework variables
int mode; 
final int INTRO    = 1;
final int PLAY     = 2;
final int GAMEOVER = 3;
final int PAUSE    = 4;

//keyboard variables
boolean akey, dkey, skey, wkey, enterkey;

//Palette variables
color black = #000000;
color purple = #490A3D;
color pink   = #BD1550;
color orange = #E97F02;
color yellow = #F8CA00;
color green  = #8A9B0F;
color white  = #FFFFFF;

//object variables and lists
Hero myHero;
ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;

//Fog of War
ArrayList<Darkness> fogOfWar;
int brickx = 0;
int bricky = 0;
float dsize = 5;
//float lightRadius = 200;

//map variables
PImage map;
int roomx, roomy, mapWidth, mapHeight;
boolean n, s, e, w; //are there doors in these directions

//animation
ArrayList<PImage> idle;
ArrayList<PImage> walkLeft;
ArrayList<PImage> walkRight;
ArrayList<PImage> walkDown;
ArrayList<PImage> walkUp;
ArrayList<PImage> currentAction;

// =========================================================

void setup() {
  textAlign(CENTER, CENTER);
  size(800, 600, FX2D);  
  myHero = new Hero();
  mode = INTRO;
  map = loadImage("map.png");
  roomx = 1;
  roomy = 1;
  mapWidth = map.width;
  mapHeight = map.height;
  switchRoom();

  //make Enemies
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  for (int i = 0; i < 10; i++) {
    enemyList.add(new Enemy(2, 2));
  }
  enemyList.add(new Chaser(1,1));
  enemyList.add(new Chaser(1,1));
  enemyList.add(new Chaser(1,1));
  enemyList.add(new Chaser(1,1));
  
  //make Fog of War
  fogOfWar = new ArrayList<Darkness>();
  while (bricky < height) {
     fogOfWar.add(new Darkness());
     brickx += dsize;
     if (brickx > width) {
        brickx = 0;
        bricky += dsize;
     }
  }
  
  //load animations
  idle      = new ArrayList<PImage>();
  walkLeft  = new ArrayList<PImage>();
  walkRight = new ArrayList<PImage>();
  walkDown  = new ArrayList<PImage>();
  walkUp    = new ArrayList<PImage>();
  
  idle.add(loadImage("sprites/12449_01.png"));
  
  walkLeft.add(loadImage("sprites/12449_16.png"));
  walkLeft.add(loadImage("sprites/12449_17.png"));
  walkLeft.add(loadImage("sprites/12449_18.png"));
  walkLeft.add(loadImage("sprites/12449_19.png"));
  
  walkRight.add(loadImage("sprites/12449_08.png"));
  walkRight.add(loadImage("sprites/12449_09.png"));
  walkRight.add(loadImage("sprites/12449_10.png"));
  walkRight.add(loadImage("sprites/12449_11.png"));
  
  walkDown.add(loadImage("sprites/12449_12.png"));
  walkDown.add(loadImage("sprites/12449_13.png"));
  walkDown.add(loadImage("sprites/12449_14.png"));
  walkDown.add(loadImage("sprites/12449_15.png"));

  walkUp.add(loadImage("sprites/12449_04.png"));
  walkUp.add(loadImage("sprites/12449_05.png"));
  walkUp.add(loadImage("sprites/12449_06.png"));
  walkUp.add(loadImage("sprites/12449_07.png"));
  
  currentAction = idle;
}
// =========================================================

void draw() {
  if (mode == INTRO) intro();
  else if (mode == PLAY) play();
  else if (mode == GAMEOVER) gameover();
  else if (mode == PAUSE) pause();
  else println("mode error");
}

// =========================================================