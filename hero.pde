class Hero {

  float x, y, d, speed;
  int spriteNum; //which picture is currently shown
  int threshold; //how long until you change spriteNum?
  int count;  //keep track of how much time has passed between
              //frames of animation
  float lightRadius;            

  Hero() {
    spriteNum = 0;
    threshold = 10;
    count = 0;
    x = width/2;
    y = height/2;
    d = 30;
    speed = 2;
    lightRadius = 150;
  }

  void show() {
    //fill(pink);
    //stroke(pink);
    //ellipse(x, y, d, d);

    count++;
    if (count == threshold) {
      count = 0;
      spriteNum++;
    }

    if (spriteNum >= currentAction.size()) {
      spriteNum = 0;
    }

    imageMode(CENTER);
    image(currentAction.get(spriteNum), x, y, d, d*1.5);
    //strokeWeight(1);
    //line(x, y, mouseX, mouseY);
  }

  void act() {
    //flicker light
    lightRadius = lightRadius + random(-5,5);
    if (lightRadius > 200) lightRadius = 200;
    if (lightRadius < 100) lightRadius = 100;
    
    //Check key presses
    if (wkey) {
      y = y - speed;
      currentAction = walkUp;
    }
    if (skey) {
      y = y + speed;
      currentAction = walkDown;
    }
    if (akey) {
      x = x - speed;
      currentAction = walkLeft;
    }
    if (dkey) {
      x = x + speed;
      currentAction = walkRight;
    }

    if (!wkey && !skey && !akey && !dkey) {
      currentAction = idle;
    }
    //Check for walls
    if (x < 100) x = 100;
    if (x > width-100) x = width - 100;
    if (y < 100) y = 100;
    if (y > height-100) y = height - 100;

    if (n) checkNorthExit();
    if (s) checkSouthExit();
    if (e) checkEastExit();
    if (w) checkWestExit();
  }

  void checkNorthExit() {
    if (dist(x, y, width/2, 50) < 65) {
      roomy--;
      x = width/2;
      y = height-115;
      switchRoom();
    }
  }

  void checkSouthExit() {
    if (dist(x, y, width/2, height-50) < 65) {
      roomy++;
      x = width/2;
      y = 115;
      switchRoom();
    }
  }

  void checkEastExit() {
    if (dist(x, y, width-50, height/2) < 65) {
      roomx++;
      x = 115;
      y = height/2;
      switchRoom();
    }
  }

  void checkWestExit() {
    if (dist(x, y, 50, height/2) < 65) {
      roomx--;
      x = width-115;
      y = height/2;
      switchRoom();
    }
  }
}