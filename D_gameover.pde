void gameover() {
  //draw gameover screen 
  background(green);
  textSize(100);
  fill(255);
  text("GAME OVER", width/2, height/2);
}

void gameoverClicks() {
  //handle clicks in the gameover screen 
  mode = INTRO;
}