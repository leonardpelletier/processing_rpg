class Enemy {

  float x, y, d, vx, vy;
  int hp, myRoomx, myRoomy;

  Enemy() {
    x = random(120, width-120);
    y = random(120, height-120);
    d = 10;
    hp = 3;
    myRoomx = 1;
    myRoomy = 1;
    vx = 0;
    vy = 0;
  }

  Enemy(int _myRoomx, int _myRoomy) {
    x = random(120, width-120);
    y = random(120, height-120);
    d = 10;
    hp = 3;
    myRoomx = _myRoomx;
    myRoomy = _myRoomy;
    vx = 0;
    vy = 0;
  }

  void show() {
    fill(green);
    stroke(green);
    ellipse(x, y, d, d);
  }

  void act() {
    x = x + vx;
    y = y + vy;

    int i = 0;
    while (i < bulletList.size()) {
      Bullet b = bulletList.get(i);
      if (dist(b.x, b.y, x, y) < b.d/2 + d/2) {
        b.alive = false;
        hp--;
      }
      i++;
    }
  }

  void pointTowardPlayer() {
    PVector direction = new PVector(myHero.x-x, myHero.y-y);
    direction.setMag(3);
    vx = direction.x;
    vy = direction.y;
  }
}