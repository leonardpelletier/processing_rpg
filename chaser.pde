class Chaser extends Enemy {
 
  Chaser (int _roomx, int _roomy) {
     super (_roomx, _roomy);
     pointTowardPlayer();
  }
  
  void act() {
    super.act();
    if (x < 50 || x > width-50 || y < 50 || y > height-50) {
      pointTowardPlayer();
    }
  }
  
}