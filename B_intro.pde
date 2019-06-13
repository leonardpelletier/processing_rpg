void intro() {
  //Draw intro screen;
  background(pink);
  textSize(100);
  fill(255);
  text("ROGUELIKE", width/2, height/2);  
}

void introClicks() {
  //handle mouse clicks in the intro screen
  mode = PLAY;
}