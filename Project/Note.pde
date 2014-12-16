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
  
  PImage noteimg;
  int size = 25;
  int resizer = 0;
  

  // constructor
  Note(int lane, float time) {
    this(lane, (int)time);
  }
  
  Note(int lane, int time) {
    this(lane, time, 3);
  }
  
  Note(int lane, int time, int speed) {
    this.lane = lane;
    this.time = time;
    this.noteimg = loadImage("note.png");
    this.xpos = game.LANE_POS + (this.lane - 1)*game.LANE_GAP;
    this.speed = speed;
    this.ypos = 20;
  }
  
  
  void display() {
    if (this.invisible) {
      return;
    }
    
    
    int timepassed;
    timepassed = millis() - songTimer.savedTime;
    //try { timepassed = player.position(); } catch (NullPointerException e) { timepassed = 1; }
    if (timepassed - game.starttime > this.time) {
      noStroke();
      //rectMode(CENTER);
      //fill(210, 130, 210);
      //rect(this.xpos, this.ypos, 2*this.size + game.noteResizer, this.size/2 + game.noteResizer);
      imageMode(CENTER);
      image(noteimg, this.xpos, this.ypos, 2*this.size + game.noteResizer, this.size/2 + game.noteResizer);
      this.ypos += this.speed;
      //this.ypos = (player.position() - game.starttime - this.time)*this.speed/16;
    }
  }
  
  void hide() {
    this.invisible = true;
    this.ypos = -100;
    this.speed = 0;
  }
}
