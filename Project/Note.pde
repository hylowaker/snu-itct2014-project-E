class Note {
  
  // coordinates of the note
  int xpos;
  int ypos;
  
  // lane of the note
  int lane;
  
  // time to show up
  int time;
  
  // constants
  int radius;
  int speed;

  // constructor
  Note(int _laneNo, int _time) {
    lane = _laneNo;
    time = _time;
    radius = 30;
    speed = 3;
    
    xpos = game.lanePos + (lane - 1)*game.laneGap;
    ypos = 20;

    /*
    switch(lane) {
    case 1:
      xpos = 50 + 10; 
      ypos = 20;
      break;
    case 2:
      xpos = 50 + 150 + 10; 
      ypos = 20;
      break;
    case 3:
      xpos = 50 + 300 + 10; 
      ypos = 20;
      break;
    case 4:
      xpos = 50 + 450 + 10; 
      ypos = 20;
      break;
    default:
      xpos = 1000; 
      ypos = 1000;
      break;
    }
    */
  }
  
  void display() {
    if (millis() > time) {
      fill(255, 0, 255);
      ellipse(xpos, ypos, 2*radius, 2*radius);
      ypos += speed;
    }
  }
}

