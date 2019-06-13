class Darkness {

  float x, y, w, h, alpha; 

  Darkness() {
    alpha = 255;
    x = brickx;
    y = bricky;
    w = dsize;
    h = dsize;
  }

  void show () {
    rectMode(CORNER);
    fill(0, 0, 0, alpha);
    //stroke(black);
    noStroke();
    rect(x, y, w, h);
  }

  void act() {
    float d = dist(x+w/2, y+h/2, myHero.x, myHero.y);
    alpha = map(d, 0, myHero.lightRadius, -100, 100);
    if (alpha < 0) alpha = 0;
    if (alpha > 255) alpha = 255;
    alpha = 255-alpha;

    int i = 0;
    while (i < bulletList.size()) {
      Bullet b = bulletList.get(i);
      float d2 = dist(x+w/2, y+h/2, b.x, b.y);  
      float bulletalpha = map(d2, 0, 100, 100, 255);         
      if (bulletalpha < 0) bulletalpha = 0;
      if (bulletalpha > 255) bulletalpha = 255;
      alpha += (255-bulletalpha);
      i++;
    }
    //alpha = alpha / (i+1);
    alpha = 255-alpha;
    if (alpha < 0) alpha = 0;
    if (alpha > 255) alpha = 255;
  }
}