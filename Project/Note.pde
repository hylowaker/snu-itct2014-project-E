class Note {
  
  // coordinates of the note
  int xpos;
  int ypos;
  
  // lane of the note
  int lane;
  
  // time to show up
  int time;
  int speed;
  
  // is the note is visible?
  boolean invisible;
  
  // constants
  int size = 25;
  

  // constructor
  Note(int lane, float time) {
    this(lane, (int)time);
  }
  
  Note(int lane, int time) {
    this.lane = lane;
    this.time = time;
    
    this.xpos = game.lanePos + (this.lane - 1)*game.laneGap;
    this.ypos = 20;
    this.speed = 3;
  }
  
  
  void display() {
    if (this.invisible) {
      return;
    }
    
    if (millis() - songTimer.savedTime - game.starttime > this.time) {
      noStroke();
      rectMode(CENTER);
      fill(210, 130, 210);
      rect(this.xpos, this.ypos, 2*this.size, this.size/2);
      this.ypos += this.speed;
    }
  }
  
  void hide() {
    this.invisible = true;
    this.ypos = -100;
    this.speed = 0;
  }
}
