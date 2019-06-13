void keyPressed() {
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'w' || key == 'W') wkey = true;
  if (keyCode == ENTER) enterkey = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'w' || key == 'W') wkey = false;
  if (keyCode == ENTER) enterkey = false;
}

void mousePressed() {
  if (mode == INTRO) introClicks();
  else if (mode == PLAY) playClicks();
  else if (mode == GAMEOVER) gameoverClicks();
  else if (mode == PAUSE) pauseClicks();
}