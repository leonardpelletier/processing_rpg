void play() {
  //draw the game 
  background(white);

  //draw room
  strokeWeight(3);
  stroke(black);
  fill(white);
  rect(100, 100, 600, 400);
  line(0, 0, 100, 100);
  line(800, 600, 700, 500);
  line(800, 0, 700, 100);
  line(0, 600, 100, 500);

  //drawing the exits
  fill(0);
  if (n) ellipse(width/2, 50, 100, 100);
  if (s) ellipse(width/2, height-50, 100, 100);
  if (w) ellipse(50, height/2, 100, 100);
  if (e) ellipse(width-50, height/2, 100, 100);

  //manage the hero
  myHero.show();
  myHero.act();

  //manage the bullets
  int i = 0;
  while (i < bulletList.size()) {
    Bullet b = bulletList.get(i);
    if (b.alive == true) {
      b.show();
      b.act();
      i++;
    } else {
      bulletList.remove(i);
    }
  }

  //manage the enemies
  int j = 0;
  while (j < enemyList.size()) {
    Enemy e = enemyList.get(j);
    if (e.hp > 0) {
      if (e.myRoomx == roomx && e.myRoomy == roomy) {
        e.show();
        e.act();
      }
      j++;
    } else {
      enemyList.remove(j);
    }
  }

  //draw and update fog of war
  int k = 0;
  while (k < fogOfWar.size()) {
    Darkness d = fogOfWar.get(k);
    d.show();
    d.act();
    k++;
  }

  //draw minimap
  int minimapX = 700;
  int minimapY = 25;
  int minimapRes = 5;
  for (int u = 0; u < map.height; u++) {
    for (int v = 0; v < map.width; v++) {
      if (roomx == v && roomy == u) {
        fill(green);
      } else {
        color c = map.get(v, u);
        fill(c);
      }
      rect(minimapX + v*minimapRes, minimapY + u*minimapRes, minimapRes, minimapRes);
    }
  }

  //pausing
  if (enterkey) mode = PAUSE;
}

void playClicks() {
  //handle mouse clicks during the game
  PVector direction = new PVector(mouseX-myHero.x, mouseY-myHero.y);
  direction.setMag(10);
  float k = 0;
  while (k <= 2*PI) {
    direction.rotate(k);
    bulletList.add(new Bullet(direction.x, direction.y));
    k += 2*PI;
  }
}

void switchRoom() {

  n = s = w = e = false;
  bulletList = new ArrayList<Bullet>();

  color here  = map.get(roomx, roomy);
  color north = map.get(roomx, roomy-1); 
  color south = map.get(roomx, roomy+1);
  color east  = map.get(roomx+1, roomy);
  color west  = map.get(roomx-1, roomy);

  if (north != white) n = true;
  if (south != white) s = true;
  if (east != white) e = true;
  if (west != white) w = true;
}