void pause() {
  //draw pause screen 
  background(black);
  textSize(100);
  fill(255);
  text("PAUSED", width/2, height/2);
}

void pauseClicks() {
  //handle clicks in the pause screen 
  mode = PLAY;
}